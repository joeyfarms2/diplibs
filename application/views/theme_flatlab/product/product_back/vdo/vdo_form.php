<?php 
$command = @$command;
$parent_detail = @$parent_detail;

$product_main_result = @$product_main_result;
$product_main_aid = get_array_value($product_main_result,"aid","");
$product_main_url = get_array_value($product_main_result,"url","");

?>
<script type="text/javascript" src="<?=JS_PATH?>product/product_back/product_back_init.js"></script>
<script type="text/javascript" src="<?=JS_PATH?><?=folderName?>/vdo.js"></script>
<form id="frm_product" name="frm_product" method="POST" action="<?=site_url('admin/product/vdo/save')?>" class="cmxform form-horizontal tasi-form" enctype="multipart/form-data">
	<input type="hidden" id="aid" name="aid" value="<?=get_array_value($parent_detail,"aid","")?>" />
	<input type="hidden" id="command" name="command" value="<?=$command?>" />
	<input type="hidden" id="save_option" name="save_option" value="" />
	<input type="hidden" id="product_main_aid" name="product_main_aid" value="<?=$product_main_aid?>" />
	<input type="hidden" id="product_type_aid" name="product_type_aid" value="<?=@$this_product_type_aid?>" />

	<div id="result-msg-box"></div>
	
	<div class="row">
		<div class="col-md-12">
			<section class="panel">
				<header class="panel-heading">
					<?=@$header_title?>
				</header>
				<?php include_once('include_menu.php'); ?>
				<header class="panel-heading no-radius fieldset">
					<?=$this->lang->line('product_menu_general_info')?> <!-- General Info -->
				</header>

				<div class="panel-body">
					<?php if(is_root_admin_or_higher() && $command == "_update"){ ?>
						<div class="form-group">
							<label class="col-md-12 col-lg-2 control-label required" for="aid_readonly">Product Code</label>
							<div class="col-md-12 col-lg-8">
								<input class="form-control readonly" type="text" id="aid_readonly" name="aid_readonly" value="<?=get_text_pad(get_array_value($parent_detail,"aid","0"))?>" readonly />
							</div>
						</div>
					<?php } ?>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="status">Status</label>
						<div class="col-md-12 col-lg-8">
							<?php $status =  get_array_value($parent_detail,"status",""); ?>
							<label class="radio-inline">
								<input type="radio" name="status" id="status_1" value="1" checked />Active
							</label>
							<label class="radio-inline">
								<input type="radio" name="status" id="status_0" value="0" <?php if($status == "0") echo 'checked="checked"';?> />Inactive
							</label>
						</div>
					</div>
					<?php if($product_main_url != "photo-gallerys"){ ?>
					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="source_type">Source type</label>
						<div class="col-md-12 col-lg-8">
							<?php 
							$source_type =  get_array_value($parent_detail,"source_type",""); 
							// 	$disabled = "";
							// 	$hide = "";
							// 	if($command == "_update" && $source_type == "1"){
							// 		$disabled = "disabled";
							// 		$hide = "hide";
							// 	}else if($command == "_update" && $source_type == "0"){
							// 		$disabled = "disabled";
							// 		$hide = "hide";
							// 	}
							
							//echo $source_type;?>
							<label class="radio-inline">
								<input type="radio" name="source_type" id="source_type" value="0" checked onclick="document.getElementById('types2').style.display='block';document.getElementById('types1').style.display='none';" />VDO & Audio
							</label>
							<label class="radio-inline">
								<input type="radio" name="source_type" id="source_type" value="1"  <?php if($source_type == "1") echo 'checked="checked"'; ?> onclick="document.getElementById('types1').style.display='block';document.getElementById('types2').style.display='none';" />Photo Galley
							</label>
							
						</div>
					</div>
					<?php } ?>
					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="category">Category</label>
						<div class="col-md-12 col-lg-8">
							<input type="hidden" name="category" id="category" value="<?=get_array_value($parent_detail,"category","")?>" />
							<div id="category_area"></div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="option">Option</label>
						<div class="col-md-12 col-lg-8">
							<label class="checkbox-inline">
								<input type="checkbox" id="is_new" name="is_new" value="1" <?php if(get_array_value($parent_detail,"is_new","") == "1") echo 'checked="checked"';?> />New
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="is_recommended" name="is_recommended" value="1" <?php if(get_array_value($parent_detail,"is_recommended","") == "1") echo 'checked="checked"';?> />Recommended
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="is_home" name="is_home" value="1" <?php if(get_array_value($parent_detail,"is_home","") == "1") echo 'checked="checked"';?> />Show in home
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="weight">Weight</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="weight" name="weight" value="<?=get_array_value($parent_detail,"weight","")?>" onkeypress="isWeight(event, this.value)" maxlength="6" />
						</div>
					</div>

					<div class="form-group hidden">
						<label class="col-md-12 col-lg-2 control-label" for="publisher">Publisher</label>
						<div class="col-md-12 col-lg-8">
							<?php $publisher_aid =  get_array_value($parent_detail,"publisher_aid",""); ?>
							<select id="publisher_aid" name="publisher_aid" class="form-control chzn-select" >
								<option value="">Choose publisher..</option>
								<?php 
									if(is_var_array($master_publisher)){ 
										foreach($master_publisher as $m_item){
								?>
										<option value="<?=get_array_value($m_item,"aid","")?>" <?php if($publisher_aid == get_array_value($m_item,"aid","")) echo 'selected="selected"';?>><?=get_array_value($m_item,"name","")?></option>
								<?php } } ?>
							</select>
						</div>
					</div>

					<div class="form-group hidden">
						<label class="col-md-12 col-lg-2 control-label">Publish date</label>
						<div class="col-xs-11 col-md-3">
							<div class="input-group date form_datetime-adv" data-date="">
								<input class="form-control" type="text" id="publish_date" name="publish_date" value="<?=get_array_value($parent_detail,"publish_date","")?>" />

								<div class="input-group-btn">
									<button class="btn btn-danger" type="button" onclick="clearValue('publish_date');">
									<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group hidden">
						<label class="col-md-12 col-lg-2 control-label">Expiration date</label>
						<div class="col-xs-11 col-md-3">
							<div class="input-group date form_datetime-adv" data-date="">
								<input class="form-control" type="text" id="expired_date" name="expired_date" value="<?=get_array_value($parent_detail,"expired_date","")?>" />

								<div class="input-group-btn">
									<button class="btn btn-danger" type="button" onclick="clearValue('expired_date');">
									<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="tag">Tag</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="tag" name="tag" value="<?=get_array_value($parent_detail,"tag","")?>" />
						</div>
					</div>

					<?php if(CONST_HAS_REWARD_POINT){ ?>
					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="reward_point">Reward point</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="reward_point" name="reward_point" value="<?=get_array_value($parent_detail,"reward_point","")?>" />
						</div>
					</div>
					<?php } ?>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="cover_image">Cover image</label>
						<div class="col-md-12 col-lg-8">
							<input class="default" type="file" id="cover_image" name="cover_image"/>
							<p class="help-block">Only file extension .jpg, .jpeg, .png, .gif and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_FOR_IMAGE)?>. <span style="color:red">( ขนาดภาพ 745px * 440px )</span></p>
						</div>
						<?php $img_src = get_image(get_array_value($parent_detail,"cover_image_small_path",""),"small","off"); ?>
						<?php if(!is_blank($img_src)){ ?>
						<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
							<img src="<?=$img_src?>" />
						</div>
						<?php } ?>
					</div>

					<?php
					if($product_main_url != "photo-gallerys"){
						if($source_type == "1"){
						?>
						<div class="form-group">
	                          <label class="col-md-12 col-lg-2 control-label" for="file_upload_gallery">File upload</label>
							<div class="col-md-12 col-lg-8">
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery1"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery2"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery3"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery4"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery5"/>
								<p class="help-block" id="file_upload_limit_for_digital_gen">Only file extension <?=get_file_type(CONST_ALLOW_FILE_TYPE_FOR_IMAGE)?> and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_FOR_VDO)?>.</p>
							</div>
	                            <?php
									$upload_path = get_array_value($parent_detail,"upload_path","")."file/";
									$file_upload = get_array_value($parent_detail,"uri","");
									// echo "path : ".$upload_path.$file_upload;
									//echo $upload_path;
									//echo $file_upload;
									if(is_file($upload_path.$file_upload)){
									?>
									<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
											<a href="<?=site_url($upload_path.$file_upload)?>" target="_blank"><?=$file_upload?></a>
									</div>
							    <?php } ?>
	                    </div>
	                    <div class="form-group" >
							<label class="col-md-12 col-lg-2 control-label" for="uri">File name</label>
							<div class="col-md-12 col-lg-8">
								<?php
									$strSQL = "SELECT * FROM vdo_gallery WHERE parent_aid ='".get_array_value($parent_detail,"aid","")."'";
									$objQuery = mysql_query($strSQL) or die ("Error Query [".$strSQL."]");

								
									while($objResult = mysql_fetch_array($objQuery))
									{
									?>
									<div class="img_delete_gallery">
										<img src=<?=PUBLIC_PATH.$upload_path.$objResult["name"];?> width="100" style="border:solid 1px #ccc;padding: 4px;">
										<a href="" onclick="ImageDeleteGallery('<?=$objResult["aid"]?>');"><img src=<?=PUBLIC_PATH."images/icons/shelf-delete.png";?> style="position:relative;top:-80px;left:85px;" ></a>
									</div>
									<?
									}
									?>
							</div>
						</div>
						<?php
						}else if($source_type == "0"){
							?>
							<div class="form-group" >
	                          <label class="col-md-12 col-lg-2 control-label" for="file_upload">File upload</label>
	                          <div class="col-md-12 col-lg-8">
	                           <input class="spaceUp default" type="file" id="file_upload" name="file_upload"/>
	                           <p class="help-block" id="">Only file extension <?=get_file_type(CONST_ALLOW_FILE_TYPE_FOR_VDO)?> and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_DEFAULT)?>.</p>
	                          </div>
	                          	<?php
									$upload_path = get_array_value($parent_detail,"upload_path","")."file/";
									$file_upload = get_array_value($parent_detail,"uri","");
									// echo "path : ".$upload_path.$file_upload;
									//echo $upload_path;
									//echo $file_upload;
									if(is_file($upload_path.$file_upload)){
									?>
									<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
											<a href="<?=site_url($upload_path.$file_upload)?>" target="_blank"><?=$file_upload?></a>
									</div>
							    <?php } ?>
	                    </div>
	                    <div class="form-group" >
							<label class="col-md-12 col-lg-2 control-label" for="uri">File name</label>
							<div class="col-md-12 col-lg-8">
								<input class="form-control" type="text" id="uri" name="uri" value="<?=get_array_value($parent_detail,"uri","")?>" />
								<p class="help-block">Fill filename when upload file via FTP. (ex. 000001.mp4)<BR>
									<?php if($command == "_update"){ ?>
										Upload path : <?=$upload_path?>
									<?php }else{ ?>
										Please save before get file path.
									<?php } ?>
								</p>
							</div>
						</div>
	                    <?php
						}else{
						?>
						<div class="form-group" id="types2" >
	                          <label class="col-md-12 col-lg-2 control-label" for="file_upload">File upload</label>
	                          <div class="col-md-12 col-lg-8">
	                           <input class="spaceUp default" type="file" id="file_upload" name="file_upload"/>
	                           <p class="help-block" id="">Only file extension <?=get_file_type(CONST_ALLOW_FILE_TYPE_FOR_VDO)?> and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_DEFAULT)?>.</p>
	                          </div>
	                          	<?php
									$upload_path = get_array_value($parent_detail,"upload_path","")."file/";
									$file_upload = get_array_value($parent_detail,"uri","");
									// echo "path : ".$upload_path.$file_upload;
									//echo $upload_path;
									//echo $file_upload;
									if(is_file($upload_path.$file_upload)){
									?>
									<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
											<a href="<?=site_url($upload_path.$file_upload)?>" target="_blank"><?=$file_upload?></a>
									</div>
							    <?php } ?>
	                    </div>

	                    <div class="form-group" id="types1" style="display:none;">
	                          <label class="col-md-12 col-lg-2 control-label" for="file_upload_gallery">File upload</label>
							<div class="col-md-12 col-lg-8">
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery1"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery2"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery3"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery4"/>
								<input class="spaceUp default" type="file" id="file_upload_gallery" name="file_upload_gallery5"/>
								<p class="help-block" id="file_upload_limit_for_digital_gen">Only file extension <?=get_file_type(CONST_ALLOW_FILE_TYPE_FOR_IMAGE)?> and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_FOR_VDO)?>.</p>
							</div>
	                            <?php
									$upload_path = get_array_value($parent_detail,"upload_path","")."file/";
									$file_upload = get_array_value($parent_detail,"uri","");
									// echo "path : ".$upload_path.$file_upload;
									//echo $upload_path;
									//echo $file_upload;
									if(is_file($upload_path.$file_upload)){
									?>
									<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
											<a href="<?=site_url($upload_path.$file_upload)?>" target="_blank"><?=$file_upload?></a>
									</div>
							    <?php } ?>
	                    </div>
	                    <div class="form-group" >
							<label class="col-md-12 col-lg-2 control-label" for="uri">File name</label>
							<div class="col-md-12 col-lg-8">
								<input class="form-control" type="text" id="uri" name="uri" value="<?=get_array_value($parent_detail,"uri","")?>" />
								<p class="help-block">Fill filename when upload file via FTP. (ex. 000001.mp4)<BR>
									<?php if($command == "_update"){ ?>
										Upload path : <?=$upload_path?>
									<?php }else{ ?>
										Please save before get file path.
									<?php } ?>
								</p>
							</div>
						</div>

	                    <?php
							}
						}
						?>
			</section>

			<section class="panel">
				<header class="panel-heading fieldset">
					Marc Information
				</header>
				<div class="panel-body">
					<div id="marc_field_list_area"></div>
				</div>
			</section>

			<section class="panel">
				<!-- Button -->
				<div class="panel-body">
					<a class="btn btn-primary" onclick="processSubmitOption('frm_product', '0');" />Save & Close</a>
					<a class="btn btn-default" onclick="processRedirect('admin/product-<?=$product_main_url?>/vdo');" />Cancel</a>
				</div>
				<!-- End : Button -->
			</section>
		</div>
	</div>
</form>
<script type="text/javascript">
	jQuery(document).ready(function($){

		const_has_reward_point = '<?=CONST_HAS_REWARD_POINT?>';
		const_reward_point = '<?=CONST_REWARD_POINT?>';

		$("#publish_date, #expired_date").datepicker({
			format: "yyyy-mm-dd",
			todayBtn: true,
			todayHighlight: true,
			autoclose: true
		});

		getCategoryByProductMainAid();
		getProductFieldByProductMainAid();

		rewritePriceZone();
		
		<?=@$message?>
		<?=@$js_code?>
	});
</script>