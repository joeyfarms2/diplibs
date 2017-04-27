<?php
	$item_result = @$item_result;
	$product_type_detail = @$product_type_detail;
	$product_main_url = get_array_value($item_result,"product_main_url","none");
	$product_main_aid = get_array_value($item_result,"product_main_aid","0");
	
	$product_type_aid = get_array_value($product_type_detail,"aid","1");

	$has_license = get_array_value($item_result,"has_license","0");

	$product_gallery_list = get_array_value($item_result,"product_gallery_list","");
	//print_r($item_result);
?>	
<script type="text/javascript" src="<?=JS_PATH?><?=folderName?>/product.js"></script>
<script type="text/javascript" src="<?=JS_PATH?>product/product_front/review.js"></script>

<script type="text/javascript" src="<?=THEME_ADMIN_PATH?>assets/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
<script type="text/javascript" src="<?=THEME_ADMIN_PATH?>assets/fancybox/source/jquery.fancybox.js"></script>
<link href="<?=THEME_ADMIN_PATH?>assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
<script type="text/javascript">
		$(document).ready(function() {
			/*
			 *  Simple image gallery. Uses default settings
			 */

			$('.fancybox').fancybox({
				// openEffect	: 'none',
				// closeEffect	: 'none'
			});

		});
	</script>
<style>
.text_img{
	white-space:normal !important;
	width:1024px;
	height: auto;
	/*margin: auto auto 30px auto;*/
}
</style>
	<?php 
		if ($product_main_url != "multimedia"){
	?>
			<section id="page">
					<section id="content" class="mt30 pb30">
						<div class="container">
							<div class="row mb30">
								<div class="col-lg-12">
									<div class="product-title">
										<?=get_array_value($item_result,"title","")?>&nbsp;
										<span class="status-box-detail status">
											<?php $review_point = get_array_value($item_result,"review_point","0"); ?>
											<span class="rating-show">
												<span class="star <?=($review_point >= 5) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 4) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 3) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 2) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 1) ? "focus" : ""?>"></span>
											</span>
										</span>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="product-author">
										<a href="<?=site_url('search/'.get_array_value($item_result,"author",""))?>?search_in=author"><?=get_array_value($item_result,"author","")?></a>&nbsp;
									</div>
								</div>
							</div>
							<div class="row mb30">
								<div class="col-lg-8"> 

										<?php
											$upload_path = get_array_value($item_result,"upload_path","")."file/";
											$file_upload = get_array_value($item_result,"uri","");
											$file = $upload_path.$file_upload;
											// echo "path : ".$file;
											$ext_source =  get_array_value($item_result,"ext_source","");
											// echo "ext_source = $ext_source<BR>";
											if(is_file($file)){
											?>
												<video id="my_video_1" class="cover-vdo-detail border-box video-js vjs-default-skin" autoplay="autoplay" controls
													preload="auto" width="745" height="440" poster=""
													data-setup="{}">
													<source src="<?=site_url($file)?>" id="vdo_mp4">
												</video>	
											<?php 
											}else if(!is_blank($ext_source)){
											?>
												<iframe class="cover-vdo-detail" width="745" height="440" src="http://www.youtube.com/embed/<?=$ext_source?>" frameborder="0" allowfullscreen></iframe>
											<?php
											}else{
										?>
										<div class="cover-vdo-detail" style="margin:auto auto;">
											<img src="<?=get_image(get_array_value($item_result,"cover_image_ori_path",""),"vdo-ori")?>" class="" /> 
										</div>
										<?php } ?>
								</div>
								<?php if(!is_blank(get_array_value($item_result,"description",""))){ ?>
								<div class="col-lg-4">
									<p class="description-vdo"><?=get_array_value($item_result,"description","")?></p>
								</div>
								<?php } ?>
							</div>
							
							<div class="row mb30">
								<div class="col-lg-12">
								<?php
									if(is_var_array($product_gallery_list)){
										//print_r($product_gallery_list);
											foreach ($product_gallery_list as $product_list) {
													//print_r($product_list);

								?>
												<a class="fancybox" href="<?=site_url(get_array_value($product_list,"image_original",""))?>" data-fancybox-group="gallery" title="<?=get_array_value($product_list,"description","")?>"><img src="<?=get_image(get_array_value($product_list,"image_thumb",""),"vdo-ori")?>"  style="border:solid 1px #ccc;padding: 4px;"></a>
								<?php
											}
									 }

								?>
							
								</div>
							
							</div>
						</div>
					</section>
				</section>

	<?php
		}else{
			if(get_array_value($item_result,"source_type","") == 1){

			?>
				<section id="page">
					<section id="content" class="mt30 pb30">
						<div class="container">
							<div class="row mb30">
								<div class="col-lg-12">
									<div class="product-title">
										<?=get_array_value($item_result,"title","")?>&nbsp;
										<span class="status-box-detail status">
											<?php $review_point = get_array_value($item_result,"review_point","0"); ?>
											<span class="rating-show">
												<span class="star <?=($review_point >= 5) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 4) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 3) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 2) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 1) ? "focus" : ""?>"></span>
											</span>
										</span>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="product-author">
										<a href="<?=site_url('search/'.get_array_value($item_result,"author",""))?>?search_in=author"><?=get_array_value($item_result,"author","")?></a>&nbsp;
									</div>
								</div>
							</div>
							<div class="row mb30">
								<div class="col-lg-12"> 

										<?php
											$upload_path = get_array_value($item_result,"upload_path","")."file/";
											$file_upload = get_array_value($item_result,"uri","");
											$file = $upload_path.$file_upload;
											// echo "path : ".$file;
											$ext_source =  get_array_value($item_result,"ext_source","");
											// echo "ext_source = $ext_source<BR>";
											if(is_file($file)){
											?>
												<video id="my_video_1" class="cover-vdo-detail border-box video-js vjs-default-skin" autoplay="autoplay" controls
													preload="auto" width="745" height="440" poster=""
													data-setup="{}">
													<source src="<?=site_url($file)?>" id="vdo_mp4">
												</video>	
											<?php 
											}else if(!is_blank($ext_source)){
											?>
												<iframe class="cover-vdo-detail" width="745" height="440" src="http://www.youtube.com/embed/<?=$ext_source?>" frameborder="0" allowfullscreen></iframe>
											<?php
											}else{
										?>
										<div class="cover-vdo-detail" style="margin:auto auto;">
											<img src="<?=get_image(get_array_value($item_result,"cover_image_ori_path",""),"vdo-ori")?>" class="" /> 
										</div>
										<?php } ?>
								</div>
								
							</div>
							
							<div class="row mb30">
								<div class="col-lg-12">
								<?php
									$strSQL = "SELECT * FROM vdo_gallery WHERE parent_aid ='".get_array_value($item_result,"aid","")."'";
									$objQuery = mysql_query($strSQL) or die ("Error Query [".$strSQL."]");

									
									while($objResult = mysql_fetch_array($objQuery))
										{
									?>
											<a class="fancybox" href=<?=PUBLIC_PATH.$upload_path.$objResult["name"];?> data-fancybox-group="gallery" ><img src=<?=PUBLIC_PATH.$upload_path.$objResult["name"];?> width="150" style="border:solid 1px #ccc;padding: 4px;"></a>
										
									<?php
										}
									?>
								</div>
							<?php if(!is_blank(get_array_value($item_result,"description",""))){ ?>
								<div class="col-lg-12" style="padding-top: 20px;">
									<?=get_array_value($item_result,"description","")?>
								</div>
							<?php } ?>
							</div>
						</div>
					</section>
				</section>

			<?php	
			}else{
			?>		
				<section id="page">
					<section id="content" class="mt30 pb30">
						<div class="container">
							<div class="row mb30">
								<div class="col-lg-12">
									<div class="product-title">
										<?=get_array_value($item_result,"title","")?>&nbsp;
										<span class="status-box-detail status">
											<?php $review_point = get_array_value($item_result,"review_point","0"); ?>
											<span class="rating-show">
												<span class="star <?=($review_point >= 5) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 4) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 3) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 2) ? "focus" : ""?>"></span>
												<span class="star <?=($review_point >= 1) ? "focus" : ""?>"></span>
											</span>
										</span>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="product-author">
										<a href="<?=site_url('search/'.get_array_value($item_result,"author",""))?>?search_in=author"><?=get_array_value($item_result,"author","")?></a>&nbsp;
									</div>
								</div>
							</div>
							<div class="row mb30">
								<div class="col-lg-8"> 

										<?php
											$upload_path = get_array_value($item_result,"upload_path","")."file/";
											$file_upload = get_array_value($item_result,"uri","");
											$file = $upload_path.$file_upload;
											// echo "path : ".$file;
											$ext_source =  get_array_value($item_result,"ext_source","");
											// echo "ext_source = $ext_source<BR>";
											if(is_file($file)){
											?>
												<video id="my_video_1" class="cover-vdo-detail border-box video-js vjs-default-skin" autoplay="autoplay" controls
													preload="auto" width="745" height="440" poster=""
													data-setup="{}">
													<source src="<?=site_url($file)?>" id="vdo_mp4">
												</video>	
											<?php 
											}else if(!is_blank($ext_source)){
											?>
												<iframe class="cover-vdo-detail" width="745" height="440" src="http://www.youtube.com/embed/<?=$ext_source?>" frameborder="0" allowfullscreen></iframe>
											<?php
											}else{
										?>
										<div class="cover-vdo-detail">
											<img src="<?=get_image(get_array_value($item_result,"cover_image_ori_path",""),"vdo-ori")?>" class="" /> 
										</div>
										<?php } ?>
								</div>
								<?php if(!is_blank(get_array_value($item_result,"description",""))){ ?>
								<div class="col-lg-4">
									<p class="description-vdo"><?=get_array_value($item_result,"description","")?></p>
								</div>
								<?php } ?>
							</div>
						</div>
					</section>
				</section>

		<?php
				}
		}
	?>

	<form id="frm_review" name="frm_review">
		<input type="hidden" id="product_type_aid" name="product_type_aid" value="<?=get_array_value($item_result,"product_type_aid","")?>" />
		<input type="hidden" id="parent_aid" name="parent_aid" value="<?=get_array_value($item_result,"aid","")?>" />
		<input type="hidden" id="max_rate" name="max_rate" value="<?=CONST_REVIEW_MAX_POINT?>" />
		<section id="review">
			<section id="content" class="mt30 pb30">
				<div class="container">
					<div class="row mb30">
						<div class="col-lg-12">
							<div class="review-title" id="review_summary_area">No Reviews</div>
						</div>
					</div>
					<div id="review_list_area">There are no reviews yet, why not be the first.</div>

					<div id="review_form_area">
					<?php if(!is_login()){ ?>
						<BR/>Please <a href="<?=site_url('login')?>">Login</a> before write a review.
					<?php }else{ ?>
						<div class="row mt30 pt30 mb20">
							<div class="col-lg-12">
								<div class="review-title">Write a new review by <span class="name"><?=getUserLoginFullName($user_login_info)?></span></div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 review-form mb20">
								<?php $user_login_info["avatar_mode"] = "thumb"; ?>
								<div class="avatar col-lg-2"><?=getUserLoginAvatar($user_login_info)?></div>
								<div class="form col-lg-10"><textarea id="description" name="description"></textarea></div>
							</div>
							<div class="col-lg-12 review-button">
								Click to Rate : 
								<span class="rating">
									<span class="star" id="rate-5" data-rate="5" onclick="drawReviewPoint('5', '<?=CONST_REVIEW_MAX_POINT?>')"></span>
									<span class="star" id="rate-4" data-rate="4" onclick="drawReviewPoint('4', '<?=CONST_REVIEW_MAX_POINT?>')"></span>
									<span class="star" id="rate-3" data-rate="3" onclick="drawReviewPoint('3', '<?=CONST_REVIEW_MAX_POINT?>')"></span>
									<span class="star" id="rate-2" data-rate="2" onclick="drawReviewPoint('2', '<?=CONST_REVIEW_MAX_POINT?>')"></span>
									<span class="star" id="rate-1" data-rate="1" onclick="drawReviewPoint('1', '<?=CONST_REVIEW_MAX_POINT?>')"></span>
								</span>
								<input type="hidden" id="point" name="point" value="0" />
								<button type="button" name="btn_login" id="btn_login" class="btn btn-success" onClick="saveReview()">Post Review </button>
							</div>
						</div>						
					<?php } ?>
					</div>
				</div>
			</section>
		</section>
	</form>
<script type="text/javascript">
	jQuery(document).ready(function($){
		showReview();
		<?=@$message?>
		<?=@$js_code?>	
			//$('.fancybox').fancybox();	
	});
</script>