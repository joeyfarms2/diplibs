<style type="text/css">
	.q_cat {
		background-color: #EBEBEB;
		padding: 10px;
		margin: 0 0 10px 0;
	}
</style>
<div id="message-box">
	<div id="result-msg-box" class="hidden" ></div>
</div>


<section id="projects">
	<div class="container mt15 pan">
		
		<div id="main_content">
			<h3 class="textSub">Questionaires for <span class="textStart">EastWater</span> Group</h3>
			<p>
				We are carrying out an evaluation of some of the library's services, to see if we can improve facilities and make them more relevant for our customers. Thank you for taking the time to fill in this questionaire; it should only take not more than 10 minutes. Your answers will be treated with complete confidentiality, and unless you choose to provide an email address, will be entirely anonymous. If you have any questions about this questionaire, please contact <a href="mailto:<?=CONTACT_EMAIL?>"><?=CONTACT_EMAIL?></a>
			</p>

			<?php foreach ($questionaire_home_result as $key => $item) { ?>
				<div class="row q_cat">
					<div class="col-md-12">
						<h3 class="textStart mbn"><?=$item['name']?></h3>
					</div>
				</div>

				<?php if (!empty($item['questionaire_list'])) { ?>
				<div class="row">
					<div class="col-md-12 mts mbl">
						<ul class='lsn pls mll'>
						<?php foreach ($item['questionaire_list'] as $item_q) { ?>
							<li><a href="<?=site_url('questionaire/form/'.$item_q['aid'])?>"><i class="fa fa-chevron-right prs text-success"></i> <?=$item_q['title']?></a></li>
						<?php } ?>
						</ul>
					</div>
				</div>
				<?php } else { ?>
					<div class="row">
						<div class="col-md-12 mts mbl">
							<ul class='lsn pls mll'><li><em class="text-muted">No questionaires under this category.</em></li></ul>
						</div>
					</div>
				<?php } ?>

			<?php } ?>
		</div>


	</div>
</section>

<script type="text/javascript">
	$(document).ready(function($){

		<?=@$message?>
		<?=@$js_code?>
	});
</script>