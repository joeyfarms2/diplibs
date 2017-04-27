<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> 
<![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> 
<![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> 
<![endif]-->
<!--[if (gte IE 9)|!(IE)]>
<!-->
<html lang="en">
<!--<![endif]-->

<head>

	<?php include_once("include_meta.php"); ?>

</head>



<script type="text/javascript">
	jQuery(document).ready(function() {
		// getShelfBadge();
		// update_basket_badge();
	});
</script>

<?php

?>

<body class="header2">
	<!-- globalWrapper -->
	<div id="globalWrapper" class="localscroll">
		<?php include_once("include_header.php"); ?>
		<?php //include_once("include_menu.php"); ?>
		<?php include_once("include_slider.php"); ?>
		<section id="content">
			<!-- title -->
			<?php include ("include_breadcrumb.php");?>
			<!-- title -->

			<div class="container">
				<div class="row">
					<div class="col-md-8 custom-content-home-box">
						<!-- Content -->
						<?php
						include(get_content_file(@$view_the_content));
						?>
						<!-- End : Content -->
					</div>

					<!-- sidebar -->
					<?php include_once("include_right_news.php"); ?>
					<!-- End : Sidebar -->
				</div>
			</div>
		</section>
		<?php include_once("include_footer.php"); ?>
	</div>
	<?php include_once("include_script.php"); ?>
</body>
</html>
