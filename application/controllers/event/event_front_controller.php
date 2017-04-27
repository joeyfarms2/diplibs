<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once(APPPATH."controllers/initcontroller.php");

class Event_front_controller extends Initcontroller {

	function __construct(){
		parent::__construct();
		$this->data["mode"] = "front";
		
		if(CONST_HAS_EVENT != "1"){
			redirect('home');
		}

		define("thisFrontTabMenu",'event');
		define("thisFrontSubMenu",'');
		@define("folderName",'event/');
				
		$this->news_model = 'News_model';
		$this->news_main_model = 'News_main_model';
		$this->news_category_model = 'News_category_model';
		$this->news_gallery_model = 'News_gallery_model';
		$this->news_comment_model = 'News_comment_model';
		$this->news_user_activity_model = 'news_user_activity_model';
		$this->news_comment_user_activity_model = 'news_comment_user_activity_model';
		
		$this->event_model = 'Event_model';
		$this->event_main_model = 'Event_main_model';
		$this->event_category_model = 'Event_category_model';
		$this->event_gallery_model = 'Event_gallery_model';
		$this->event_user_activity_join_model = 'Event_user_activity_join_model';
		$this->event_comment_model = 'Event_comment_model';
		$this->event_comment_user_activity_model = 'Event_comment_user_activity_model';
		
		$this->view_most_comments_model = 'View_most_comments_model';
		
		$this->load->model($this->event_main_model,"event_main");
		$this->data["master_event_main"] = $this->event_main->load_event_mains();
		
		$this->load->model($this->event_model,"main");
		$this->data["recommendedResult"] = $this->main->load_recommended("1");

		$this->lang->load('event');
		
	}
	
	function index(){
		$this->home();
	}
	
	function home($event_main_url=""){
		@define("thisAction","home");
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["page_title"] = '<span class="textStart">Events</span>';
		$this->data["view_the_content"] = $this->default_theme_front . '/event/event_home';
		
		$event_main_aid = "";
		$event_main_url = urldecode($event_main_url);
		// echo $event_main_url."<BR>".$category_name."<BR>".$page_selected;

		// if(!is_blank($event_main_url) && $event_main_url != 'all'){
			$this->load->model($this->event_category_model,"event_cat");
			$this->data['event_cat_result'] = $this->event_cat->load_event_categories();

			$this->load->model($this->news_model,"news");
			$this->load->model($this->event_model,"event");
			$tmp_all_event_list = $this->event->load_by_period('', '1');

			$this->data['total_items'] = get_array_value($tmp_all_event_list, 'num_rows', 0);

			// Load data for right sidebar
			$this->load->model($this->view_most_comments_model,"most_comments");
			$tmp_event_list = $this->event->load_home('', '1');
			// echo $this->db->last_query(); exit;
			$this->data['all_event_list'] = $tmp_all_event_list['results'];
			$this->data['event_list'] = $tmp_event_list['results'];
			$this->data['news_popular_list'] = $this->news->load_popular('1');
			$this->data['news_recommended_list'] = $this->news->load_recommended('1');
			$this->data['news_talk_of_the_town_list'] = $this->news->load_talk_of_the_town('1');
			$this->data['news_top_commenters'] = $this->most_comments->load_top_commenters(0, 3);
		// }
		
		
				
		$this->load->model($this->event_model,"main");
		$this->data["eventHighlightResult"] = $this->main->load_highlight($event_main_aid);
		
		$this->load->model($this->event_category_model,"event_category");
		$this->event_category->set_where(array("status"=>"1"));
		$this->event_category->set_order_by("weight ASC, created_date ASC");
		$event_category_list = $this->event_category->load_records(false);
		$event_home_result = "";
		if(is_var_array($event_category_list)){
			foreach($event_category_list as $item){
				$event_category_aid = get_array_value($item,"aid","0");
				$event_list = $this->main->load_home($event_main_aid, $event_category_aid, 15);
				$item["event_list"] = $event_list;
				$event_home_result[] = $item;
			}
		}
		
		$this->data["event_home_result"] = $event_home_result;
				
		$this->load->view($this->default_theme_front . '/tpl_event', $this->data);
	}
	
	function home_calendar($event_main_url=""){
		@define("thisAction","home_calendar");
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["page_title"] = '<span class="textStart">Activity</span><span class="textSub">Calendar</span>';
		$this->data["view_the_content"] = $this->default_theme_front . '/event/event_calendar';
		
		$event_main_aid = "";
		$event_main_url = urldecode($event_main_url);
		// echo $event_main_url."<BR>".$category_name."<BR>".$page_selected;

		// if(!is_blank($event_main_url) && $event_main_url != 'all'){
			$this->load->model($this->event_category_model,"event_cat");
			$this->data['event_cat_result'] = $this->event_cat->load_event_categories();

			$this->load->model($this->news_model,"news");
			$this->load->model($this->event_model,"event");
			$date = new DateTime(); 
			// $date->modify('+2 month');
			$period_start =  $date->modify('first day of this month')->format('Y-m-d 00:00:00');
			$period_end =  $date->modify('last day of this month')->format('Y-m-d 23:59:59');
			$tmp_all_event_list = $this->event->load_by_period('', '1', TRUE, $period_start, $period_end);
			// $date = new DateTime(); 
			// echo $date->format('Y-m-d 00:00:00').'<br><br/>';
			// echo $date->format('Y-m-d 23:59:59').'<br><br/>';
			// echo $this->db->last_query().'<br><br/>';
			// print_r($tmp_all_event_list); exit;

			$this->data['total_items'] = get_array_value($tmp_all_event_list, 'num_rows', 0);

			// Load data for right sidebar
			$this->load->model($this->view_most_comments_model,"most_comments");
			$tmp_event_list = $this->event->load_home('', '1');
			$this->data['all_calendar_list'] = $tmp_all_event_list['results'];
			$this->data['event_list'] = $tmp_event_list['results'];
			$this->data['news_popular_list'] = $this->news->load_popular('1');
			$this->data['news_recommended_list'] = $this->news->load_recommended('1');
			$this->data['news_talk_of_the_town_list'] = $this->news->load_talk_of_the_town('1');
			$this->data['news_top_commenters'] = $this->most_comments->load_top_commenters(0, 3);
		// }
		
		
				
		$this->load->model($this->event_model,"main");
		$this->data["eventHighlightResult"] = $this->main->load_highlight($event_main_aid);
		
		$this->load->model($this->event_category_model,"event_category");
		$this->event_category->set_where(array("status"=>"1"));
		$this->event_category->set_order_by("weight ASC, created_date ASC");
		$event_category_list = $this->event_category->load_records(false);
		$event_home_result = "";
		if(is_var_array($event_category_list)){
			foreach($event_category_list as $item){
				$event_category_aid = get_array_value($item,"aid","0");
				$event_list = $this->main->load_home($event_main_aid, $event_category_aid);
				$item["event_list"] = $event_list;
				$event_home_result[] = $item;
			}
		}
		
		$this->data["event_home_result"] = $event_home_result;
				
		$this->load->view($this->default_theme_front . '/tpl_event_calendar', $this->data);
	}

	function ajax_load_calendar_feed() {
		$start = trim(strip_tags($this->input->get_post('start'))).' 00:00:00';
		$end = trim(strip_tags($this->input->get_post('end'))).' 00:00:00';

		$this->load->model($this->event_model,"event");
		$period_start = date("Y-m-d 00:00:00", strtotime($start));
		$period_end = date("Y-m-d 00:00:00", strtotime($end));
		$rs = $this->event->load_by_period('', '1', TRUE, $period_start, $period_end);
		$num_rows = get_array_value($rs, 'num_rows', 0);
		$results = get_array_value($rs, 'results', 0);
		// echo $num_rows; exit;

		$arr_calendar_json = '';
		if ($num_rows > 0) {
			$arr_calendar_json = array();
			$today = date("Y-m-d 00:00:00", strtotime('now'));
			foreach ($results as $k => $item) {
				$arr_calendar_json[$k] = array();
				$arr_calendar_json[$k]['title'] = get_array_value($item, 'title', '');
				$arr_calendar_json[$k]['start'] = get_array_value($item, 'event_start_date', '');
				if ($item['is_all_day'] == '1') {
					$arr_calendar_json[$k]['allDay'] = true;
					$arr_calendar_json[$k]['end'] = date('Y-m-d', strtotime(get_array_value($item, 'event_end_date') . '+1 day'));
				}
				else {
					$arr_calendar_json[$k]['allDay'] = false;
					$arr_calendar_json[$k]['end'] = get_array_value($item, 'event_end_date', '');
				}
				$arr_calendar_json[$k]['url'] = site_url('event/detail/' . get_array_value($item, 'aid', ''));
				$arr_calendar_json[$k]['textColor'] = '#FFFFFF';

				$event_start = date("Y-m-d 00:00:00", strtotime(get_array_value($item, 'event_start_date')));
				if ($event_start < $today) {
					$arr_calendar_json[$k]['className'] = 'fc-past';
				}
				else if ($event_start == $today) {
					$arr_calendar_json[$k]['className'] = 'fc-today';
				}
				else if ($event_start > $today) {
					$arr_calendar_json[$k]['className'] = 'fc-future';
				}
			}
		}
		echo json_encode($arr_calendar_json);
		return;
	}
	
	function ajax_load_event_feed() {
		$total_load = 30;
		$html = '';
		$next_page = '';
		$page = $this->input->get_post('page');
		$total_items = $this->input->get_post('total_items');
		$category_aid = $this->input->get_post('category_aid');

		$this->load->model($this->event_model,"event");
		$arr_category_aid = "";
		if (!empty($category_aid) && $category_aid != "all") {
			$arr_category_aid = array(','.$category_aid.',');
		}
		$tmp_rs = $this->event->load_home($arr_category_aid, '1' , $total_load, (($page-1)*$total_load));
		$this->data['event_result'] = get_array_value($tmp_rs, 'results', '');
		// $this->data['event_result'] = $tmp_rs;
		if ($total_items > ($page * $total_load)) {
			$next_page = $page+1;
		}
		echo json_encode( array(
				'status' => 'success',
				'html' => $this->load->view($this->default_theme_front . '/event/include_event_feed', $this->data, TRUE),
				'next_page' => $next_page
			)
		);
	}
	
	function status($type="")	{
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
			case md5('cat-not-found') : 
				$this->data["message"] = set_message_error('ไม่พบหมวดหมู่เรียกดู');
				$this->data["js_code"] = '';
				break;
			case md5('event-not-found') : 
				$this->data["message"] = set_message_error('ไม่พบข่าวที่เรียกดู');
				$this->data["js_code"] = '';
				break;
			default : 
				$this->data["message"] = set_message_error('Please try again');
				$this->data["js_code"] = '';
				break;
		}
		$this->home();
	}

	function category_main_page($event_main_url="",$page_selected="")
	{
		$this->category($event_main_url,"","",$page_selected);
	}
	
	function category_main_sort($event_main_url="",$sort_by="")
	{
		$this->category($event_main_url,"",$sort_by,"");
	}
	
	function category_main_sort_page($event_main_url="",$sort_by="",$page_selected="")
	{
		$this->category($event_main_url,"",$sort_by,$page_selected);
	}
	
	function category_all_page($event_main_url="",$category_name="",$page_selected="")
	{
		$this->category($event_main_url,$category_name,"",$page_selected);
	}
	
	function category($event_main_url="",$category_name="",$sort_by="",$page_selected="")
	{
		@define("thisAction","home");
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["view_the_content"] = $this->default_theme_front . '/event/event_list';
		
		$sort_by = trim(strtolower($sort_by));
		if($sort_by != "pop_a" && $sort_by != "pop_d"  && $sort_by != "date_a" && $sort_by != "date_d"  && $sort_by != "name_a" && $sort_by != "name_d" ){
			$sort_by = "date_d";
		}
		// echo "event_main_url = $event_main_url , category_name = $category_name , sort_by = $sort_by , page_selected = $page_selected";
		if(is_blank($category_name) || $category_name == '0' ||$category_name == 'all' ){
			$category_name = "";
		}
		
		$optional = array();
		
		$event_main_aid = "";
		$category_name = urldecode($category_name);
		$event_main_url = urldecode($event_main_url);
		// echo $event_main_url."<BR>".$category_name."<BR>".$page_selected;
		if(!is_blank($event_main_url)){
			$this->load->model($this->event_main_model,"event_main");
			$this->event_main->set_where(array("url"=>$event_main_url,"status"=>"1"));
			$result = $this->event_main->load_record(false);
			if(is_var_array($result)){
				$event_main_aid = get_array_value($result,"aid","");
				$event_main_name = get_array_value($result,"name","");
				$event_main_url = get_array_value($result,"url","");
				$this->data["event_main_result"] = $result;
				$this->data["this_event_main_aid"] = $event_main_aid;
				$this->data["this_event_main_name"] = $event_main_name;
				$this->data["this_event_main_url"] = $event_main_url;
			}
		}
		
		
		$category_aid = "";
		$category_name = urldecode($category_name);
		$this->data["this_category_name"] = $category_name;
		if(!is_blank($category_name)){
			$this->load->model($this->event_category_model,"category");
			$this->category->set_where(array("name"=>$category_name,"status"=>"1"));
			$result = $this->category->load_record(false);
			if(is_var_array($result)){
				$category_aid = get_array_value($result,"aid","");
				$this->data["event_category_result"] = $result;
			}
			if(is_blank($category_aid)){
				$this->status(md5('cat-not-found'));
				return"";
			}
		}
		
		$this->db->flush_cache();
		$this->load->model($this->event_model,"main");
		$this->db->start_cache();
		
		if(!is_blank($event_main_aid)){
			$this->main->set_where(array("event_main_aid"=>$event_main_aid));
		}
		if(!is_blank($category_aid)){
			$this->main->set_like(array("category"=>",".$category_aid.","),"both");
		}
		if(!exception_about_status()) $this->main->set_where(array("status"=>'1'));
		$optional["total_record"] = $this->main->count_records();
		$optional["page_selected"] = $page_selected;
		$optional["record_per_page"] = CONST_DEFAULT_RECORD_PER_EVENT;
		$url = 'event/category';
		$url_for_sort = 'category';
		if(!is_blank($event_main_url)){
			$url .= '/'.$event_main_url;
			$url_for_sort .= '/'.$event_main_url;
		}
		if(!is_blank($category_name)){
			$url .= '/c-'.$category_name;
			$url_for_sort .= '/c-'.$category_name;
		}
		if(!is_blank($sort_by)){
			$url .= '/sort-'.$sort_by;
		}
		$optional["url"] = $url.'/page-';
		
		$optional = $this->get_pagination_info($optional);
		
		$this->main->set_limit(get_array_value($optional,"start_record","0"),get_array_value($optional,"search_record_per_page",CONST_DEFAULT_RECORD_PER_EVENT));
		if($sort_by == 'pop_d'){
			$this->main->set_order_by("total_download DESC");
		}else if($sort_by == 'pop_a'){
			$this->main->set_order_by("total_download ASC");
		}else if($sort_by == 'date_d'){
			$this->main->set_order_by("created_date DESC");
		}else if($sort_by == 'date_a'){
			$this->main->set_order_by("created_date ASC");
		}else if($sort_by == 'name_d'){
			$this->main->set_order_by("main.name DESC");
		}else if($sort_by == 'name_a'){
			$this->main->set_order_by("main.name ASC");
		}else{
			$this->main->set_order_by("weight ASC, created_date DESC");
		}
		$this->data["resultList"] = $this->main->load_records(true);			
		$this->data["sort_by"] = $sort_by;			
		$this->data["url_for_sort"] = $url_for_sort;			
		$optional["total_in_page"] = count($this->data["resultList"]);			
		$this->data["optional"] = $optional;			
		// echo "<br>sql : ".$this->db->last_query();
		// exit(0);
		$this->db->flush_cache();		
		$this->load->view($this->default_theme_front . '/tpl_event', $this->data);
	}
	
	function detail($aid){
		@define("thisAction","detail");
		$this->data["title"] = DEFAULT_TITLE;
		$this->data["page_title"] = '<span class="textStart">Activity</span><span class="textSub">Calendar</span>';
		$this->data["view_the_content"] = $this->default_theme_front . '/event/event_detail';
				
		$this->db->flush_cache();
		$this->load->model($this->event_model, "main");
		$result = $this->main->increase_total_view($aid);	
		// echo $aid; exit;
		$this->db->flush_cache();
		// $this->main->set_where(array("aid"=>$aid));
		// if(!exception_about_status()) $this->main->set_where(array("status"=>'1'));
		// $item_result = $this->main->load_record(true);
		$item_result = $this->main->load_event_detail($aid);
		// print_r($item_result); exit;
		
		if(is_var_array($item_result)){
			$this->data["item_detail"] = $item_result['results'][0];
			$event_aid = get_array_value($item_result, "aid", "");
			$event_main_aid = get_array_value($item_result, "event_main_aid", "");
			if(!is_blank($event_main_aid)){
				$this->load->model($this->event_main_model,"event_main");
				$this->event_main->set_where(array("aid"=>$event_main_aid,"status"=>"1"));
				$result = $this->event_main->load_record(false);
				if(is_var_array($result)){
					$event_main_aid = get_array_value($result,"aid","");
					$event_main_name = get_array_value($result,"name","");
					$event_main_url = get_array_value($result,"url","");
					$this->data["event_main_result"] = $result;
					$this->data["this_event_main_aid"] = $event_main_aid;
					$this->data["this_event_main_name"] = $event_main_name;
					$this->data["this_event_main_url"] = $event_main_url;
				}
			}
			
			$this->load->model($this->event_gallery_model,"event_gallery");
			$tmp = array();
			$tmp["event_aid"] = $event_aid;
			$tmp["status"] = "1";
			$this->event_gallery->set_where($tmp);
			$this->event_gallery->set_order_by("weight ASC, created_date ASC");
			$this->data["event_gallery_list"] = $this->event_gallery->load_records(true);
			// echo "<br>sql : ".$this->db->last_query();
			
			$this->load->view($this->default_theme_front.'/tpl_event_detail', $this->data);
		}else{
			redirect('event/status/'.md5('event-not-found'));
		}
	}

	function ajax_save_action_join() {
		$event_aid = $this->input->get_post('event_aid');
		$has_joined = $this->input->get_post('has_joined');

		$this->load->model($this->event_model,'event');
		$this->load->model($this->event_user_activity_join_model,'event_activity');
		$this->event_activity->do_join($event_aid, '', $has_joined);
		// Update total join
		$this->event->update_total_join($event_aid);
		$total = $this->event->get_total_activity($event_aid);
		echo json_encode( array (
				'status' => 'success', 
				'total_join' => $total['total_join'], 
				'txt_total_join' => ($total['total_join'] > 0 ? $total['total_join'].'<a href="javascript:void(0);" data-original-title="" class="txt-green who-join">'.($total['total_join'] > 1 ? ' people</a> join' : ' person</a> joins').'</a> this event' : 'No one joins this event.'), 
				'has_joined_txt_long' => ($has_joined == '1' ? 'You\'re going' : ($has_joined == '0' ? 'You\'re not going' : '') ),
				'msg' => ($has_joined == '1' ? 'Going' : ($has_joined == '0' ? 'Not Going' : '') ) 
			)
		);
		return;
	}

	function ajax_load_who_join() {
		$event_aid = $this->input->get_post('event_aid');
		$include_me = $this->input->get_post('include_me');
		$arr_return = array( 'status' => 'error', 'msg' => '' );

		$this->load->model($this->event_user_activity_join_model,'user_activity');
		$this->user_activity->set_where(array('event_aid' => $event_aid, 'has_joined' => '1'));
		if ($include_me == '1') {
			$this->user_activity->set_where_not_equal(array('user_aid' => getUserLoginAid($this->user_login_info)));
		}
		$this->user_activity->set_order_by(array('user.first_name_th' => 'ASC', 'user.last_name_th' => 'ASC'));
		$tmp_rs = $this->user_activity->load_records(true);

		if ($tmp_rs['num_rows'] > 0 || $include_me == '1') {
			$html = '<div class="text-left pls mls">';
			$html .= $tmp_rs['html'];
			if ($include_me == '1') {
				$html .= (empty($tmp_rs['html']) ? '<ul><li>You</li></ul>' : '<li>You</li></ul>');
			}
			$html .= '</div>';
			$arr_return = array( 'status' => 'success', 'html' => $html );
		}
		echo json_encode($arr_return);
		return;
	}
	
	private function load_panel_comment($parent_event_aid="", $limit=3, $order_by="DESC") {
		$arr_return = array( 'status' => 'error', 'msg' => '' );
		if (is_blank($parent_event_aid)) {
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}
		$this->load->model($this->event_comment_model,'comment');
		$this->comment->set_where(array('parent_event_aid' => $parent_event_aid, 'parent_comment_aid' => 0));
		if(!exception_about_status()) $this->comment->set_where(array("status"=>'1'));
		$this->comment->set_order_by(array('created_date' => $order_by));
		$rs_comments = $this->comment->load_records(true);
		
		$html ='';
		if (!empty($limit) && $limit > 0) { // If limit = 0; means load all comments
			if ($rs_comments['num_rows'] > $limit) {
				$more_val = get_array_value($rs_comments, 'num_rows') - $limit;
				$html .= '
					<div class="panel-view-more-comments">
			    		<i class="fa fa-comment-o"></i> <a href="javascript:void(0);" class="view-more-comments">View '.$more_val.' more comment'.($more_val > 1 ? 's' : '').'</a>
			    	</div>';
		   }
	   }

	   if (is_var_array($rs_comments['results'])) {
			$rs_comments['results'] = @array_reverse($rs_comments['results']);
			if (!empty($limit) && $limit > 0) { // If limit = 0; means load all comments
				$rs_comments['results'] = array_slice($rs_comments['results'], -$limit, $limit);
			}
		   
		   $html .= '<div class="panel-comments">';
			foreach ($rs_comments['results'] as $item) {
				$html .= '
					<div class="media box-comment'.($item['status'] == '1' ? '' : ' is-hidden').'" data-comment-aid="'.$item['aid'].'">
				      <a href="#" class="pull-left">
				        '.get_array_value($item, "avatar_tiny", "").'
				      </a>
				      <div class="media-body">
				        <div class="media-heading">
				        	<div class="line-comment">
				        		<strong>'.$item['full_name_th'].'</strong>
				        		'.makeClickableLinks(nl2br(get_array_value($item, 'comment', ''))).'
				        	</div>
				        	<div class="line-datetime clearfix">
				        		'.get_pretty_date(get_array_value($item, 'created_date', '')).'
				        		 · 
				        		<a href="javascript:void(0);" class="action-icon-wow-comment mrs '.(get_array_value($item, 'is_wowed_by_me', false) == true ? 'wowed' : '').'">'.(get_array_value($item, 'is_wowed_by_me', false) == true ? 'Unwow' : 'Wow!').'</a>';

        			
        				// Thumbs-up icon with total wows
        				$html .= '
				        		<div class="panel-comment-total-wow inline-block'.($item['total_wow'] > 0 ? '' : ' hidden').'">
				        			<a href="javascript:void(0);" class="mrs who-wow-this-comment" data-toggle="tooltip" data-original-title=""><i class="fa fa-thumbs-o-up"></i> <span class="total-wow-comment">'.$item['total_wow'].'</span></a>
				        		</div>';
        			
				   
				   // Delete link. If this is my comment, show delete comment link
				   if (is_owner_admin_or_higher() || ($item['created_by'] == getUserLoginAid($this->user_login_info))) {
				   	$html .= '<span class="panel-delete-comment hidden"> · <a href="javascript:void(0);" class="text-danger">Delete</a></span>';
					}
				   
				   // Hide/Unhide link for admin
				   if (is_owner_admin_or_higher()) {
				   	$html .= '<span class="panel-hide-comment hidden"> · <a href="javascript:void(0);" class="text-muted" data-status="'.$item['status'].'">'.($item['status'] == '1' ? 'Hide' : 'Unhide').'</a></span>';
					}
				   
				   $html .= '
				        	</div>
				        </div>
				      </div>
			    	</div>';
			}
		}
		else {
			$html .= '<div class="pam">No comment for this article.</div>';
		}
		$html .= '</div>';
		$arr_return = array( 
				'status' => 'success', 
				'html_panel_comment' => $html 
			);
		return $arr_return;
	}

	function ajax_load_panel_comment_and_activity() {
		$event_aid = $this->input->get_post('parent_event_aid');
		$limit = $this->input->get_post('limit');
		$order_by = $this->input->get_post('order_by');

		$arr_return = array( 'status' => 'success', 'msg' => '' );
		if (is_blank($event_aid)) {
			$arr_return['status'] = 'error';
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}
		if (is_blank($limit)) $limit = 3;
		if (is_blank($order_by)) $order_by = "DESC";
		// $panel_actions = $this->load_panel_actions($event_aid);
		$panel_comment = $this->load_panel_comment($event_aid, $limit, $order_by);
		// $arr_return =  $panel_actions;
		$arr_return['html_panel_comment'] = get_array_value($panel_comment, 'html_panel_comment', '');
		echo json_encode( $arr_return );
	}

	function ajax_load_view_all_comments() {
		$event_aid = $this->input->get_post('event_aid');
		$arr_return = array( 'status' => 'success', 'msg' => '' );
		if (is_blank($event_aid)) {
			$arr_return['status'] = 'error';
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}
		$arr_return = $this->load_panel_comment($event_aid, 0);
		echo json_encode( $arr_return );
	}
	
	function ajax_add_comment() {
		$comment = trim($this->input->get_post('comment'));
		$parent_event_aid = trim($this->input->get_post('parent_event_aid'));
		$parent_comment_aid = trim($this->input->get_post('parent_comment_aid'));
		$has_view_all_link = trim($this->input->get_post('has_view_all_link'));
		$limit = 3;
		if (empty($has_view_all_link)) $limit = 0;

		$arr_return = array( 'status' => 'success', 'msg' => '' );
		if (is_blank($parent_event_aid) || is_blank($comment)) {
			$arr_return['status'] = 'error';
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}
		if (is_blank($parent_comment_aid)) $parent_comment_aid = 0;

		$this->load->model($this->event_model,'event');
		$this->load->model($this->event_comment_model,'comment');
		$this->comment->insert_record(
			array(
					'comment' => strip_tags($comment, '<br>'),
					'parent_event_aid' => $parent_event_aid,
					'parent_comment_aid' => $parent_comment_aid
				)
			);

		// Update total comment
		$this->event->update_total_comment($parent_event_aid);

		// $panel_actions = $this->load_panel_actions($parent_event_aid);
		$panel_comment = $this->load_panel_comment($parent_event_aid, $limit);
		// $arr_return =  $panel_actions;
		$arr_return['html_panel_comment'] = get_array_value($panel_comment, 'html_panel_comment', '');
		echo json_encode( $arr_return );
		// echo json_encode($this->load_panel_comment($parent_event_aid, $limit));
		return;
	}

	function ajax_delete_comment() {
		$comment_aid = trim($this->input->get_post('comment_aid'));
		$parent_event_aid = trim($this->input->get_post('parent_event_aid'));
		$has_view_all_link = trim($this->input->get_post('has_view_all_link'));
		$limit = 3;
		if (empty($has_view_all_link)) $limit = 0;

		$arr_return = array( 'status' => 'success', 'msg' => '' );
		if (is_blank($comment_aid)) {
			$arr_return['status'] = 'error';
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}

		$this->load->model($this->event_model,'event');
		$this->load->model($this->event_comment_model,'comment');
		$this->load->model($this->event_comment_user_activity_model,'user_comment_activity');
		// Delete this comment
		$this->comment->set_where(array('aid' => $comment_aid));
		$this->comment->delete_records();
		// Delete all wows of this comment
		$this->user_comment_activity->set_where(array('event_comment_aid' => $comment_aid));
		$this->user_comment_activity->delete_records();

		// Update total comment
		$this->event->update_total_comment($parent_event_aid);

		// $panel_actions = $this->load_panel_actions($parent_event_aid);
		$panel_comment = $this->load_panel_comment($parent_event_aid, $limit);
		// $arr_return =  $panel_actions;
		$arr_return['html_panel_comment'] = get_array_value($panel_comment, 'html_panel_comment', '');
		echo json_encode( $arr_return );
		// echo json_encode($this->load_panel_comment($parent_event_aid, $limit));
		return;
	}

	function ajax_hide_comment() {
		$comment_aid = trim($this->input->get_post('comment_aid'));
		$parent_event_aid = trim($this->input->get_post('parent_event_aid'));
		$status = trim($this->input->get_post('status'));
		$has_view_all_link = trim($this->input->get_post('has_view_all_link'));
		$limit = 3;
		if (empty($has_view_all_link)) $limit = 0;

		$arr_return = array( 'status' => 'success', 'msg' => '' );
		if (is_blank($comment_aid)) {
			$arr_return['status'] = 'error';
			$arr_return['msg'] = 'Incomplete input data';
			echo json_encode($arr_return);
			return;
		}

		$this->load->model($this->event_model,'event');
		$this->load->model($this->event_comment_model,'comment');
		// Delete this comment
		$this->comment->set_where(array('aid' => $comment_aid));
		if ($status == '1') {
			$this->comment->update_record(array('status' => '0'));
		}
		else {
			$this->comment->update_record(array('status' => '1'));
		}

		// Update total comment
		$this->event->update_total_comment($parent_event_aid);

		// $panel_actions = $this->load_panel_actions($parent_event_aid);
		$panel_comment = $this->load_panel_comment($parent_event_aid, $limit);
		// $arr_return =  $panel_actions;
		$arr_return['html_panel_comment'] = get_array_value($panel_comment, 'html_panel_comment', '');
		echo json_encode( $arr_return );
		// echo json_encode($this->load_panel_comment($parent_event_aid, $limit));
		return;
	}

	function ajax_wow_comment() {
		$comment_aid = $this->input->get_post('comment_aid');
		$status = $this->input->get_post('status');

		$this->load->model($this->event_comment_model,'comment');
		$this->load->model($this->event_comment_user_activity_model,'user_comment_activity');
		
		if ($status == '1') {
			$this->user_comment_activity->do_wow($comment_aid);
		}
		else {
			$this->user_comment_activity->do_unwow($comment_aid);
		}
		$this->comment->update_total_wow($comment_aid);
		echo json_encode($this->load_panel_activity_wow_comment($comment_aid));
		return;
	}

	private function load_panel_activity_wow_comment($comment_aid) {
		$this->load->model($this->event_comment_model,'comment');
		$this->load->model($this->event_comment_user_activity_model,'user_comment_activity');

		if ( $this->user_comment_activity->has_wowed($comment_aid) ) $has_wowed = true;
		else $has_wowed = false;

		$total_wow = $this->comment->get_total_wow($comment_aid);
		$total_wow_exclude_me = $total_wow - 1;
		$html = '';
		if ($total_wow > 0) {
			$html .= '<a href="javascript:void(0);" class="mrs who-wow-this-comment" data-toggle="tooltip" data-original-title=""><i class="fa fa-thumbs-o-up"></i> <span class="total-wow-comment">'.$total_wow.'</span></a>';
		}

		$arr_return = array( 
				'status' => 'success', 
				'has_wowed' => $has_wowed, 
				'total_wow' => $total_wow, 
				'html_panel_comment_total_wow' => $html, 
				'new_txt_action' => ($has_wowed == true ? 'Unwow' : 'Wow!')
			);
		return $arr_return;
	}
	
	function ajax_load_who_wow_this_comment() {
		$event_comment_aid = $this->input->get_post('comment_aid');
		$arr_return = array( 'status' => 'error', 'msg' => '' );

		$this->load->model($this->event_comment_user_activity_model,'user_comment_activity');
		$this->user_comment_activity->set_where(array('event_comment_aid' => $event_comment_aid, 'status_wow' => '1'));
		$this->user_comment_activity->set_order_by(array('user.first_name_th' => 'ASC', 'user.last_name_th' => 'ASC'));
		$tmp_rs = $this->user_comment_activity->load_records(true);

		if ($tmp_rs['num_rows'] > 0) {
			$arr_return = array( 'status' => 'success', 'html' => '<div class="text-left">'.$tmp_rs['html'].'</div>' );
		}
		echo json_encode($arr_return);
		return;
	}

}

?>