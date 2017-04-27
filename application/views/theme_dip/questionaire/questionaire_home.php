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
			<h3 class="textSub">Questionaires for <span class="textStart">DIP</span> Group</h3>
			<p>
				โปรดตอบแบบสอบถาม เพื่อนำความคิดเห็นของท่านไปปรับปรุงการให้บริการ เพื่อให้สอดคล้องกับความต้องการของท่านเพิ่มมากขึ้น 
ขอบคุณที่ท่านสละเวลาในการตอบแบบสอบถามซึ่งใช้เวลาไม่เกิน 10 นาที เราจะเก็บความคิดเห็นและอีเมลล์ของท่านเป็นความลับ 
สอบถามรายะเอียดเพิ่มเติมที่ <a href="mailto:<?=CONTACT_EMAIL?>"><?=CONTACT_EMAIL?></a>
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