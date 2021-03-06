<!DOCTYPE html>

<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en">
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

<body class="header2">
<!-- globalWrapper -->
<div id="globalWrapper" class="localscroll">
    <?php include_once("include_header.php"); ?>
    <?php include_once("include_slider.php"); ?>
    <?php #include_once("include_menu.php"); ?>
    <section id="content">
        <!-- title -->
        <!--			<div class="mt15">-->
        <!--                -->
        <!---->
        <!--				<div class="container">-->
        <!--					<div class="row">-->
        <!--						<div class="col-md-12 clearfix pan">-->
        <!--							<h2 class="subTitle mb15">-->
        <!--								<a href="--><? //=site_url();?><!--"><img src="--><? //=CSS_PATH?><!---->
        <? //=CONST_CODENAME?><!--/images/background/logo_symbol.png" class="bc-logo-symbol" /></a> |-->
        <!--								<a href="--><? //=site_url('your-library');?><!--">MainMenu</a> |-->
        <!--								--><? //=@$page_title?>
        <!--							</h2>-->
        <!---->
        <!--							<div class="pull-right mrl">-->
        <!--								<a href="-->
        <? //=site_url('event/calendar')?><!--" title="Calendar view"><i class="fa fa-calendar fa-lg mrm -->
        <? //=(@thisAction == 'home_calendar' ? 'text-primary' : 'text-muted')?><!--"></i></a>-->
        <!--								<a href="-->
        <? //=site_url('event')?><!--" title="List view"><i class="fa fa-list-ul fa-lg -->
        <? //=(@thisAction != 'home_calendar' ? 'text-primary' : 'text-muted')?><!--"></i></a>-->
        <!--							</div>-->
        <!--						</div>-->
        <!--					</div>-->
        <!--				</div>-->
        <!--			</div>-->

        <?php include("include_breadcrumb.php"); ?>


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
                <?php include_once("include_right_event.php"); ?>
                <!-- End : Sidebar -->
            </div>
        </div>
    </section>
    <?php include_once("include_footer.php"); ?>
</div>
<?php include_once("include_script.php"); ?>

<script type="text/javascript">
    jQuery(document).ready(function () {
        // getShelfBadge();
        // update_basket_badge();
    });
</script>

</body>
</html>
