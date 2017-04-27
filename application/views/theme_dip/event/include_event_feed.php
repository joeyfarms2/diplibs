<div class="scroll-fragment">
<?php if(is_var_array($event_result)) { ?>
	<?php foreach($event_result as $item){ ?>

			<div class="row pan box-event" data-event-aid='<?=get_array_value($item,"aid","")?>'>
				<div class="col-md-12 event-content" >
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
				        	<div  class="event-header col-sm-9">
					        	<a href="<?=site_url('event/detail/'.get_array_value($item, 'aid'))?>"><h4 class="mbn"><?=get_array_value($item,"title","")?></h4></a>
					        	<div class="line-2"><?=get_array_value($item, 'event_period_date_txt', '')?></div>
				        	</div>
				        	<div class="event-actions col-sm-3">

				        	<?php if ( $item['is_public'] == '1' ) { ?>
				        		<span>Public Event</span>
				        	<?php } else if ( !$item['has_passed'] && $item['is_invited'] == true ) { ?>
					        	<?php if ($item['has_action'] == true) { ?>
					        		<span class="has-action"><?=get_array_value($item, 'has_joined_txt', '')?></span>
					        	<?php } else { ?>
					        		<a href="javascript:void(0);" class="action-event" data-val='1'>Join</a>
					        		<a href="javascript:void(0);" class="action-event" data-val='0'>No</a>
					        	<?php } ?>
				        	<?php } else if ( !$item['has_passed'] && $item['is_invited'] == false ) { ?>
				        		<span>No invitation</span>
				        	<?php } ?>
				        	</div>
				        	<div class="clearfix"></div>
				        	<div class="line-3"><?=get_array_value($item, 'location', '')?></div>
				        </div>
				      </div>
			    	</div>
			    </div>
		    </div>
		    
	    <?php } ?>
    <?php } else { echo '<em>No incoming events</em>'; } ?>
</div>