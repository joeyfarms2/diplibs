<div id="message-box">
	<div id="result-msg-box" class="hidden" ></div>
</div>


<section id="projects">
	<div class="container pan">
		
		<?php //if(is_var_array($news_result)) { ?>
			<div class="row mbl">
				<div class="col-md-8"><h3 id="page_category_name" class="textSub mts mbn"></h3></div>
				<div class="col-md-4">
					<?php if(is_var_array($event_cat_result)) { ?>
						<select id="ddl_event_category" class="form-control">
							<option value="all">All categories</option>
							<?php foreach ($event_cat_result as $k => $item) {
								echo '<option value="'.$item['aid'].'">'.$item['name'].'</option>';
							}
							?>
						</select>
					<?php } ?>
				</div>
			</div>
		<?php //} ?>


		<div id="main_content">
		</div>


	</div>
</section>

<script type="text/javascript">
	$(document).ready(function($){

		function initAll() {
			// $('[data-toggle="tooltip"]').tooltip('destroy');

			// Initialize event actions
			$('.action-event').click(function() {
				<?php if(is_login()) { ?>
				var panel_event_actions = $(this).closest('.event-actions');
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
	               	$(panel_event_actions).html('<span class="has-action">'+data.msg+'</span>');
	               }
	            });
	         <?php } else { ?>
	         	alert('Please log in before accept this invitation.');
	         <?php } ?>
			});

		}

		/*
     	function getDocHeight() {
		    var D = document;
		    return Math.max(
		        D.body.scrollHeight, D.documentElement.scrollHeight,
		        D.body.offsetHeight, D.documentElement.offsetHeight,
		        D.body.clientHeight, D.documentElement.clientHeight
		    );
		}
		*/
		function loadNextPage() {
			var sid = Math.floor(Math.random()*10000000000);
        	$.getJSON(
        		'<?=site_url("event/ajax-load-event-feed/")?>'+sid, 
				{ 
					page: localStorage.getItem('next_page'), 
					total_items: '<?=$total_items?>',
					category_aid: $('#ddl_event_category').val()
				},
				function(data) {
			   	$('#main_content').append(data.html);
			   	setTimeout( initAll(), 500 );
			   	if (parseInt(data.next_page) > 0) {
			   		localStorage.setItem('next_page', data.next_page);
			   		setTimeout( function() { $(window).on('scroll', loadNextPage()); }, 300 );
			   	}
			   	else {
			   		$(window).off('scroll');
			   	}
				}
        	);
		}

		function initWindowScroll() {
			// Scroll to bottom of the page andn then reload the next page
			$(window).scroll(function(e) {
				
		    	if ( document.documentElement.clientHeight + $(document).scrollTop() >= document.body.offsetHeight - 900 ) { 
		      	$(window).off('scroll');
		      	if (localStorage.getItem('next_page') != "") {
		      		loadNextPage();
		      	}
			    }
			});
		}


		// First load init, load the 1st page
		var sid = Math.floor(Math.random()*10000000000);
     	$.getJSON(
     		'<?=site_url("event/ajax-load-event-feed/")?>'+sid, 
			{ 
				page: 1, 
				total_items: '<?=$total_items?>',
				category_aid: $('#ddl_event_category').val()
			},
			function(data) {
		   	$('#main_content').append(data.html);
		   	localStorage.setItem('next_page', data.next_page);
		   	initAll();
			}
     	);
     	$('#page_category_name').html($('#ddl_event_category').find('option:selected').text());
     	initWindowScroll();
     	

		$('#ddl_event_category').change(function() {
			var sid = Math.floor(Math.random()*10000000000);
			var url = '<?=site_url("event/ajax-load-event-feed/")?>'+sid;
			$.ajax({
            url: url,
            type: "post",
            dataType: "json",
            data: { 
						page: 1, 
						total_items: '<?=$total_items?>',
						category_aid: $(this).val()
					},
            beforeSend:function(data) {
  					$('#main_content').html('<div>Loading...</div>');
  				}
        	})
        	.success(function( data ) {
        		if ( data.status == 'success' ) {
        			$('#main_content').html(data.html);
	            localStorage.setItem('next_page', data.next_page);
	            $('#page_category_name').html($('#ddl_event_category').find('option:selected').text());
			   	initAll();
			   	// initWindowScroll();
        		}

         });

     	});
		
		

		<?=@$message?>
		<?=@$js_code?>
	});
</script>