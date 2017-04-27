<?php 
$command = @$command;
$item_detail = @$item_detail;
$str_cat = get_array_value($item_detail, 'category', '');
$arr_cat = array();
if (!empty($str_cat)) {
	$tmp = explode(',', $str_cat);
	if (is_var_array($tmp) && count($tmp) > 0) {
		foreach ($tmp as $cat_aid) {
			if ($cat_aid > 0) {
				$arr_cat[] = $cat_aid;
			}
		}
	}
}
?>
<script type="text/javascript" src="<?=SCRIPT_PATH?>additional/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="<?=JS_PATH?><?=folderName?>/questionaire.js"></script>
<form id="frm_questionaire" name="frm_questionaire" method="POST" action="<?=site_url('admin/questionaire/save')?>" class="cmxform form-horizontal tasi-form" enctype="multipart/form-data">
	<input type="hidden" id="aid" name="aid" value="<?=get_array_value($item_detail,"aid","")?>" />
	<input type="hidden" id="command" name="command" value="<?=$command?>" />
	<input type="hidden" id="save_option" name="save_option" value="" />
	<input type="hidden" id="status" name="status" value="<?=get_array_value($item_detail, 'status', '')?>" />

	<div id="result-msg-box"></div>
	
	<div class="row">
		<div class="col-md-12">
			<section class="panel">
				<header class="panel-heading">
					<?=@$header_title?>
				</header>

				<header class="panel-heading text-danger">Questionnaire Settings:</header>

				<div class="panel-body">

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="title">Questionnire title</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="title" name="title" value="<?=get_array_value($item_detail,"title","")?>" maxlength="255" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="description">Questionnaire description</label>
						<div class="col-md-12 col-lg-8">
							<textarea class="form-control" id="description_1" name="description_1"><?=get_array_value($item_detail,"description","")?></textarea>
							<textarea class="hidden" id="description" name="description"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label">Expiration date</label>
						<div class="col-xs-11 col-md-3">
							<div class="input-group date form_datetime-adv" data-date="">
								<input class="form-control" type="text" id="expiry_date" name="expiry_date" value="<?=get_array_value($item_detail,"expiry_date","")?>" />

								<div class="input-group-btn">
									<button class="btn btn-danger" type="button" onclick="clearValue('expiry_date');">
									<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<small class="text-muted"><em>* The questionnaire will be valid until 11:59 PM of this date.</em></small>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="category">Category</label>
						<div class="col-md-12 col-lg-8">
							<input type="hidden" name="category" id="category" value="<?=get_array_value($item_detail,"category","")?>" />
							<fieldset class="pbm">
							<?php foreach ($master_questionaire_category as $k => $item_cat) { ?>
								<label class="checkbox-inline">
									<input type="checkbox" value="<?=$item_cat['aid']?>" name="category[]" id="category_<?=$item_cat['aid']?>" <?=(in_array($item_cat['aid'], $arr_cat) ? 'checked' : '')?>> <?=$item_cat['name']?>
								</label>
							<?php } ?>
							</fieldset>
						</div>
					</div>

					<?php if ($command == '_update') { ?>
					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label required" for="status">Published status</label>
						<div class="col-md-12 col-lg-8">
							<?php $status =  get_array_value($item_detail,"status",""); ?>
							<label class="radio-inline">
								<input type="radio" name="status_1" id="status_1" value="1" <?php if($status == "1") echo 'checked="checked"';?> disabled />Published
							</label>
							<label class="radio-inline">
								<input type="radio" name="status_0" id="status_0" value="0" <?php if($status == "0") echo 'checked="checked"';?> disabled />Draft
							</label>
						</div>
					</div>
					<?php } ?>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="weight">Weight</label>
						<div class="col-md-12 col-lg-8">
							<input class="form-control" type="text" id="weight" name="weight" value="<?=get_array_value($item_detail,"weight","")?>" onkeypress="isWeight(questionaire, this.value)" maxlength="6" />
						</div>
					</div>

				</div>
			</section>

			<section class="panel">
				<header class="panel-heading text-danger">Questions:</header>

				<div class="panel-body">

					<div class="panel-multiple-rows">

						<div class="row item-row hover hidden" data-row="0">
							<div class="col-md-12 pan">
								<input type="hidden" class="q_aid" name="q_aid[]" data-field="q_aid">
								<div class="form-group">
									<label class="col-md-12 col-sm-12 col-xs-12 col-lg-2 pan control-label">#</label>
									<div class="col-md-1 col-sm-3 col-xs-6 pan">
										<select class="form-control q_weight" name="q_weight[]" data-field="q_weight">
										<?php for ($i=1; $i<=50; $i++) { ?>
											<option value='<?=$i?>'><?=$i?></option>
										<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12 col-lg-2 pan control-label">Question title</label>
									<div class="col-md-12 col-lg-8 pan">
										<input type="text" name="q_title[]" placeholder="Untitled Question" class="form-control q_title required" data-field="q_title" value="">
									</div>
								</div>
								<!-- <div class="form-group">
									<label class="col-md-12 col-lg-2 control-label">Help text</label>
									<div class="col-md-12 col-lg-8 pan">
										<input type="text" name="q_help[]" placeholder="" class="form-control" data-field="q_help" value="">
									</div>
								</div> -->
								<div class="form-group">
									<label class="col-md-12 col-lg-2 pan control-label">Question type</label>
									<div class="col-md-3 pan">
										<select class="form-control q_type" name="q_type[]" data-field="q_type">
											<option value='txt'>Text</option>
											<option value='txa'>Paragraph text</option>
											<option value='rdo'>Multiple choice</option>
											<option value='chk'>Checkboxes</option>
											<option value='sca'>Scale (1-5)</option>
										</select>
									</div>
								</div>

								<!-- Radio button choices -->
								<div class="panel-rdo-choices panel-choices hidden">
									<div class="panel-multiple-rows-choices">
										<div class="item-row-choice hidden" data-row="0">
											<div class="form-group">
												<div class="col-md-12 col-lg-offset-2 pan clearfix">
													<div class="clearfix">
														<i class="fa fa-circle-o fa-lg prm ptm pull-left"></i> 
														<input type="text" class="form-control pull-left input-choice required" style="width:60%;"name="rdo_choice[]" data-field="rdo_choice">
														<a href="javascript:void(0);" class="btn_remove_row_choice"><i class="fa fa-times plm ptm pull-left text-muted"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row ptl pbm">
										<div class="col-md-12 col-lg-offset-2">
											<a href="javascript:void(0);" class="btn_add_more_row_choice"><i class="fa fa-plus prs"></i> Add more option</a>
										</div>
									</div>
								</div>

								<!-- Checkboxes choices -->
								<div class="panel-chk-choices panel-choices hidden">
									<div class="panel-multiple-rows-choices">
										<div class="item-row-choice hidden" data-row="0">
											<div class="form-group">
												<div class="col-md-12 col-lg-offset-2 pan clearfix">
													<i class="fa fa-square-o fa-lg prm ptm pull-left"></i> 
													<input type="text" class="form-control pull-left input-choice required" style="width:60%;"name="chk_choice[]" data-field="chk_choice">
													<a href="javascript:void(0);" class="btn_remove_row_choice"><i class="fa fa-times plm ptm pull-left text-muted"></i></a>
												</div>
											</div>
										</div>
									</div>
									<div class="row ptl pbm">
										<div class="col-md-12 col-lg-offset-2">
											<a href="javascript:void(0);" class="btn_add_more_row_choice"><i class="fa fa-plus prs"></i> Add more option</a>
										</div>
									</div>
								</div>

								<div class="row text-right pll prl">
									<a href="javascript:void(0);" class="btn_remove_row text-danger"><i class="fa fa-times"></i> Delete</a> &nbsp;|&nbsp; 
									<a href="javascript:void(0);" class="btn_duplicate_row text-primary"><i class="fa fa-copy"></i> Duplicate</a>
								</div>

							</div>
						</div>

					</div>

					<div class="row ptl pbm">
						<div class="col-md-12">
							<a href="javascript:void(0);" class="btn_add_more_row"><i class="fa fa-plus prs"></i> Add more question</a>
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
								<input type="checkbox" value="1" class="chk-main-all"> Public Questionnaire &nbsp;<em>(Invitation email will be submitted to everyone)</em>
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="ref_link">Invitation</label>
						<div class="col-md-12 col-lg-8">
							<!-- <label class="checkbox text-danger">
								<input type="checkbox" class="chk-main-all" /> 
								<span>SELECT ALL</span>
							</label> -->

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

<!-- 
				<div class="form-group">
						<label class="col-md-12 col-lg-2 control-label" for="option">Email notification</label>
						<div class="col-md-12 col-lg-8">
							<label class="checkbox-inline">
								<input type="checkbox" id="email_notify" name="email_notify" value="1" /> Notify everyone via email
							</label>
						</div>
					</div>
 -->

				</div>
			</section>

			<section class="panel">
				<!-- Button -->
				<div class="panel-body">
					<a id="btn_preview" class="btn btn-info" onclick="processSubmit('2');" /><i class="fa fa-search prs"></i> Preview</a>
					<a id="btn_save" class="btn btn-primary" onclick="processSubmit('0');" /><i class="fa fa-globe prs"></i> Save & Publish</a>
					<!-- <a id="btn_save_draft" class="btn btn-default" onclick="processSubmit('1');" /><i class="fa fa-download prs"></i> Save as draft</a> -->
					<a class="btn btn-default" onclick="processRedirect('admin/questionaire/show');" />Cancel</a>
				</div>
				<!-- End : Button -->
			</section>
		</div>
	</div>
</form>
<script type="text/javascript">
	$(document).ready(function($){

		$("#expiry_date").datepicker({
			changeMonth: true,
			changeYear: true,
			format: "yyyy-mm-dd",
			dateISO:"true",
			todayBtn: true,
			todayHighlight: true,
			autoclose: true
		});

		// Add question
		$('.btn_add_more_row').click(function() {
			var panel_multiple_rows = $(this).closest('.row').siblings('.panel-multiple-rows');
			var data_row = $(panel_multiple_rows).find('.item-row:last').attr('data-row');
			var q_weight = $(panel_multiple_rows).find('.item-row:last').find('select.q_weight').val();

			$(panel_multiple_rows).append( $(panel_multiple_rows).find('.item-row:first').clone() );
			$(panel_multiple_rows).find('.item-row:last').removeClass('hidden');

			if ( $(panel_multiple_rows).find('.item-row:last').attr('data-row') ) {
				data_row = parseInt(data_row) + 1;
				$(panel_multiple_rows).find('.item-row:last').attr('data-row', data_row);
				$(panel_multiple_rows).find('.item-row:last').find('input,select,textarea').each(function(id,el) {
					$(el).attr('name', $(el).attr('data-field')+'['+data_row+']');
				})
			}
			var next_weight = parseInt(q_weight)+1;
			$(panel_multiple_rows).find('select.q_weight:last').val(next_weight);
			$(panel_multiple_rows).find('.item-row:last').find('.item-row-choice:visible').remove();
			$(panel_multiple_rows).find('.item-row:last').find('input').val("");
			// $(panel_multiple_rows).find('.item-row:last').find('input').first().focus();
			$(panel_multiple_rows).find('.item-row:last').find('input.q_title').focus();
			$(panel_multiple_rows).find('.item-row').find('.btn_remove_row').removeClass('hidden').show();
		});
		// Delete question
		$('.panel-multiple-rows').delegate('.btn_remove_row', 'click', function() {
			$(this).closest('.item-row').remove();
		});
		// Duplicate question
		$('.panel-multiple-rows').delegate('.btn_duplicate_row', 'click', function() {
			var panel_multiple_rows = $(this).closest('.panel-multiple-rows');
			var master_row = $(this).closest('.item-row');
			var data_row = $(panel_multiple_rows).find('.item-row:last').attr('data-row');
			var q_weight = $(panel_multiple_rows).find('.item-row:last').find('select.q_weight').val();

			$(panel_multiple_rows).append( $(master_row).clone() );
			$(panel_multiple_rows).find('.item-row:last').removeClass('hidden');
			if ( $(panel_multiple_rows).find('.item-row:last').attr('data-row') ) {
				data_row = parseInt(data_row) + 1;
				$(panel_multiple_rows).find('.item-row:last').attr('data-row', data_row);
				$(panel_multiple_rows).find('.item-row:last').find('input,select,textarea').each(function(id,el) {
					$(el).attr('name', $(el).attr('data-field')+'['+data_row+']');
				})
			}
			var next_weight = parseInt(q_weight)+1;
			$(panel_multiple_rows).find('select.q_weight:last').val(next_weight);
			$(panel_multiple_rows).find('select.q_type:last').val( $(master_row).find('select.q_type option:selected').val() );
			$(panel_multiple_rows).find('.item-row:last').find('input').first().focus();
			$(panel_multiple_rows).find('.item-row').find('.btn_remove_row').removeClass('hidden').show();
		});
		// Add choice in each question (Only for radio and checkbox)
		$('.panel-multiple-rows').delegate('.btn_add_more_row_choice', 'click', function() {
			var item_row_question = $(this).closest('.item-row');
			var panel_multiple_rows = $(this).closest('.row').siblings('.panel-multiple-rows-choices');
			var data_row = $(panel_multiple_rows).find('.item-row-choice:last').attr('data-row');
			var question_data_row = $(item_row_question).attr('data-row');

			$(panel_multiple_rows).append( $(panel_multiple_rows).find('.item-row-choice:first').clone() );
			$(panel_multiple_rows).find('.item-row-choice:last').removeClass('hidden');

			if ( $(panel_multiple_rows).find('.item-row-choice:last').attr('data-row') ) {
				question_data_row = parseInt(question_data_row);
				data_row = parseInt(data_row) + 1;
				$(panel_multiple_rows).find('.item-row-choice:last').attr('data-row', data_row);
				$(panel_multiple_rows).find('.item-row-choice:last').find('input,select,textarea').each(function(id,el) {
					$(el).attr('name', $(el).attr('data-field')+'['+question_data_row+']['+data_row+']');
				})
			}
			$(panel_multiple_rows).find('.item-row-choice:last').find('input').val("");
			$(panel_multiple_rows).find('.item-row-choice:last').find('input').first().focus();
			$(panel_multiple_rows).find('.item-row-choice').find('.btn_remove_row_choice').removeClass('hidden').show();
		});
		// Delete choice in each question (Only for radio and checkbox)
		$('.panel-multiple-rows').delegate('.btn_remove_row_choice', 'click', function() {
			$(this).closest('.item-row-choice').remove();
		});
		// Change question type in each question
		$('.panel-multiple-rows').delegate('select.q_type', 'change', function() {
			var item_row = $(this).closest('.item-row');
			$(item_row).find('.panel-choices').addClass('hidden');
			if ($(this).val()=='rdo') {
				$(item_row).find('.panel-rdo-choices').removeClass('hidden');
			}
			else if ($(this).val()=='chk') {
				$(item_row).find('.panel-chk-choices').removeClass('hidden');
			}
			if ($(item_row).find('.panel-choices:visible').length > 0) {
				if ($(item_row).find('.panel-choices:visible').find('.item-row-choice:visible').length <= 0) {
					$(item_row).find('.panel-choices:visible').find('.btn_add_more_row_choice').trigger('click');
				}
			}
		});
		$('.panel-multiple-rows').delegate('.input-choice', 'focusin focusout', function(event) {
			if(event.type === 'focusin'){
				if ($(this).siblings('.fa').hasClass('fa-circle-o')) {
					$(this).siblings('.fa').removeClass('fa-circle-o').addClass('fa-dot-circle-o');
				}
				else if ($(this).siblings('.fa').hasClass('fa-square-o')) {
					$(this).siblings('.fa').removeClass('fa-square-o').addClass('fa-check-square-o');
				}
			}
			else {
				if ($(this).siblings('.fa').hasClass('fa-dot-circle-o')) {
					$(this).siblings('.fa').removeClass('fa-dot-circle-o').addClass('fa-circle-o');
				}
				else if ($(this).siblings('.fa').hasClass('fa-check-square-o')) {
					$(this).siblings('.fa').removeClass('fa-check-square-o').addClass('fa-square-o');
				}
			}
		});



		$("#frm_questionaire").validate({
			ignore: ":hidden",
			rules: {
				title: {
					required: true
				},
				'category[]': {
					required: true
				},
				'q_title[]': {
					required: true
				},
			},
			messages: {
				title: {
					required: "Please enter questionnaire title."
				},
				'category[]': {
					required: "Please choose at least one category."
				}
			},
			errorClass: 'error',
			errorPlacement: function(error, element) {
	        if (element.is(':checkbox'))
	            error.insertAfter($(element).closest('fieldset'));
	        else if (element.hasClass('input-choice')) {
	        		error.addClass('pls pts pull-left');
	        		error.appendTo($(element).closest('div'));
	        }
	        else
	            error.insertAfter(element);
		    }
		});

		$('.chk-dept.chk-all').change(function() {
			var dept_id = $(this).attr('data-dept-id');
			$('.chk-staff-in-dept-'+dept_id).prop('checked', $(this).is(':checked'));
			
			if ($('.chk-dept.chk-all:checked').length == $('.chk-dept.chk-all').length) {
				if ($('.chk-dept.chk-all:checked').length > 0) {
					$('.chk-main-all').prop('checked', true);
					$('.chk-main-all').siblings('span').text('DESELECT ALL');
				}
				else {
					$('.chk-main-all').prop('checked', false);
					$('.chk-main-all').siblings('span').text('SELECT ALL');
				}
			}
			else {
				$('.chk-main-all').prop('checked', false);
				$('.chk-main-all').siblings('span').text('SELECT ALL');
			}

		});
	
		$('.chk-main-all').change(function() {
			$('.chk-staff').prop('checked', $(this).is(':checked'));
			$('.chk-all.chk-dept').prop('checked', $(this).is(':checked'));
			if ($(this).is(':checked')) {
				$(this).siblings('span').text('DESELECT ALL');
			}
			else {
				$(this).siblings('span').text('SELECT ALL');
			}
		});
	
		$('.chk-staff').change(function() {
			var dept_id = $(this).attr('data-dept-id');
			if ( $('.chk-staff-in-dept-'+dept_id+':checked').length == $('.chk-staff-in-dept-'+dept_id).length ) {
				$('.chk-dept-'+dept_id).prop('checked', true);
			}
			else {
				$('.chk-dept-'+dept_id).prop('checked', false);
			}
			if ($('.chk-dept.chk-all:checked').length == $('.chk-dept.chk-all').length) {
				if ($('.chk-dept.chk-all:checked').length > 0) {
					$('.chk-main-all').prop('checked', true);
					$('.chk-main-all').siblings('span').text('DESELECT ALL');
				}
				else {
					$('.chk-main-all').prop('checked', false);
					$('.chk-main-all').siblings('span').text('SELECT ALL');
				}
			}
			else {
				$('.chk-main-all').prop('checked', false);
				$('.chk-main-all').siblings('span').text('SELECT ALL');
			}
		});



		// Init invitations
		$('.chk-dept.chk-all').each(function() {
			var dept_id = $(this).attr('data-dept-id');
			if ( $('.chk-staff-in-dept-'+dept_id+':checked').length == $('.chk-staff-in-dept-'+dept_id).length ) {
				$('.chk-dept-'+dept_id).prop('checked', true);
			}
			else {
				$('.chk-dept-'+dept_id).prop('checked', false);
			}
		});

		
		<?php 
		// Init for insert
		if ($command == '_insert') { ?>
			$('.btn_add_more_row').trigger('click');
			$('select.q_weight:visible:first').val('1');
		<?php 
		} else {
			// Init for update form
			if (is_var_array($questions)) {
			foreach ($questions as $rs_q) { 
				$item_q = $rs_q['question'];
		?>
				$('.btn_add_more_row').trigger('click');
				$('.item-row:last').find('.q_aid').val("<?=$item_q['aid']?>");
				$('.item-row:last').find('.q_weight').val("<?=$item_q['weight']?>");
				$('.item-row:last').find('.q_title').val("<?=addslashes($item_q['title'])?>");
				$('.item-row:last').find('.q_type').val("<?=$item_q['question_type']?>");
				if ("<?=$item_q['question_type']?>" == "rdo") {
					panel_choices = $('.item-row:last').find('.panel-rdo-choices');
					$(panel_choices).removeClass('hidden');
				}
				else if ("<?=$item_q['question_type']?>" == "chk") {
					panel_choices = $('.item-row:last').find('.panel-chk-choices');
					$(panel_choices).removeClass('hidden');		
				}
		<?php
				if (is_var_array($rs_q['choices'])) {
					foreach ($rs_q['choices'] as $item_c) {
		?>
						$(panel_choices).find('.panel-multiple-rows-choices').siblings('.row').find('.btn_add_more_row_choice').trigger('click');
						$(panel_choices).find('.panel-multiple-rows-choices').find('.input-choice:last').val("<?=$item_c['title']?>");
		<?php 
					} // end foreach
				}
		?>
				
		<?php 
			} // end foreach
			} // end if
		} // end else 
		?>


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
		

		$('#title').focus();
		$('html,body').animate({ scrollTop: 0 }, 0);

		<?=@$message?>
		<?=@$js_code?>
	});
</script>