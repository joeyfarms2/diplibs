<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once(APPPATH."controllers/webservice/init_webservice_controller.php");

class Webservice_banner_controller extends Init_webservice_controller {

	function __construct()
	{
		parent::__construct();
		
		$this->ads_model = 'Ads_model';
		$this->ads_category_model = 'Ads_category_model';

	}
	
	function get_banner(){

		$this->check_device();


		$this->load->model($this->banner_model,"banner");
		$this->banner->set_where(array("status" => "1"));

		$this->banner->set_order_by("weight ASC");
		$result = $this->banner->load_records(true);

		if(is_var_array($result))
		{
			$my_result = array();
			foreach ($result as $item) 
			{
				$tmp = array();
				$tmp["aid"] = get_array_value($item,"aid","");
				$tmp["cid"] = get_array_value($item,"cid","");
				$tmp["title"] = get_array_value($item,"title","");
				$tmp["cover_image_actual"] = get_array_value($item,"cover_image_actual","");
				$tmp["cover_image_thumb"] = get_array_value($item,"cover_image_thumb","");

				$tmp["product_category_aid"] = get_array_value($item,"product_category_aid","");
				$tmp["product_category_name"] = get_array_value($item,"product_category_name","");
				$tmp["product_type_aid"] = get_array_value($item,"product_type_aid","");
				$tmp["parent_aid"] = get_array_value($item,"parent_aid","");
				$tmp["ads_menu"] = get_array_value($item,"ads_menu","");
				$tmp["ads_menu_name"] = get_array_value($item,"ads_menu_name",""); 

				$my_result[] = $tmp;
			}
			$result_obj = array("status" => 'success',"msg" => '', "result" => $my_result);

			echo json_encode($result_obj);
			return "";
		}
		else{
			$result_obj = array("status" => 'error',"msg" => 'No record found.', "result" => '');
			echo json_encode($result_obj);
			return "";
		}

		

	}

	
}

?>