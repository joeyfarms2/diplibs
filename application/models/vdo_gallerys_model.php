<?php
require_once(APPPATH."models/product_init_model.php");

class Vdo_gallerys_model extends Product_init_model {
	
	function __construct()
	{
		// Call the Model constructor
        parent::__construct();
		$this->set_table_name("vdo_gallerys");
		
		$this->tbl_vdo_name = "vdo";
		//$this->tbl_product_type_name = "product_type";
	}
	
	// function get_product_gallerys_by_parent_aid($parent_aid=0){
	// 	$tmp = array();
	// 	if(!exception_about_status()) $tmp["status"] = "1";
	// 	$tmp["parent_aid"] = $parent_aid;
	// 	$this->set_where($tmp);
	// 	$this->set_order_by("type asc, possession asc, barcode asc");
	// 	$result = $this->load_records(true);
	// 	return $result;
	// }

	function set_join_for_desc($obj=""){
		//$this->db->select($this->get_table_name().'.*,  parent.cid as parent_cid, parent.title as parent_title, parent.author as parent_author, parent.category as parent_category, parent.status as parent_status, parent.upload_path as parent_upload_path, parent.cover_image_file_type as parent_cover_image_file_type');
		$this->db->select($this->get_table_name().'.*, parent.upload_path');
		$this->db->join($this->tbl_vdo_name.' AS parent', $this->get_table_name().'.parent_aid = parent.aid', "left");
		//$this->db->join($this->tbl_product_type_name.' AS product_type', $this->get_table_name().'.product_type_aid = product_type.aid', "left");
	
		// $this->db->select($this->get_table_name().'.*, parent.upload_path as parent_upload_path,');
		// $this->db->join($this->tbl_vdo_name.' AS parent', $this->get_table_name().'.parent_aid = parent.aid', "left");
	
	}
	
	function fetch_data_with_desc($query)
	{
		$result = "";
		//echo "<br>sql : ".$this->db->last_query();
		if($query->num_rows() > 0){
			$this->db->flush_cache();
			foreach($query->result_array() as $row){
				$row["num_rows"] = $query->num_rows() ;
				switch($row["status"]){
					case "1" : $row["status_name"] = "Active"; break;
					case "0" : $row["status_name"] = "Inactive"; break;
					default : $row["status_name"] = "N/A";	 break;
				}
				
				$upload_path = get_array_value($row,"upload_path","");
				$image_path = $upload_path.'galleries/original/'.get_array_value($row,"file_name","");
				$row["image_original"] = $image_path;
				
				$image_path = $upload_path.'galleries/thumb/'.get_array_value($row,"file_name","");
				$row["image_thumb"] = $image_path;
								
				$result[] = $row;
			}
		}
		return $result;
	}
	
}

/* End of file news_galley_model.php */
/* Location: ./system/application/model/news_galley_model.php */