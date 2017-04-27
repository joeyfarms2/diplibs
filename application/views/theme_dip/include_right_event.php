<?php 
	$event_list = @$event_list;
	$news_popular_list = @$news_popular_list['results'];
	$news_recommended_list = @$news_recommended_list['results'];
	$news_talk_of_the_town_list = @$news_talk_of_the_town_list['results'];
	$news_top_commenters = @$news_top_commenters['results'];
	$word = "news";
?>

<aside id="sidebar2" class="col-md-4 custom-right-box">
	
	<!-- Start : Popular News box -->
	<?php if(is_var_array($news_popular_list)){ ?>
	<div class="boxFocus">
		<div class="boxTitle">
			<h3 class="txt-green">Popular News</h3>
		</div>
		<p>Our popular <?=$word?>.</p>

		<div class="boxContent">
		<?php foreach($news_popular_list as $item){ ?>
			<div class="row">
				<div class="col-md-12 news-content">
					<div class="media">
				      <div class="pull-left mrn">
					      <a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>" class="clearfix">
					      	<?php if (file_exists(get_array_value($item,"cover_image_thumb",""))) { ?>
					        		<img src='<?=get_image(get_array_value($item,"cover_image_thumb",""), "-thumb")?>' class='img-responsive size-w-l' />
					        	<?php } else { ?>
					        		<img data-src="<?=JS_PATH?>holder.js/100x100/text:no-image" class="img-responsive" />
					        	<?php } ?>
					      </a>
				        	<div class="under-img">
					      	<i class="bd-icon bd-icon-wow" title="Wow!"></i> 
					      	<div class="text">
					      		<span class="badge bg-orange"><?=get_array_value($item, 'total_wow', '0')?> &nbsp;Wow!</span>
					      	</div>
					      </div>
				      </div>
				      
				      <div class="media-body">
				        <div class="media-heading clearfix">
				        	<div  class="event-header col-sm-12">
					        	<a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>"><h4 class="line-1 mbn textSub pln prn"><?=get_array_value($item,"short_title","")?></h4></a>
				        	</div>
				        	<div class="clearfix"></div>
				        	<div class="line-2 col-sm-12"><?=get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item,"publish_date",""), '');?></div>
				        </div>
				      </div>
			    	</div>
			    </div>
		    </div>

		<?php } ?>
		</div>

	</div>
	<?php } ?>
	<!-- End : Popuplar News box -->


	<!-- Start : Recommended box -->
	<?php if(is_var_array($news_recommended_list)){ ?>
	<div class="separator"></div>
	
	<div class="boxFocus">
		<div class="boxTitle">
			<h3 class="txt-green">Recommended</h3>
		</div>
		<p>The recommended <?=$word?> selected by your librarian.</p>

		<div class="boxContent">
		<?php foreach($news_recommended_list as $item){ ?>
			<div class="row">
				<div class="col-md-12 news-content">
					<div class="media">
				      <a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>" class="pull-left mrn">
				      	<?php if (file_exists(get_array_value($item,"cover_image_thumb",""))) { ?>
				        		<img src='<?=get_image(get_array_value($item,"cover_image_thumb",""), "-thumb")?>' class='img-responsive size-w-l' />
				        	<?php } else { ?>
				        		<img data-src="<?=JS_PATH?>holder.js/100x100/text:no-image" class="img-responsive" />
				        	<?php } ?>
				      </a>
				      <div class="media-body">
				        <div class="media-heading clearfix">
				        	<div  class="event-header col-sm-12">
					        	<a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>"><h4 class="line-1 mbn textSub pln prn"><?=get_array_value($item,"short_title","")?></h4></a>
				        	</div>
				        	<div class="clearfix"></div>
				        	<div class="line-2 col-sm-12"><?=get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item,"publish_date",""), '');?></div>
				        </div>
				      </div>
			    	</div>
			    </div>
		    </div>

		<?php } ?>
		</div>

	</div>
	<?php } ?>
	<!-- End : Recommended box -->


	<!-- Start : Talk of the town box -->
	<?php if(is_var_array($news_talk_of_the_town_list)){ ?>
	<div class="separator"></div>

	<div class="boxFocus">
		<div class="boxTitle">
			<h3 class="txt-green">Talk of the Town</h3>
		</div>

		<div class="boxContent">
		<?php foreach($news_talk_of_the_town_list as $item){ ?>
			<div class="row">
				<div class="col-md-12 news-content">
					<div class="media">
				      <div class="pull-left mrn">
					      <a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>" class="clearfix">
					      	<?php if (file_exists(get_array_value($item,"cover_image_thumb",""))) { ?>
					        		<img src='<?=get_image(get_array_value($item,"cover_image_thumb",""), "-thumb")?>' class='img-responsive size-w-l' />
					        	<?php } else { ?>
					        		<img data-src="<?=JS_PATH?>holder.js/100x100/text:no-image" class="img-responsive" />
					        	<?php } ?>
					      </a>
				        	<div class="under-img">
					      	<i class="bd-icon bd-icon-comment" title="Comment"></i> 
					      	<div class="text">
					      		<span class="badge bg-orange"><?=get_array_value($item, 'total_comment', '0')?> &nbsp;Comments</span>
					      	</div>
					      </div>
				      </div>
				      <div class="media-body">
				        <div class="media-heading clearfix">
				        	<div  class="event-header col-sm-12">
					        	<a href="<?=site_url('news/detail/'.get_array_value($item, 'aid'))?>"><h4 class="line-1 mbn textSub pln prn"><?=get_array_value($item,"short_title","")?></h4></a>
				        	</div>
				        	<div class="clearfix"></div>
				        	<div class="line-2 col-sm-12"><?=get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item,"publish_date",""), '');?></div>
				        </div>
				      </div>
			    	</div>
			    </div>
		    </div>

		<?php } ?>
		</div>

	</div>
	<?php } ?>
	<!-- End : Talk of the town box -->



	<!-- Start : Hot comments box -->
	<?php if(is_var_array($news_top_commenters)){ ?>
	<div class="separator"></div>
	<div class="boxFocus">
		<div class="boxTitle">
			<h3 class="txt-green">Hot Comments</h3>
		</div>
		
		<div class="boxContent">
		<?php foreach($news_top_commenters as $item){ ?>
		<div class="row">
			<div class="col-md-12">
				<div class="media">
			      <a href="#" class="pull-left">
			        <?php if (file_exists( str_replace(site_url(), '', get_array_value($item,"avatar_mini_path","")) )) { ?>
			        		<img src='<?=get_array_value($item,"avatar_mini_path","")?>' class='img-responsive size-s' />
			        	<?php } else { ?>
			        		<img data-src="<?=JS_PATH?>holder.js/60x60/text:no-image" class="img-responsive size-s" />
			        	<?php } ?>
			      </a>
			      <div class="media-body">
			        <div class="media-heading clearfix">
			        	<div>
				        	<h4 class="mbn pln prn"><?=get_array_value($item,"full_name_th","")?></h4>
				        	<!-- <div class="line-2"><?=get_array_value($item,"department","")?></div> -->
			        	</div>
			        	<div class="textStart"><?=get_array_value($item,"total_comment","0")?> <?=$item['total_comment'] > 1 ? 'comments' : 'comment'?></div>
			        </div>
			      </div>
		    	</div>
		    </div>
	    </div>
	    <?php } ?>
	    </div>

	</div>
	<?php } ?>
	<!-- End : Hot comments box -->

</aside>