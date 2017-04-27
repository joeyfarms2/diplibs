<?php
	$item_result = @$item_result;
	$product_type_detail = @$product_type_detail;
	$product_main_url = get_array_value($item_result,"product_main_url","none");
	
	$product_type_aid = get_array_value($product_type_detail,"aid","1");

	$has_license = get_array_value($item_result,"has_license","0");
	$shelf_vdo_result = @$shelf_vdo_result;
	$biblio_field_result = get_array_value($item_result,"biblio_field_result","");
	$product_gallery_result = get_array_value($item_result,"product_gallery_list","");
	// echo "<pre>";
	// print_r($product_gallery_result);
	// echo "</pre>";
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
		
		<section id="page">
			<section id="content" class="mt30 pb30">
				<div class="container">
					<div class="row mb30">
						<div class="col-lg-12">
							<div class="product-title">
								<i class="fa fa-circle"></i>&nbsp;
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
								&nbsp;&nbsp;<a href="<?=site_url('search/'.get_array_value($item_result,"author",""))?>?search_in=author"><?=get_array_value($item_result,"author","")?></a>&nbsp;
							</div>
						</div>
					</div>
					<div class="row mb30">
						<div class="col-lg-12"> 

									<div class="cover-gallery-detail">
										<img src="<?=get_image(get_array_value($item_result,"cover_image_ori_path",""),"vdo-ori")?>" class="" /> 
									</div>
								
								
						</div>
					</div>
						<?php if(!is_blank(get_array_value($item_result,"description",""))){ ?>
					<div class="row mb30">
						<div class="col-lg-12">
							<p class="description-vdo"><?=get_array_value($item_result,"description","")?></p>
						</div>
					</div>
						<?php } ?>
					<?php if(is_var_array($product_gallery_result)){ ?>
					<div class="row mb30">
						<?php
							foreach ($product_gallery_result as $gallery_result) { 
								//print_r($gallery_result);
						?>
						<div class="col-md-3 col-sm-4 col-xs-12 cover-gallery-small">
							
								<a class="fancybox" href="<?=get_image(get_array_value($gallery_result,"image_original",""),"")?>" data-fancybox-group="gallery" title="<?=get_array_value($gallery_result,"description","")?>">
									<img src="<?=get_image(get_array_value($gallery_result,"image_thumb",""),"")?>" class="" />
								</a> 			
							
						</div>
						<?php 
					 		} 
					 	?>
					</div>
					<?php } ?>
				</div>
			</section>
		</section>

	<?php if(is_var_array($biblio_field_result)){ ?>
		<section id="marc">
			<section id="content" class="mt30 pb30">
				<div class="container">
					<div class="row mb30">
						<div class="col-lg-12">
							<div class="review-title button" onclick="toggleMarc()">
								<div class="col-lg-10">MARC Information</div>
								<div class="col-lg-2 review-span a-right"><i id="marc-arrow" class="fa fa-plus"></i></div>
							</div>
						</div>
					</div>
					<div id="marc-content" class="marc-box hide">
						<?php 
							foreach ($biblio_field_result as $field) { 
								$tag = get_array_value($field,"tag","");
								$subfield_cd = get_array_value($field,"subfield_cd","");
								$name = get_array_value($field,"name","");

								$tag_name = trim($tag." ".$subfield_cd);
								if(!is_blank($tag_name)){
									$tag_name .= " : ".$name;
								}else{
									$tag_name = $name;
								}
								if(get_array_value($field,"field_data_link","") != ""){


						?>
							<div class="row mb10">
								<div class="col-sm-3"><div class="marc-title"><?=$tag_name;?>&nbsp;</div></div>
								<div class="col-sm-9"><div class="marc-body"><?=get_array_value($field,"field_data_link","");?>&nbsp;</div></div>
							</div>
						<?php 
								}
							}
						?>
					</div>
				</div>
			</section>
		</section>
		<?php } ?>


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
	});
</script>