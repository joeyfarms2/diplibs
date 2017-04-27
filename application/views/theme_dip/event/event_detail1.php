<div id="message-box">
	<div id="result-msg-box" class="hidden" ></div>
</div>


<section id="projects">
	<div class="container mt15 pan">

		<?php if(is_var_array($item_detail)) { ?>

			<!-- Start event box -->
			<div class="box-generic box-event new" data-event-aid="<?=get_array_value($item_detail, 'aid')?>">
				
				<!-- Start event content -->
				<div class="event-content pal clearfix">
					<h3 class="txt-blue mbl"><?=get_array_value($item_detail,"title","")?></h3>

					<h4 class="text-center txt-black fs18 pts pbs mbn"><?=get_array_value($item_detail, 'event_period_date_txt', '')?></h4>
					<?php if (!is_blank($item_detail['location'])) { ?>
						<h4 class="text-center txt-orange fs16pts pbs mbn"><?=get_array_value($item_detail, 'location', '')?></h4>
					<?php } ?>

					<div class="event-actions ptn pbm col-lg-12 clearfix" style="border-bottom:1px solid #ccc;">
						<?php if ( $item_detail['is_public'] == '1' ) { ?>
							<div class="col-md-6 text-left txt-green pln">This is a public event.</div>
						<?php } else { ?>
							<div class="col-md-6 text-left txt-green pln"><?=get_array_value($item_detail, 'txt_total_join', '')?></div>
						<?php } ?>

						<div class="col-md-6 text-right prn">
			        	<?php if ( $item_detail['is_public'] == '0' && !$item_detail['has_passed'] && $item_detail['is_invited'] == true ) { ?>
				        	<?php if ($item_detail['has_action'] == true) { ?>
				        		<span class="has-action"><?=get_array_value($item_detail, 'has_joined_txt_long', '')?></span>
				        	<?php } else if ($item_detail['has_action'] == false) { ?>
				        		<a href="javascript:void(0);" class="action-event" data-val='1'>Join</a>
				        		<a href="javascript:void(0);" class="action-event" data-val='0'>No</a>
				        	<?php } ?>
			        	<?php } ?>
			        	</div>
		        	</div>

				    <?php 
				    // echo $item['cover_image_file_type'];
				    if (get_array_value($item_detail,"cover_image_file_type","") != "") { 
				    	$cover_image_full_path = './'.get_array_value($item_detail,"cover_image_actual","");
				    	if (file_exists($cover_image_full_path)) {
				    ?>
					    <div class="media-cover text-center clearfix">
					    	<!-- <img data-src="<?=JS_PATH?>holder.js/100%x500" class="img-responsive" /> -->
					    	<!-- <img src='<?=$cover_image_full_path?>' /> -->
					    	<img src='<?=get_image(get_array_value($item_detail,"cover_image_actual",""), "-actual")?>' />
					    </div>
				    <?php } } ?>

					<div class="clearfix"></div>

					<?php if (!is_blank($item_detail['description']) && trim($item_detail['description']) != '<br/>' && trim($item_detail['description']) != '<br>') { ?>
						<div class="event-text ptl pbl" style="border-bottom:1px solid #ccc;">
					    	<?=nl2br(get_array_value($item_detail,"description",""))?>
				    	</div>
			    	<?php } ?>

			    	<div class="clearfix"></div>

			    	<div class="event-actions ptl pbm col-lg-12 clearfix">
			        	<div class="media col-md-6 text-left pln">
					      
					        <?php if (file_exists( str_replace(site_url(), '', get_array_value($item_detail,"avatar_mini_path","")) )) { ?>
					        		<img src='<?=get_array_value($item_detail,"avatar_mini_path","")?>' class='img-responsive size-s pull-left' />
					        	<?php } else { ?>
					        		<img data-src="<?=JS_PATH?>holder.js/60x60/text:no-image" class="img-responsive size-s pull-left" />
					        	<?php } ?>
					      
					      <div class="media-body">
					        <div class="media-heading clearfix">
						        	<div>
						        		<small>Posted by:</small>
							        	<h4 class="mbn"><?=get_array_value($item_detail,"full_name_th","")?></h4>
							        	<div class="line-2"><?=get_array_value($item_detail,"department","")?></div>
						        	</div>
					        </div>
					      </div>
				    	</div>

			        	<div class="col-md-6 text-right prn">
			        	</div>
		        	</div>

				</div>
				<!-- End event content -->

		    <div class="msg-event-login hidden"></div>
		    <!-- End my comment panel (only for login user) -->
			    
			</div>

		<?php 

		}else{
		?>
		<?php $message = set_message_error("Oops! It looks like this event has been deleted.")?>
		<?php } ?>

		</div>
	</section>

<script type="text/javascript">
	$(document).ready(function($){

		var sid = Math.floor(Math.random()*10000000000);

		$('.action-event').click(function() {
				<?php if(is_login()) { ?>
				var panel_event_total_join = $(this).closest('.event-actions').find('.text-left');
				var panel_event_actions = $('.event-actions').find('.text-right');
				var event_aid = $(this).closest('.box-event').attr('data-event-aid');
				var arr_input_data = [];
		  		arr_input_data.push({ name: 'event_aid', value: event_aid });
		  		arr_input_data.push({ name: 'has_joined', value: $(this).attr('data-val') });
		  		$.ajax({
	               url: '<?=site_url("event/ajax-save-action-join")?>'+"/"+sid,
	               type: "post",
	               dataType: "json",
	               data: arr_input_data,
	               beforeSend:function() {
		  					$(panel_event_actions).html('<span>Saving...</span>');
		  				}
	           	})
	           	.success(function( data ) {
	               if ( data.status == "success" ) {
	               	$(panel_event_total_join).html(data.txt_total_join);
	               	$(panel_event_actions).html('<span class="has-action">'+data.has_joined_txt_long+'</span>');
	               }
	            });
	         <?php } else { ?>
	         	alert('Please log in before accept this invitation.');
	         <?php } ?>
			});
		
		<?=@$message?>
		<?=@$js_code?>
	});
</script>