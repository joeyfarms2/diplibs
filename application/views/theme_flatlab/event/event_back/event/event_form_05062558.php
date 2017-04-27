<?php 
$command = @$command;
$item_detail = @$item_detail;
$master_event_main = @$master_event_main;
$lasted_event_main = "";
if(is_var_array($master_event_main)){
	$lasted_event_main = get_array_value(reset($master_event_main),"aid","");
}
if($command == '_insert') {
	$event_main_aid = '1';
}
else {
	$event_main_aid = get_array_value($item_detail, 'event_main_aid', '1');
}
?>
<script type="text/javascript" src="<?=SCRIPT_PATH?>additional/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="<?=JS_PATH?><?=folderName?>/event.js"></script>
<form id="frm_event" name="frm_event" method="POST" action="<?=site_url('admin/event/save')?>" class="cmxform form-horizontal tasi-form" enctype="multipart/form-data">
	<input type="hidden" id="aid" name="aid" value="<?=get_array_value($item_detail,"aid","")?>" />
	<input type="hidden" id="command" name="command" value="<?=$command?>" />
	<input type="hidden" id="save_option" name="save_option" value="" />

	<div id="result-msg-box"></div>
	
	<div class="row">
		<div class="col-md-12">
			<section class="panel">
				<header class="panel-heading">
					<?=@$header_title?>
				</header>

				<div class="panel-body">

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="title">Event title</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="title" name="title" value="<?=get_array_value($item_detail,"title","")?>" maxlength="255" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label">Event date</label>
						<div class="col-md-12 col-lg-8 pln">

							<div class="col-xs-11 col-md-3">
								<div class="input-group date form_datetime-adv" data-date="">
									<input class="form-control" type="text" id="event_start_date" name="event_start_date" value="<?=mdate('%Y-%m-%d', strtotime(get_array_value($item_detail,"event_start_date","")))?>" />

									<div class="input-group-btn">
										<button class="btn btn-danger" type="button" onclick="clearValue('event_start_date');">
										<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-xs-4 col-md-2 prn pln panel-event-time">
								<select class="form-control" id='event_start_time' name='event_start_time'>
									<?php 
									for($h=0; $h<24; $h++) {
										for($i=0; $i<59; $i++) {
											echo '<option';
											if ( $h == mdate('%H', strtotime(get_array_value($item_detail, 'event_start_date'))) && $i == mdate('%i', strtotime(get_array_value($item_detail, 'event_start_date'))) ) {
												echo ' selected';
											}
											echo '>';
											echo str_pad($h, 2, '0', STR_PAD_LEFT).':'.str_pad($i, 2, '0', STR_PAD_LEFT);
											echo '</option>';
											$i = $i+29;
										}
									}
									?>
								</select>
							</div>

							<div class="col-sm-1 ptm text-center">to</div>

							<div class="col-xs-11 col-md-3">
								<div class="input-group date form_datetime-adv" data-date="">
									<input class="form-control" type="text" id="event_end_date" name="event_end_date" value="<?=mdate('%Y-%m-%d', strtotime(get_array_value($item_detail,"event_end_date","")))?>" />

									<div class="input-group-btn">
										<button class="btn btn-danger" type="button" onclick="clearValue('event_end_date');">
										<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="col-xs-4 col-md-2 prn pln panel-event-time">
								<select class="form-control" id='event_end_time' name='event_end_time'>
									<?php 
									for($h=0; $h<24; $h++) {
										for($i=0; $i<59; $i++) {
											echo '<option';
											if ( $h == mdate('%H', strtotime(get_array_value($item_detail, 'event_end_date'))) && $i == mdate('%i', strtotime(get_array_value($item_detail, 'event_end_date'))) ) {
												echo ' selected';
											}
											echo '>';
											echo str_pad($h, 2, '0', STR_PAD_LEFT).':'.str_pad($i, 2, '0', STR_PAD_LEFT);
											echo '</option>';
											$i = $i+29;
										}
									}
									?>
								</select>
							</div>

						</div>

						<div class="col-md-12 col-lg-8 col-lg-offset-2 mtm">
							<label class="checkbox-inline">
								<input type="checkbox" value="1" name="is_all_day" id="is_all_day" <?=($item_detail['is_all_day']=='1' ? 'checked="checked"' : '')?>>All day
							</label>
						</div>

					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="location">Event location</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="location" name="location" value="<?=get_array_value($item_detail,"location","")?>" maxlength="100" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="status">Status</label>
						<div class="col-md-12 col-lg-8">
							<?php $status =  get_array_value($item_detail,"status",""); ?>
							<label class="radio-inline">
								<input type="radio" name="status" id="status_1" value="1" checked />Active
							</label>
							<label class="radio-inline">
								<input type="radio" name="status" id="status_0" value="0" <?php if($status == "0") echo 'checked="checked"';?> />Inactive
							</label>
						</div>
					</div>

					<?php
						$class = "";
						if(CONST_EVENT_MODE != "1"){
							$class = "hide";
						}
					?>

					<?php if (is_general_admin_or_higher()) { ?>
					<div class="form-group <?=$class?>">
						<label class="col-md-12 col-lg-2 control-label required" for="event_main_aid">Main</label>
						<div class="col-md-12 col-lg-8">
						<?php $event_main_aid =  get_array_value($item_detail,"event_main_aid",""); ?>
						<?php if(is_var_array($master_event_main)){ ?>
							<?php foreach($master_event_main as $m_item){ ?>
							<label class="radio-inline">
								<input type="radio" name="event_main_aid" id="event_main_aid_<?=get_array_value($m_item,"aid","")?>" value="<?=get_array_value($m_item,"aid","")?>" <?php if($event_main_aid == get_array_value($m_item,"aid","")) echo 'checked="checked"';?> /><?=get_array_value($m_item,"name","")?>
							</label>
							<?php } ?>
						<?php } ?>
						</div>
					</div>
					<?php } else { ?>
					<input type='hidden' id='event_main_aid' name='event_main_aid' value='<?=$event_main_aid?>'/>
					<?php } ?>

					<div class="form-group <?=$class?>">
						<label class="col-md-12 col-lg-2 control-label required" for="category">Category</label>
						<div class="col-md-12 col-lg-8">
							<input type="hidden" name="category" id="category" value="<?=get_array_value($item_detail,"category","")?>" />
							<div id="category_area"></div>
						</div>
					</div>

					<div class="form-group <?=$class?>">
						<label class="col-md-12 col-lg-2 control-label" for="option">Option</label>
						<div class="col-md-12 col-lg-8">
							<label class="checkbox-inline">
								<input type="checkbox" id="is_highlight" name="is_highlight" value="1" <?php if(get_array_value($item_detail,"is_highlight","") == "1") echo 'checked="checked"';?> />Highlight
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="is_recommended" name="is_recommended" value="1" <?php if(get_array_value($item_detail,"is_recommended","") == "1") echo 'checked="checked"';?> />Recommended
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="is_home" name="is_home" value="1" <?php if( get_array_value($item_detail,"is_home","") == "1" || ($command=='_insert' && CONST_EVENT_DEFAULT_CHECKED_SHOW_IN_HOME=='1') ) echo 'checked="checked"';?> />Show in homepage
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="weight">Weight</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="weight" name="weight" value="<?=get_array_value($item_detail,"weight","")?>" onkeypress="isWeight(event, this.value)" maxlength="6" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="description_1">Description</label>
						<div class="col-md-12 col-lg-8">
							<textarea class="form-control" id="description_1" name="description_1"><?=get_array_value($item_detail,"description","")?></textarea>
							<textarea class="hidden" id="description" name="description"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="cover_image">Cover image</label>
						<div class="col-md-12 col-lg-8">
							<input class="default" type="file" id="cover_image" name="cover_image"/>
							<p class="help-block">Only file extension <?=get_file_type(CONST_ALLOW_FILE_TYPE_FOR_EVENT_IMAGE)?> and size not over <?=get_size(CONST_ALLOW_FILE_SIZE_FOR_EVENT_IMAGE)?>.</p>
						</div>
						<?php $img_src = get_image(get_array_value($item_detail,"cover_image_small_path",""),"small","off"); ?>
						<?php if(!is_blank($img_src)){ ?>
						<div class="col-md-12 col-lg-offset-2 col-lg-8 spaceUp">
							<img src="<?=$img_src?>" />
						</div>
						<?php } ?>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="ref_link">Reference URL</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="ref_link" name="ref_link" value="<?=get_array_value($item_detail,"ref_link","")?>" maxlength="100" placeholder='http://'/>
						</div>
					</div>
				</div>
			</section>

			<section class="panel">
				<header class="panel-heading text-danger">Permissions &amp; Invitations:</header>

				<div class="panel-body">
					<div class="form-group">
						<div class="col-lg-12">
							<label class="checkbox-inline">
								<input type="checkbox" value="1" name="is_public" id="is_public" <?=($item_detail['is_public']=='1' ? 'checked="checked"' : '')?>> Public Event &nbsp;<em>(No invitation submitted)</em>
							</label>
						</div>
					</div>

					<div id="panel_invitation" class="form-group <?=($item_detail['is_public']=='1' ? 'hidden' : '')?>">
						<label class="col-md-12 col-lg-2 control-label" for="ref_link">Invitations</label>
						<div class="col-md-12 col-lg-8">
							<?php foreach ($rs_dept as $item_dept) { ?>
								<div class="invi-dept">
									<label class="checkbox strong">
										<input type="checkbox" data-dept-id="<?=$item_dept['aid']?>" class="chk-all chk-dept chk-dept-<?=$item_dept['aid']?>" /> <?=$item_dept['name']?>
									</label>
									<div class="invi-staff mll mbl clearfix">
										<?php 
										if (count($item_dept['staff']) > 0) {
											foreach ($item_dept['staff'] as $item_staff) { 
										?>
											<div class="col-md-4 col-sm-6">
												<label class="checkbox">
													<input type="checkbox" name="list_invi_user[]" data-dept-id="<?=$item_dept['aid']?>" class="chk-staff chk-staff-in-dept-<?=$item_dept['aid']?>" value="<?=$item_staff['aid']?>" <?=($command=='_update' && in_array($item_staff['aid'], $cur_invi_staff) ? 'checked' : '')?> /> <?=$item_staff['full_name']?>
												</label>
											</div>
										<?php 
											}
										} 
										?>
									</div>
								</div>
							<?php } ?>
						</div>
					</div>

				</div>
			</section>

			<section class="panel">
				<!-- Button -->
				<div class="panel-body">
					<a class="btn btn-primary" onclick="processSubmit('0');" />Save & Close</a>
					<a class="btn btn-default" onclick="processRedirect('admin/event/show');" />Cancel</a>
				</div>
				<!-- End : Button -->
			</section>
		</div>
	</div>
</form>
<script type="text/javascript">
	jQuery(document).ready(function($){
		var radios = jQuery('input:radio[name=event_main_aid]');
		if(radios.is(':checked') === false) {
			radios.filter('[value=<?=$lasted_event_main?>]').attr('checked', true);
		}
		
		$("#event_start_date").datepicker({
			changeMonth: true,
			changeYear: true,
			format: "yyyy-mm-dd",
			dateISO:"true",
			todayBtn: true,
			todayHighlight: true,
			autoclose: true
		});

		$("#event_end_date").datepicker({
			changeMonth: true,
			changeYear: true,
			format: "yyyy-mm-dd",
			dateISO:"true",
			todayBtn: true,
			todayHighlight: true,
			autoclose: true
		});

		$("#frm_event").validate({
			rules: {
				title: {
					required: true
				},
				event_main_aid: {
					required: true
				}
			},
			messages: {
				title: {
					required: "Enter event title."
				}
			}
		});

		$('#is_all_day').change(function() {
			if ($(this).is(':checked')) {
				$('.panel-event-time').addClass('hidden');
			}
			else {
				$('.panel-event-time').removeClass('hidden');
			}
		});
		$('#is_all_day').trigger('change');

		$('#is_public').change(function() {
			if ($(this).is(':checked')) {
				$('#panel_invitation').addClass('hidden');
			}
			else {
				$('#panel_invitation').removeClass('hidden');
			}
		});

		$('.chk-dept.chk-all').change(function() {
			var dept_id = $(this).attr('data-dept-id');
			$('.chk-staff-in-dept-'+dept_id).prop('checked', $(this).is(':checked'));
		});
	
		$('.chk-staff').change(function() {
			var dept_id = $(this).attr('data-dept-id');
			if ( $('.chk-staff-in-dept-'+dept_id+':checked').length == $('.chk-staff-in-dept-'+dept_id).length ) {
				$('.chk-dept-'+dept_id).prop('checked', true);
			}
			else {
				$('.chk-dept-'+dept_id).prop('checked', false);
			}
		});

		// Init
		$('.chk-dept.chk-all').each(function() {
			var dept_id = $(this).attr('data-dept-id');
			if ( $('.chk-staff-in-dept-'+dept_id+':checked').length == $('.chk-staff-in-dept-'+dept_id).length ) {
				$('.chk-dept-'+dept_id).prop('checked', true);
			}
			else {
				$('.chk-dept-'+dept_id).prop('checked', false);
			}
		});
	
		tinymce.init({
		    selector: "#description_1",
		    height: 400,
		    theme: "modern",
		    plugins: [
				"advlist autolink lists link image charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars code fullscreen",
				"insertdatetime media nonbreaking save table contextmenu directionality",
				"emoticons template paste textcolor colorpicker textpattern moxiemanager"
			],
		    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		    toolbar2: "print preview media | forecolor backcolor emoticons",
		    image_advtab: true,
		});

		// bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });

		getCategoryByEventMainAid();

		<?=@$message?>
		<?=@$js_code?>
	});
</script>