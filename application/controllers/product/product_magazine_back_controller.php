<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once(APPPATH."controllers/product/product_init_controller.php");

class Product_magazine_back_controller extends Product_init_controller {

	function __construct(){
		parent::__construct();
		for_staff_or_higher();
		$this->data["mode"] = "backend";
		
		$this->lang->load('product');
		$this->lang->load('product_magazine');

		$this_product_type_aid = '2';
		$this->data["this_product_type_aid"] = $this_product_type_aid;

		$this->data["lang_product_magazine_volumn"] = $this->lang->line('product_magazine_volumn');
		$this->data["lang_product_magazine_issue"] = $this->lang->line('product_magazine_issue');

		define("thisAdminSubMenu",'general_info');
		@define("folderName",'product/product_back/magazine');
		
		define("TXT_TITLE",'Magazine management');
		define("TXT_INSERT_TITLE",'Magazine form : Add new magazine');
		define("TXT_UPDATE_TITLE",'Magazine form : Edit magazine');
				
		$this->main_model = 'Magazine_model';

		$this->load->model($this->magazine_main_model,"magazine_main");
	}
	
	function index($product_main_url=""){
		$this->data["init_adv_search"] = "clear";
		$this->show($product_main_url);
	}

	function show($product_main_url=""){
		define("thisAdminTabMenu",'product_magazine_'.$product_main_url);
		@define("thisAction",'show');
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["view_the_content"] = $this->default_theme_admin . '/' . folderName . '/magazine_list';
		$this->data["header_title"] = TXT_TITLE;

		$product_main_result = $this->check_exits_product_main_by_url($product_main_url, false);
		$this->data["product_main_result"] = $product_main_result;
		$product_main_aid = get_array_value($product_main_result,"aid","");

		$this->load->model($this->product_category_model,"category");
		$this->data["master_product_category"] = $this->category->load_category_by_product_main($product_main_aid);
		
		$this->load->view($this->default_theme_admin.'/tpl_admin', $this->data);
	}
	
	function form($product_main_url=""){
		define("thisAdminTabMenu",'product_magazine_'.$product_main_url);
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["view_the_content"] = $this->default_theme_admin . '/' . folderName . '/magazine_form';

		$product_main_result = $this->check_exits_product_main_by_url($product_main_url, false);
		$this->data["product_main_result"] = $product_main_result;
		$product_main_aid = get_array_value($product_main_result,"aid","");
		
		$this->load->model($this->product_category_model,"category");
		$this->data["master_product_category"] = $this->category->load_category_by_product_main($product_main_aid);
		
		$this->data["master_magazine_main"] = $this->magazine_main->get_magazine_main_by_product_main_aid($product_main_aid);
		
		$this->load->view($this->default_theme_admin.'/tpl_admin',$this->data);
	}
	
	function add($product_main_url="", $init_magazine_main_aid=""){
		@define("thisAction",'add');
		$this->data["command"] = '_insert';
		$this->data["header_title"] = TXT_INSERT_TITLE;

		$this->session->set_userdata('productMagazineBackDataSearchSession','');
		$this->data["init_magazine_main_aid"] = $init_magazine_main_aid;
		$this->form($product_main_url);
	}
	
	function edit($product_main_url="", $aid=""){
		@define("thisAction",'edit');
		$this->data["command"] = '_update';
		$this->data["header_title"] = TXT_UPDATE_TITLE;
		$this->load->model($this->main_model,'main');
		$this->main->set_where(array("aid"=>$aid, "user_owner_aid"=>getUserOwnerAid($this)));
		$parent_detail = $this->main->load_record(true);

		if(is_var_array($parent_detail)){
			$this->data["parent_detail"] = $parent_detail;
			$this->data["header_title"] = TXT_UPDATE_TITLE . " : " .get_array_value($parent_detail,"title","");
			$this->form($product_main_url);
		}else{
			$this->data["message"] = set_message_error('Cannot find the specific magazine.');
			$this->data["js_code"] = '';
			$this->show($product_main_url);
			return "";
		}
	}
	
	function save(){
		@define("thisAction",'save');
		$command = $this->input->get_post('command');
		$save_option = $this->input->get_post('save_option');

		$product_type_aid = $this->data["this_product_type_aid"];

		$product_main_aid = $this->input->get_post('product_main_aid');
		$product_main_result = $this->check_exits_product_main_by_aid($product_main_aid, false);
		$product_main_url = get_array_value($product_main_result,"url","");

		$magazine_main_aid = $this->input->get_post('magazine_main_aid');
		$magazine_main_detail = $this->check_exits_magazine_main($product_main_url, $magazine_main_aid, false);

		$user_owner_aid = $this->get_user_owner_aid_by_input();

		if($command == "_update"){
			$this->data["header_title"] = TXT_UPDATE_TITLE;
			$aid = $this->input->get_post('aid');
			$this->load->model($this->magazine_field_model,'field');
			$this->field->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
			$this->field->set_where("product_main_field_aid !=","0");
			$this->field->delete_records();
			
			$this->load->model($this->magazine_ref_product_category_model, 'ref_category');
			$this->ref_category->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
			$this->ref_category->delete_records();

			$this->load->model($this->magazine_tag_model,'tag');
			$this->tag->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
			$this->tag->delete_records();			
		}else{
			$this->data["header_title"] = TXT_INSERT_TITLE;
		}
		
		$this->load->model($this->main_model,'main');
		$data["user_owner_aid"] = $user_owner_aid;
		$data["product_main_aid"] = $product_main_aid;
		$data["product_type_aid"] = $product_type_aid;
		$data["magazine_main_aid"] = $magazine_main_aid;
		$volumn = $this->input->get_post('volumn');
		if(is_number_no_zero($volumn)){
			$data["volumn"] = $volumn;
		}else{
			$data["volumn"] = NULL;
		}
		$issue = $this->input->get_post('issue');
		if(is_number_no_zero($issue)){
			$data["issue"] = $issue;
		}else{
			$data["issue"] = NULL;
		}
		$data["desc"] = $this->input->get_post('desc');
		$data["publisher_aid"] = get_array_value($magazine_main_detail,"publisher_aid","");
		$data["status"] = $this->input->get_post('status');
		$data["weight"] = $this->input->get_post('weight');
		$data["is_new"] = $this->input->get_post('is_new');
		$data["is_recommended"] = $this->input->get_post('is_recommended');
		$data["is_home"] = $this->input->get_post('is_home');
		$data["publish_date"] = get_datetime_pattern("db_date_format",$this->input->get_post('publish_date'),get_db_now('%Y-%m-%d'));
		$data["expired_date"] = get_datetime_pattern("db_date_format",$this->input->get_post('expired_date'),NULL);
		$data["reward_point"] = $this->input->get_post('reward_point');
				
		$category_list = "";
		$category = $this->input->get_post('category');
		// echo "category : ".$category;
		if(is_var_array($category)){
			$category_list = ",";
			foreach($category as $item){
				$category_list .= $item.',';
			}
			// $category_list = substr($category_list, 1);
		}
		$data["category"] = $category_list;

		//tag
		$all_tag = "";
		$tag = $this->input->get_post('tag');
		// echo "tag : ".$tag;
		if(!is_blank($tag)){
			$tag = explode(",", $tag);
			if(is_var_array($tag)){
				$all_tag = ",";
				foreach($tag as $item){
					$item = trim($item);
					if(!is_blank($item)){
						$all_tag .= $item.',';
					}
				}
				// $all_tag = substr($all_tag, 1);
			}
		}
		if(!is_blank($all_tag)){
			$tag = $all_tag;
		}
		
		$data["tag"] = $tag;	
						
		if($command == "_insert"){
			$data["total_view"] = 0;
			$data["total_view_web"] = 0;
			$data["total_view_device"] = 0;
			$data["total_download"] = 0;
			$data["total_download_web"] = 0;
			$data["total_download_device"] = 0;
			$data["total_read"] = 0;
			$data["total_read_web"] = 0;
			$data["total_read_device"] = 0;
			$data["total_rental"] = 0;
			$data["review_point"] = 0;

			if($this->check_duplicate($data,$command)){
				$this->data["message"] = set_message_error(get_array_value($data,"error_msg","Duplicate data."));
				$this->data["js_code"] = "";
				$this->data["command"] = $command;
				$this->data["parent_detail"] = $data;
				$this->form($product_main_url);
				return "";
			}
			
			$aid = $this->main->insert_record($data);
			if($aid > 0){
				$this->magazine_main->update_parent($magazine_main_aid);
				$this->main->update_parent($aid);
				$result = $this->save_category($product_type_aid,$aid,$category);
				$result = $this->save_tag($product_type_aid,$aid,$tag);
				$magazine_obj = $this->save_field($product_type_aid,$product_main_aid,$aid);
				$name = get_array_value($magazine_obj,"title","-");
				$author = get_array_value($magazine_obj,"author","");
				$data["aid"] = $aid;
				$this->log_status('Backend : Insert magazine', '['.$name.']['.$aid.'] just added into database.', $data);
				$this->log_product_save($product_type_aid, $aid, $name, "I", "New magazine has been added.", $data, "magazine-add");
				
				$path = "uploads/".CONST_PROJECT_CODE."/magazine/".ceil($aid/100);
				$data = $this->upload_cover_image($aid, $data, $path);
				if ( !is_blank(get_array_value($data,"error_msg","")) )
				{
					// echo $data["error_msg"];
					$this->log_status('Backend : Insert magazine', 'Save magazine fail => Upload image error : '.$data["error_msg"], $data);
					$this->data["message"] = set_message_error(get_array_value($data,"error_msg","Sorry, the system can not save data now. Please try again or contact your administrator."));
					$this->data["js_code"] = "";
					$this->data["command"] = $command;
					$this->data["parent_detail"] = $data;
					$this->form($product_main_url);
					return "";
				}	
								
				$cid = get_text_pad($aid,"0",CONST_ZERO_PAD_FOR_PRODUCT);
				$this->load->model($this->main_model,"main");
				$data_where = array();
				$data_where["aid"] = $aid;
				$data_new = array();
				$data_new["cid"] = $cid;
				$data_new["title"] = $name;
				$data_new["author"] = $author;
				$data_new["upload_path"] = get_array_value($data,"upload_path","");
				$data_new["cover_image_file_type"] = get_array_value($data,"cover_image_file_type","");
				$this->main->set_where($data_where);
				$this->main->update_record($data_new);

				//cron_job
				$this->update_all_view_save();
				//end cron_job
				
				redirect('admin/product-'.$product_main_url.'/magazine/edit/'.$aid.'/copy/add');
			}else{
				$this->log_error('Backend : Insert magazine', 'Command insert_record() fail. Can not insert '.$name, $data);
				$this->data["message"] = set_message_error('Sorry, the system can not save data now. Please try again or contact your administrator.');
				$this->data["js_code"] = '';
				$this->data["command"] = $command;
				$this->data["parent_detail"] = $data;
				$this->form($product_main_url);
				return "";
			}
						
		}else if($command == "_update"){
			$aid = $this->input->get_post('aid');
			$data["aid"] = $aid;
			if($this->check_duplicate($data,$command)){
				$this->data["message"] = set_message_error(get_array_value($data,"error_msg","Duplicate data."));
				$this->data["js_code"] = "";
				$this->data["command"] = $command;
				$this->data["parent_detail"] = $data;
				$this->form($product_main_url);
				return "";
			}
			
			$data_where["aid"] = $aid;
			$this->main->set_where($data_where);
			$rs = $this->main->update_record($data, $data_where);
			if($rs){
				$this->magazine_main->update_parent($magazine_main_aid);
				$this->main->update_parent($aid);
				$result = $this->save_category($product_type_aid,$aid,$category);
				$result = $this->save_tag($product_type_aid,$aid,$tag);
				$magazine_obj = $this->save_field($product_type_aid,$product_main_aid,$aid);
				$name = get_array_value($magazine_obj,"title","-");
				$author = get_array_value($magazine_obj,"author","");
				$this->data["message"] = set_message_success('Data has been saved.');
				if ($aid > 0) $this->log_status('Admin : Update magazine',  '['.$name.']['.$aid.'] has been updated.', $data);
				$this->log_product_save($product_type_aid, $aid, $name, "U", "General info has been updated.", $data, "magazine-update");
				$path = "uploads/".CONST_PROJECT_CODE."/magazine/".ceil($aid/100);
				$data = $this->upload_cover_image($aid, $data, $path);
				if ( !is_blank(get_array_value($data,"error_msg","")) )
				{
					// echo $data["error_msg"];
					$this->log_status('Backend : Update magazine', 'Save magazine fail => Upload image error : '.$data["error_msg"], $data);
					$this->data["message"] = set_message_error(get_array_value($data,"error_msg","Sorry, the system can not save data now. Please try again or contact your administrator."));
					$this->data["js_code"] = "";
					$this->data["command"] = $command;
					$this->data["parent_detail"] = $data;
					$this->form($product_main_url);
					return "";
				}	

				$save_image = get_array_value($data,"save_image","");
				$this->load->model($this->main_model,"main");
				$data_where = array();
				$data_where["aid"] = $aid;
				$data_new = array();
				$data_new["title"] = $name;
				$data_new["author"] = $author;
				if($save_image == "1"){
					$data_new["upload_path"] = get_array_value($data,"upload_path","");
					$data_new["cover_image_file_type"] = get_array_value($data,"cover_image_file_type","");
				}
				$this->main->set_where($data_where);
				$this->main->update_record($data_new);

				//cron_job
				$this->update_all_view_save();
				//end cron_job
				
				if($save_option){
					redirect('admin/product-'.$product_main_url.'/magazine/add');
				}else{
					redirect('admin/product-'.$product_main_url.'/magazine/edit/'.$aid);
					// redirect('admin/product-'.$product_main_url.'/magazine/status/'.md5('success'));
				}
				return "";
			}else{
				$this->log_error('Backend : Update magazine', 'Command update_record() fail. Can not update '.$name.'['.$aid.']', $data);
				$this->data["message"] = set_message_error('Sorry, the system can not save data now. Please try again or contact your administrator.');
				$this->data["js_code"] = '';
				$this->data["command"] = $command;
				$this->data["parent_detail"] = $data;
				$this->form($product_main_url);
				return "";
			}
			
		}else{
			$this->log_error('Backend : Magazine', 'Command not found.', $data);
			redirect('admin/product-'.$product_main_url.'/magazine/status/'.md5('no-command'));
			return "";
		}
	}
	
	function check_duplicate($data="", $command=""){
		return false;
	}
			
	function ajax_set_value($sid=""){
		@define("thisAction",'ajax_set_value');
		if(!is_staff_or_higher()){
			$msg = set_message_error('Error occurred. Permission denied.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
		$aid = $this->input->get_post('aid_selected');
		$f_name = $this->input->get_post('f_name');
		$f_value = $this->input->get_post('f_value');
		if(is_blank($aid) || is_blank($f_name)){
			$msg = set_message_error('Error occurred. Data is null.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}

		// echo "f_name = $f_name , f_value = $f_value <BR>";

		$user_owner_aid = getUserOwnerAid($this);
		$this->load->model($this->main_model,'main');
		$this->main->set_where(array("aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$objResult = $this->main->load_record(false);
		if(!is_var_array($objResult)){
			$msg = set_message_error('Error occurred. Can not find this magazine.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
		$this_obj_info = get_array_value($objResult, 'title', $aid).' [aid = '.$aid.']';
		
		$this->main->set_where(array("aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$rs = $this->main->set_value($f_name, $f_value);
		
		if ($rs){
			$this->log_status('Backend : Magazine', 'Set value : "'.$f_name.'" has been set to "'.$f_value.'" for '.$this_obj_info.'.', $objResult);
			$msg = set_message_success('Data has been saved.');
			$result_obj = array("status" => 'success',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}else{
			$this->log_error('Backend : Magazine', 'Set value : Function main->set_value() fail. Can not set "'.$f_name.'" to "'.$f_value.'" for '.$this_obj_info.'.', $objResult);
			$msg = set_message_error('Sorry, the system can not save data now. Please try again or contact your administrator.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
	}
		
	function ajax_delete_one(){
		@define("thisAction",'ajax_delete_one');
		if(!is_owner_admin_or_higher()){
			$msg = set_message_error('Error occurred. Permission denied.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}

		$aid = $this->input->post('aid_selected');
		if(is_blank($aid)){
			$msg = set_message_error('Error occurred. Aid is null.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
		
		$user_owner_aid = getUserOwnerAid($this);
		$this->load->model($this->main_model,'main');
		$this->main->set_where(array("aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$objResult = $this->main->load_record(false);
		if(!is_var_array($objResult)){
			$msg = set_message_error('Error occurred. Can not find this magazine.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
		$this_obj_info = trim(get_array_value($objResult, "title", "N/A").' [aid = '.$aid.']');
		$this_obj_title = get_array_value($objResult, "title", $aid);
		
		$this->load->model($this->magazine_copy_model,'copy');
		$this->copy->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$magazine_copy_list = $this->copy->load_records(false);
		if(is_var_array($magazine_copy_list)){
			foreach($magazine_copy_list as $item){
				$upload_path = get_array_value($item,"upload_path","");
				// echo "upload_path = $upload_path";
				deleteDir($upload_path);

				$copy_aid = get_array_value($item,"aid","0");
				$this->load->model($this->shelf_model,"shelf");
				$this->shelf->set_where(array("product_type_aid"=>$this->data["this_product_type_aid"], "copy_aid"=>$copy_aid));
				$rs = $this->shelf->delete_records();
			}
		}
		$this->load->model($this->magazine_copy_model,'copy');
		$this->copy->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$this->copy->delete_records();
		
		$this->load->model($this->magazine_field_model,'field');
		$this->field->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$this->field->delete_records();

		$this->load->model($this->magazine_ref_product_category_model,'ref_category');
		$this->ref_category->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$this->ref_category->delete_records();

		$this->load->model($this->magazine_tag_model,'tag');
		$this->tag->set_where(array("parent_aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$this->tag->delete_records();

		$upload_path = get_array_value($objResult,"upload_path","");
		// echo "upload_path = $upload_path";
		deleteDir($upload_path);
		
		$this->main->set_where(array("aid"=>$aid, "user_owner_aid"=>$user_owner_aid));
		$rs = $this->main->delete_records();

		
		//cron_job
		$this->update_all_view_save();
		//end cron_job
		
		if ($rs){
			$this->log_status('Backend : Delete magazine', $this_obj_info.' has been deleted.', $objResult);
			$this->log_product_save($this->data["this_product_type_aid"], $aid, $this_obj_title, "D", "Magazine has been deleted.", $objResult, "magazine-delete");
			$msg = set_message_success($this_obj_title.' has been deleted.');
			$result_obj = array("status" => 'success',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}else{
			$this->log_error('Backend : Delete magazine', 'Command delete_records() fail. Can not delete '.$this_obj_info.'.', $objResult);
			$msg = set_message_error('Sorry, the system can not save data now. Please try again or contact your administrator.');
			$result_obj = array("status" => 'error',"msg" => $msg );
			echo json_encode($result_obj);
			return "";
		}
	}
	
	function ajax_get_main_list($sid){
		@define("thisAction",'ajax_get_main_list');
		$this->load->model($this->main_model,'main');
		$this->db->start_cache();		
		$data_search="";
		$data_where = "";
		
		$this->main->set_where(array("user_owner_aid"=>getUserOwnerAid($this)));

		$dataSearchSession = new CI_Session();
		$dsSession = $dataSearchSession->userdata('productMagazineBackDataSearchSession');		
		// print_r($dsSession);
		
		$search_post_word = $this->getDataFromInput('search_post_word');
		$data_search["search_post_word"] = $search_post_word;
		$search_in = $this->getDataFromInput('search_in');
		
		// echo "search_in : ".$search_in;
		if(!is_blank($search_post_word) && is_var_array($search_in))
		foreach($search_in as $item){
			$data_where[$item] = $search_post_word;
			$data_search["search_in"][] = $item;
		}
		$this->main->set_and_or_like($data_where);
		
		$search_status = $this->getDataFromInput('search_status');
		$data_where = "";
		if(is_var_array($search_status))
		foreach($search_status as $item){
			$data_where["status"][] = $item;
			$data_search["search_status"][] = $item;
		}
		$this->main->set_where_in($data_where);
		
		$created_date_from = $this->getDataFromInput('created_date_from');
		$created_date_to = $this->getDataFromInput('created_date_to');
		$data_search["created_date_from"] = $created_date_from;
		$data_search["created_date_to"] = $created_date_to;
		
		if(!is_blank($created_date_from)){
			$this->main->set_where($this->main->get_table_name().'.created_date >=', get_datetime_pattern("db_date_format",$created_date_from,"")." 00:00:00");
		}
		if(!is_blank($created_date_to)){
			$this->main->set_where($this->main->get_table_name().'.created_date <=', get_datetime_pattern("db_date_format",$created_date_to,"")." 23:59:59");
		}

		$search_product_category = $this->getDataFromInput('search_product_category');
		$data_where = "";
		if(is_var_array($search_product_category))
		foreach($search_product_category as $item){
			$data_where[] = $item;
			$data_search["search_product_category"][] = $item;
		}
		$this->main->set_and_or_like_by_field("category", $data_where);

		$product_main_aid = $this->input->get_post('product_main_aid');
		$this->main->set_where(array("product_main_aid"=>$product_main_aid));

		$search_record_per_page = $this->getDataFromInput('search_record_per_page', CONST_DEFAULT_RECORD_PER_PAGE);
		$optional = array();
		$optional["total_record"] = $this->main->count_records(true);
		$optional["page_selected"] = $this->getDataFromInput('page_selected');
		$optional["record_per_page"] = $search_record_per_page;
		$optional = $this->get_pagination_info($optional);
		$data_search["page_selected"] = get_array_value($optional,"page_selected","");
		$data_search["search_record_per_page"] = get_array_value($optional,"search_record_per_page",CONST_DEFAULT_RECORD_PER_PAGE);
		$this->main->set_limit(get_array_value($optional,"start_record","0"),get_array_value($optional,"search_record_per_page",CONST_DEFAULT_RECORD_PER_PAGE));
		
		$search_order_by = $this->getDataFromInput('search_order_by');
		$data_search["search_order_by"] = $search_order_by;
		$order_by_option = $this->get_order_by_info($search_order_by,'aid desc');
		$this->main->set_order_by(get_array_value($order_by_option,"order_by_txt",""));
		
		$result_list = $this->main->load_records(true);
		// echo "<br>sql : ".$this->db->last_query()."<br>";
		$result_list = $this->manage_column_detail($result_list);
		$this->db->flush_cache();
		$optional["total_in_page"] = count($result_list);
		
		$header_list = array();
		$header_list[] = array("sort_able"=>'0',"title_show"=>'Cover',"field_order"=>'',"col_show"=>'cover_image_small_action',"title_class"=>'hidden-xs w100 a-center',"result_class"=>'hidden-xs a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Magazine Name',"field_order"=>'title',"col_show"=>'title_action',"title_class"=>'w150 a-center',"result_class"=>'a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Author',"field_order"=>'author',"col_show"=>'author',"title_class"=>'hidden-xs hidden-sm hidden-md w100 a-center',"result_class"=>'hidden-xs hidden-sm hidden-md a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Publisher Name',"field_order"=>'publisher_aid',"col_show"=>'publisher_name',"title_class"=>'hidden-xs hidden-sm hidden-md w100 a-center',"result_class"=>'hidden-xs hidden-sm hidden-md a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'#copy',"field_order"=>'total_copy',"col_show"=>'total_copy',"title_class"=>'hidden-xs hidden-sm hidden-md w30 a-center',"result_class"=>'hidden-xs hidden-sm hidden-md a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Status',"field_order"=>'status',"col_show"=>'status_action',"title_class"=>'hidden-xs w50 a-center',"result_class"=>'hidden-xs a-center');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Most Popular',"field_order"=>'is_new',"col_show"=>'is_new_action',"title_class"=>'hidden-xs w50 a-center',"result_class"=>'hidden-xs a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'Librarian\'s Choice',"field_order"=>'is_recommended',"col_show"=>'is_recommended_action',"title_class"=>'hidden-xs w50 a-center',"result_class"=>'hidden-xs a-left');
		$header_list[] = array("sort_able"=>'1',"title_show"=>'New Releases',"field_order"=>'is_home',"col_show"=>'is_home_action',"title_class"=>'hidden-xs w50 a-center',"result_class"=>'hidden-xs a-left');
		$header_list[] = array("sort_able"=>'0',"title_show"=>'&nbsp;',"field_order"=>'',"col_show"=>'action',"title_class"=>'a-center',"result_class"=>'a-left');	

		$this->session->set_userdata('productMagazineBackDataSearchSession',$data_search);	

		if(is_var_array($result_list)){
			$result_obj = array("status" => 'success', "sorting" => get_array_value($order_by_option,"sorting",""), "optional"=>$optional, "header_list" => $header_list, "result" => $result_list);
			echo json_encode($result_obj);
			return "";
		}else{
			$result_obj = array("status" => 'warning',"msg" => 'No record found.');
			echo json_encode($result_obj);
			return "";
		}
	}
	
	function manage_column_detail($result_list){
		$result = "";
		if(!is_var_array($result_list)){
			return "";
		}

		foreach($result_list as $item){
			$product_main_url = get_array_value($item,"product_main_url","0");
			$item["title_action"] = '<a href="'.site_url('admin/product-'.$product_main_url.'/magazine/edit/'.get_array_value($item,"aid","")).'">'.get_array_value($item,"title","-").'</a>';
			$item["publisher_name"] = get_array_value($item,"publisher_name","-");
			$item["product_main_name"] = get_array_value($item,"product_main_name","-");
			$item["cover_image_small_action"] = '<img class="border-gray" src="'.get_image(get_array_value($item,"cover_image_small_path",""),"small",get_array_value($item,"thumbnail_image","")).'" />';

			$status = get_array_value($item,"status","0");
			if($status == 1){
				$item["status_action"] = '<a class="btn btn-success btn-xs" title="Click to \'Inactive\' this magazine." onclick="processChangeValue(\' inactive <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'status=0\')"><i class="fa fa-check"></i></a>';
			}else{
				$item["status_action"] = '<a class="btn btn-danger btn-xs" title="Click to \'Active\' this magazine." onclick="processChangeValue(\' active <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'status=1\')"><i class="fa fa-ban"></i></a>';
			}

			$status = get_array_value($item,"is_new","0");
			if($status == 1){
				$item["is_new_action"] = '<a class="btn btn-success btn-xs" title="Click to remove new this magazine." onclick="processChangeValue(\' remove new from <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'is_new=0\')"><i class="fa fa-check"></i></a>';
			}else{
				$item["is_new_action"] = '<a class="btn btn-danger btn-xs" title="Click to set new this magazine." onclick="processChangeValue(\' set new to <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'is_new=1\')"><i class="fa fa-ban"></i></a>';
			}

			$status = get_array_value($item,"is_recommended","0");
			if($status == 1){
				$item["is_recommended_action"] = '<a class="btn btn-success btn-xs" title="Click to remove recommended this magazine." onclick="processChangeValue(\' remove recommended from <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'is_recommended=0\')"><i class="fa fa-check"></i></a>';
			}else{
				$item["is_recommended_action"] = '<a class="btn btn-danger btn-xs" title="Click to set recommended this magazine." onclick="processChangeValue(\' set recommended to <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'is_recommended=1\')"><i class="fa fa-ban"></i></a>';
			}

			$status = get_array_value($item,"is_home","0");
			if($status == 1){
				$item["is_home_action"] = '<a class="btn btn-success btn-xs" title="Click to remove this magazine from home" onclick="processChangeValue(\' remove <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong> from home\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").' from home\', \'is_home=0\')"><i class="fa fa-check"></i></a>';
			}else{
				$item["is_home_action"] = '<a class="btn btn-danger btn-xs" title="Click to send this magazine to home" onclick="processChangeValue(\' send <strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong> to home\', \'admin/product/magazine\', \''.get_array_value($item,"aid","").'\', \'is_home=1\')"><i class="fa fa-ban"></i></a>';
			}
			
			$item["action"] = '';
			$item["action"] .= '<a class="btn btn-success btn-xs" title="Click to add magazine from this magazine." onclick="processRedirect(\'admin/product-'.$product_main_url.'/magazine/edit/'.get_array_value($item,"aid","").'/copy/add\')"><i class="fa fa-plus "></i></a>&nbsp;&nbsp;&nbsp;';
			
			if(is_root_admin_or_higher() || (CONST_ALLOW_DELETE_PRODUCT != "0" && is_owner_admin_or_higher())){
				$item["action"] .= '<a class="btn btn-danger btn-xs" title="Click to \'Delete\' this magazine." onclick="processDelete(\''.get_array_value($item,"aid","").'\', \'admin/product/magazine\', \'<strong>'.removeAllQuote(get_array_value($item,"title","")).'</strong>\')"><i class="fa fa-trash-o "></i></a>&nbsp;&nbsp;&nbsp;';
			}
			
			$result[] = $item;
		}
		
		return $result;
	}
	
	function status($product_main_url="", $type="")	{
		switch($type)
		{
			case md5('success') : 
				$this->data["message"] = set_message_success('Data has been saved.');
				$this->data["js_code"] = '';
				break;
			case md5('no-command') : 
				$this->data["message"] = set_message_error('Command is unclear. Please try again.');
				$this->data["js_code"] = '';
				break;
			case md5('no-magazine') : 
				$this->data["message"] = set_message_error('Error occurred. Can not find this magazine.');
				$this->data["js_code"] = '';
				break;
			case md5('copy-type-incorrect') : 
				$this->data["message"] = set_message_error('Error occurred. Type is incorrect.');
				$this->data["js_code"] = '';
				break;
			case md5('copy-possession-incorrect') : 
				$this->data["message"] = set_message_error('Error occurred. Posession is incorrect.');
				$this->data["js_code"] = '';
				break;
			case md5('both-paper-license') : 
				$this->data["message"] = set_message_error('Error occurred. Paper edition cannot be license.');
				$this->data["js_code"] = '';
				break;
			case md5('both-buyout-license') : 
				$this->data["message"] = set_message_error('Error occurred. License edition cannot be buy out.');
				$this->data["js_code"] = '';
				break;
			default : 
				$this->data["message"] = set_message_error('Please try again');
				$this->data["js_code"] = '';
				break;
		}
		$this->show($product_main_url);
	}
	
	function ajax_get_magazine_by_aid($sid,$aid)	{
		$this->load->model($this->main_model,"main");
		$this->main->set_where('aid', $aid);
		$result = $this->main->load_record(false);
		
		if(is_var_array($result)){
			$result_obj = array("status" => "success", "result" => $result);
			echo json_encode($result_obj);
			return"";
		}else{
			$result_obj = array("status" => "warning","msg" => "No record found.");
			echo json_encode($result_obj);
			return"";
		}
	}
	
}

?>