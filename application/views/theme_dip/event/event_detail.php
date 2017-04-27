<style type="text/css">
.panel-comments .media, .media-body {
	/*overflow: visible;*/
}
</style>


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
							<div class="col-md-6 text-left txt-green pln div_total_join"><?=get_array_value($item_detail, 'txt_total_join', '')?></div>
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

			    	<div class="event-actions mtl mbl col-lg-12 clearfix">
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

		        	<div class="clearfix"></div>
		        	<!-- Start others' comments panel -->
				   	<div class="event-comments">
			    	</div>
			    	<div class="clearfix"></div>
			    	<!-- End others' comments panel -->


				   	<!-- Start my comment panel (only for login user) -->
				    <?php if(is_login()) { ?>
			    	<div class="event-my-comment">
				    	<div class="media">
					      <a href="#" class="pull-left">
					        <?=get_array_value($user_login_info,"avatar_tiny","")?>
					      </a>
					      <div class="media-body">
					        	<textarea class="form-control txt-your-comment new" name="your_comment" placeholder="Write your comment..." data-parent-event-aid="<?=get_array_value($item_detail,'aid','')?>"></textarea>
					      </div>
					    </div>
				    </div>
				    <?php }  ?>
				    <!-- End my comment panel (only for login user) -->

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


<script type="text/javascript" src="<?=CSS_PATH?><?=CONST_CODENAME?>/js-plugin/autosize/jquery.autosize.min.js"></script>
<script type="text/javascript">
	var sid = Math.floor(Math.random()*10000000000);

	function initWhoWowsThisComment() {
		// On mouse over who wows this event
		$('.event-comments').undelegate('a.who-wow-this-comment', 'mouseenter');
		$('.event-comments').delegate('a.who-wow-this-comment', 'mouseenter',function() {
			var this_node = $(this);
			var panel_this_comment = $(this_node).closest('.box-comment');
			var url = '<?=site_url("event/ajax-load-who-wow-this-comment/")?>'+sid;
			var arr_input_data = [];
			arr_input_data.push({ name: 'comment_aid', value: $(panel_this_comment).attr('data-comment-aid') });
			
			if ($(this_node).attr('data-original-title') == '') {
				$.getJSON(
					url, 
					arr_input_data,
					function(data) {
						// $(this_node).tooltip({content: data.html, html: true}).tooltip('show');
						$(this_node).tooltip({ html:true });
						$(this_node).attr('data-original-title', data.html)
	                	.tooltip('fixTitle')
	                	.tooltip('show');
	               
					}
				);
			}

		});
	}

	function initViewAllComments() {
		if ($('a.view-more-comments').length > 0) {
			$('.event-comments').undelegate('a.view-more-comments', 'click');
			$('.event-comments').delegate('a.view-more-comments', 'click',function() {
				var this_node = $(this);
				var panel_box_event = $(this_node).closest('.box-event');
				var panel_view_more_comments = $(this_node).closest('.panel-view-more-comments');
				var panel_event_comments = $(this_node).closest('.event-comments');
				var url = '<?=site_url("event/ajax-load-view-all-comments/")?>'+sid;
				var arr_input_data = [];
				arr_input_data.push({ name: 'event_aid', value: $(panel_box_event).attr('data-event-aid') });
				
				$.ajax({
	               url: url,
	               type: "post",
	               dataType: "json",
	               data: arr_input_data,
	               beforeSend:function() {
		  					$(panel_view_more_comments).html('<div>Loading...</div>');
		  				}
	           	})
	           	.success(function( data ) {
	               if ( data.status == "success" ) {
	                  $(panel_event_comments).html(data.html_panel_comment);
	               }
	               else {

	               }
	            });

			});
		}
	}


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
		

		$('.event-actions').undelegate('.who-join', 'mouseenter');
		$('.event-actions').delegate('.who-join', 'mouseenter',function() {
			var this_node = $(this);
			var panel_box_event = $(this_node).closest('.box-event');
			var url = '<?=site_url("event/ajax-load-who-join/")?>'+sid;
			var arr_input_data = [];
			arr_input_data.push({ name: 'event_aid', value: $(panel_box_event).attr('data-event-aid') });
			arr_input_data.push({ name: 'include_me', value: '1' });
			
			if ($(this_node).attr('data-original-title') == '') {
				$.getJSON(
					url, 
					arr_input_data,
					function(data) {
						// $(this_node).tooltip({content: data.html, html: true}).tooltip('show');
						$(this_node).tooltip({ html:true });
						$(this_node).attr('data-original-title', data.html)
	                	.tooltip('fixTitle')
	                	.tooltip('show');
	               
					}
				);
			}
		});


		// Initialize everything after loading comments panel and who wows panel
		$('.box-event.new').each(function() {
			var panel_event_comments = $(this).find('.event-comments');
			var panel_event_actions = $(this).find('.event-actions');
			// var panel_event_activity = $(this).find('.event-activity');
			// var panel_event_activity_msg = $(panel_event_activity).find('.event-user-activity');
			var sid = Math.floor(Math.random()*10000000000);
	  		var arr_input_data = [];
	  		arr_input_data.push({ name: 'parent_event_aid', value: $(this).attr('data-event-aid') });
	  		// var serializedData = arr_input_data.serialize();
	  		$.ajax({
               url: '<?=site_url("event/ajax-load-user-panels")?>'+"/"+sid,
               type: "post",
               dataType: "json",
               data: arr_input_data,
               beforeSend:function() {
	  					$(panel_event_comments).html('<div>Loading...</div>');
	  				}
           	})
           	.success(function( data ) {
               	if ( data.status == "success" ) {
	              	// $(panel_event_actions).html(data.html_panel_actions);
	              	$(panel_event_comments).html(data.html_panel_comment);
                  
					initWhoWowsThisComment();
					initViewAllComments();

                  	// Wow event comment
                  	$(panel_event_comments).undelegate('.action-icon-wow-comment', 'click');
						$(panel_event_comments).delegate('.action-icon-wow-comment', 'click', function() {
							<?php if(is_login()) { ?>
								var panel_this_comment = $(this).closest('.box-comment');
								var panel_comment_total_wow = $(this).siblings('.panel-comment-total-wow');
								var this_node = $(this);
								var sid = Math.floor(Math.random()*10000000000);
						  		var arr_input_data = [];
						  		arr_input_data.push({ name: 'comment_aid', value: $(panel_this_comment).attr('data-comment-aid') });
						  		if ($(this_node).hasClass('wowed')) {
									var post_url = '<?=site_url("event/ajax-unwow-comment")?>';
									arr_input_data.push({ name: 'status', value: '0' });
								}
								else {
									var post_url = '<?=site_url("event/ajax-wow-comment")?>';
									arr_input_data.push({ name: 'status', value: '1' });
								}
						  		$.ajax({
					               url: post_url+"/"+sid,
					               type: "post",
					               dataType: "json",
					               data: arr_input_data
					           	})
					           	.success(function( data ) {
					               if ( data.status == "success" ) {
					                  $(panel_comment_total_wow).html(data.html_panel_comment_total_wow);
					                  $(panel_comment_total_wow).addClass('hidden');
					                  if (data.total_wow > 0) {
					                  	$(panel_comment_total_wow).removeClass('hidden');
					                  	initWhoWowsThisComment();
					                  }
					                  $(this_node).removeClass('wowed');
					                  if (data.has_wowed) {
					                  	$(this_node).addClass('wowed');
					                  }
					                  $(this_node).text(data.new_txt_action);
					               }
					               return false;
					           	});
							<?php } else { ?>
						    	$(this).closest('.event-comments').siblings('.msg-event-login')
							   	.removeClass('hidden')
							   	.html('Please <a href="'+'<?=site_url("login")?>'+'"><strong>log in</strong></a> to say wow!')
							   	.effect("highlight", {color: '#FFF3BE'}, 2000);
						    <?php } ?>
						});

               }
               return false;
           	});
		});

		// Toggle show/hide delete (my) comment link, when on mouseenter and on mouseleave
		$('.box-event.new').delegate('.box-comment', 'mouseenter mouseleave', function() {
			$(this).find('.panel-delete-comment').toggleClass('hidden');
		});
		$('.box-event.new').delegate('.panel-delete-comment > a', 'click', function() {
			var this_node = $(this);
	  		var panel_event_comments = $(this_node).closest('.event-comments');
	  		var panel_event_actions = $(panel_event_comments).siblings('.event-actions');
	  		var panel_view_more_comments = $(this_node).closest('.panel-comments').siblings('.panel-view-more-comments');
	  		var panel_this_comment = $(this_node).closest('.box-comment');
	  		var panel_box_event = $(this_node).closest('.box-event');
	  		var sid = Math.floor(Math.random()*10000000000);
	  		var arr_input_data = [];
	  		arr_input_data.push({ name: 'comment_aid', value: $(panel_this_comment).attr('data-comment-aid') });
	  		arr_input_data.push({ name: 'parent_event_aid', value: $(panel_box_event).attr('data-event-aid') });
	  		arr_input_data.push({ name: 'has_view_all_link', value: $(panel_view_more_comments).length });
	  		$.ajax({
               url: '<?=site_url("event/ajax-delete-comment")?>'+"/"+sid,
               type: "post",
               dataType: "json",
               data: arr_input_data
           	})
           	.success(function( data ) {
               if ( data.status == "success" ) {
                  $(panel_event_comments).html(data.html_panel_comment);
                  $(panel_event_actions).html(data.html_panel_actions);
                  return false;
               }
               else {
                  return false;
               }
           	});
		});

		// Toggle hide/unhide comment link, when on mouseenter and on mouseleave (for admin)
		$('.box-event.new').delegate('.box-comment', 'mouseenter mouseleave', function() {
			$(this).find('.panel-hide-comment').toggleClass('hidden');
		});
		$('.box-event.new').delegate('.panel-hide-comment > a', 'click', function() {
	  		var this_node = $(this);
	  		var panel_event_comments = $(this_node).closest('.event-comments');
	  		var panel_event_actions = $(panel_event_comments).siblings('.event-actions');
	  		var panel_view_more_comments = $(this_node).closest('.panel-comments').siblings('.panel-view-more-comments');
	  		var panel_this_comment = $(this_node).closest('.box-comment');
	  		var panel_box_event = $(this_node).closest('.box-event');
	  		var sid = Math.floor(Math.random()*10000000000);
	  		var arr_input_data = [];
	  		arr_input_data.push({ name: 'comment_aid', value: $(panel_this_comment).attr('data-comment-aid') });
	  		arr_input_data.push({ name: 'parent_event_aid', value: $(panel_box_event).attr('data-event-aid') });
	  		arr_input_data.push({ name: 'status', value: $(this_node).attr('data-status') });
	  		arr_input_data.push({ name: 'has_view_all_link', value: $(panel_view_more_comments).length });
	  		$.ajax({
               url: '<?=site_url("event/ajax-hide-comment")?>'+"/"+sid,
               type: "post",
               dataType: "json",
               data: arr_input_data
           	})
           	.success(function( data ) {
               if ( data.status == "success" ) {
                  $(panel_event_comments).html(data.html_panel_comment);
                  $(panel_event_actions).html(data.html_panel_actions);
                  return false;
               }
               else {
                  return false;
               }
           	});
		});

		// Initialize textareas for writing comment
		$('.txt-your-comment.new').autosize(); 
		$('.txt-your-comment.new').css('height', '35px');

		$(".txt-your-comment.new").blur(function() {
			if ($.trim($(this).val())=="") $(this).css('height', '35px');
		});
		$('.txt-your-comment.new').keydown(function(e) {
		    if (e.keyCode == 13 && !e.shiftKey) {
		    		// Enter was pressed without shift key
		        	// prevent default behavior
		        	e.preventDefault();

		        	if ($.trim($(this).val()) == "")
			  			return false;

			  		var this_node = $(this);
			  		var panel_event_comments = $(this_node).closest('.event-my-comment').siblings('.event-comments');
			  		var panel_event_actions = $(this_node).closest('.event-my-comment').siblings('.event-actions');
			  		var panel_view_more_comments = $(panel_event_comments).find('.panel-view-more-comments');
			  		var sid = Math.floor(Math.random()*10000000000);
			  		var arr_input_data = [];
			  		arr_input_data.push({ name: 'comment', value: $(this_node).val() });
			  		arr_input_data.push({ name: 'parent_event_aid', value: $(this_node).attr('data-parent-event-aid') });
			  		arr_input_data.push({ name: 'has_view_all_link', value: $(panel_view_more_comments).length });
			  		// var serializedData = arr_input_data.serialize();
			  		$.ajax({
		               url: '<?=site_url("event/ajax-add-comment")?>'+"/"+sid,
		               type: "post",
		               dataType: "json",
		               data: arr_input_data
		           	})
		           	.success(function( data ) {
		               if ( data.status == "success" ) {
		                  $(panel_event_comments).html(data.html_panel_comment);
		                  $(panel_event_actions).html(data.html_panel_actions);
		                  $(this_node).val('');
		                  return false;
		               }
		               else {
		                  return false;
		               }
		           	});
		    }
		});


		$('[data-toggle="tooltip"]').tooltip({ html: true });

		$('.box-event.new').removeClass('new');
		$('.txt-your-comment.new').removeClass('new');
		$('.action-icon-wow.new').removeClass('new');
		$('.action-icon-comment.new').removeClass('new');



		<?=@$message?>
		<?=@$js_code?>
	});
</script>