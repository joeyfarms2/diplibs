<style type="text/css">
.item-q {
	margin-bottom: 30px;
}
.item-q h4 {
	margin-bottom: 0;
}
h5 {
	font-size: 15px;
}
.qtype-scale {
	border-top:1px solid #eee; 
	border-bottom:1px solid #eee;
	padding: 15px;
	margin: 20px 0;
}
</style>

<div id="message-box">
	<div id="result-msg-box" class="hidden" ></div>
</div>


<section id="projects">
	<div class="container mt15 pan">

		<?php if(is_var_array($item_detail)) { ?>

			<!-- Start questionaire box -->
			<div class="box-questionaire">
				
				<!-- Start questionaire content -->
				<div class="questionaire-content pal clearfix">
					<h3 class="txt-blue mbn"><?=get_array_value($item_detail,"title","")?></h3>
					<?php if (!empty($item_detail['description'])) { ?>
						<p class="ptm"><?=get_array_value($item_detail, 'description')?></p>
					<?php } ?>

					<div class="clearfix"></div>

				</div>
				<!-- End questionaire content -->

				<!-- Start questions content -->
				<form id="frm_questionaire" method="post" action="<?=site_url('questionaire/submit')?>">
					<input type="hidden" name="questionaire_aid" value="<?=get_array_value($item_detail, 'aid', '')?>"/>
					<div class="questions-content pll prl clearfix">
					<?php 
					$q_no = 0;
					foreach ($questions as $key => $item) {
						$q_no++;
						$item_q = get_array_value($item, 'question', '');
						$item_c = get_array_value($item, 'choices', '');
						$q_type = get_array_value($item_q, 'question_type', 'txt');
					?>

						<div class="item-q">
							<div class="row">
								<div class="col-md-12">
									<h5><?=($q_no).'. '.get_array_value($item_q, 'title', '')?></h5>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<?php
										switch ($q_type) {
											default:
											case 'txt':
												echo '<input type="text" class="form-control required" name="ans_'.$item_q["aid"].'"/>';
												break;
											case 'txa':
												echo '<textarea class="form-control required" name="ans_'.$item_q["aid"].'"></textarea>';
												break;
											case 'sca':
												echo '<fieldset>';
												echo '<div class="qtype-scale col-md-6">';
												for ($i=1; $i<=5; $i++) {
													echo '<div class="inline-block prm">';
													echo '<div>'.$i.'</div>';
													echo '<label class="radio">
																<input type="radio" name="ans_'.$item_q["aid"].'" class="required" value="'.$i.'"/>'.'
															</label>';
													echo '</div>';
												}

												// echo '<div class="inline-block prm">';
												// echo '<div>N/A</div>';
												// echo '<label class="radio">
												// 			<input type="radio" name="ans_'.$item_q["aid"].'" class="required" value="N/A"/>'.'
												// 		</label>';
												// echo '</div>';

												echo '</div>';
												echo '</fieldset>';
												break;
											case 'rdo':
												echo '<fieldset>';
												if (is_array($item_c) && count($item_c) > 0) {
													foreach ($item_c as $k_c => $choice) {
														echo '<label class="radio">
																	<input type="radio" name="ans_'.$item_q["aid"].'" class="required" value="'.$choice["title"].'"/>'.$choice["title"].'
																</label>';
													}
												}
												echo '</fieldset>';
												break;
											case 'chk':
												echo '<fieldset>';
												if (is_array($item_c) && count($item_c) > 0) {
													foreach ($item_c as $k_c => $choice) {
														echo '<label class="checkbox">
																	<input type="checkbox" name="ans_'.$item_q["aid"].'[]" class="required" value="'.$choice["title"].'"/>'.$choice["title"].'
																</label>';
													}
												}
												echo '</fieldset>';
												break;

										} // end switch
												
									?>

								</div>
							</div>

							

						</div>

					<?php } // end foreach ?>

					<div class="row">
						<div class="col-md-12">
							<a id="btn_submit" href="javascript:void(0);" class="btn btn-success">Submit form</a>
							<a href="<?=site_url('questionaire')?>" class="btn btn-default"><i class="fa fa-angle-left prs"></i> Back</a>
						</div>
					</div>


				</div>
			</form>
			<!-- End questions content -->
		    
			    
	</div>

	<?php 
	}
	else{
	?>
	<?php $message = set_message_error("Oops! It looks like this questionnaire has been deleted.")?>
	<?php } ?>

	</div>
</section>

<script type="text/javascript">
	$(document).ready(function($){

		var sid = Math.floor(Math.random()*10000000000);

		$.validator.messages.required = 'This question is required.';
		$("#frm_questionaire").validate({
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
	        if (element.is(':checkbox') || element.is(':radio'))
	            error.insertAfter($(element).closest('fieldset'));
	        else
	            error.insertAfter(element);
		    }
		});


		$('#btn_submit').click(function() {
			$("#frm_questionaire").validate();
			if ($("#frm_questionaire").valid())
			{
				$("#frm_questionaire").submit();
			}
			else
			{
				$('input.error,select.error,textarea.error').first().focus();
				$('html,body').animate({scrollTop: $('.error:first').offset().top-200 });
				return false;
			}
		});

		
		<?=@$message?>
		<?=@$js_code?>
	});
</script>