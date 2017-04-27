<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <?php include_once("include_meta.php"); ?>
    <link rel="stylesheet" type="text/css"
          href="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/responsive-calendar/css/responsive-calendar.css"/>
    <link rel="stylesheet" type="text/css"
          href="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/responsive-calendar/css/responsive-calendar-bootstrap.css"/>
    <link rel="stylesheet" type="text/css"
          href="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/word-rotator/animate.css"/>
    <link rel="stylesheet" type="text/css"
          href="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/word-rotator/jquery.wordrotator.css"/>
</head>

<script type="text/javascript">
    jQuery(document).ready(function () {
        // getShelfBadge();
        // update_basket_badge();
    });
</script>

<style>
    @media (min-width: 480px) and (max-width: 767px) {
        h2.subTitle {
            font-size: 20px;
            margin-top: 5px;
        }
    }

    @media (min-width: 360px) and (max-width: 479px) {
        h2.subTitle {
            font-size: 18px;
            margin-top: 5px;
        }
    }

    @media (min-width: 320px) and (max-width: 359px) {
        h2.subTitle {
            font-size: 15px;
            margin-top: 5px;
        }
    }

</style>


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
                <div class="col-md-9 custom-content-home-box">
                    <!-- Content -->
                    <?php
                    include(get_content_file(@$view_the_content));
                    ?>
                    <!-- End : Content -->
                </div>

                <!-- sidebar -->
                <?php include_once("include_right_home.php"); ?>
                <!-- End : Sidebar -->
            </div>
        </div>
    </section>
    <?php include_once("include_footer.php"); ?>
</div>
<?php include_once("include_script.php"); ?>
<script type="text/javascript"
        src="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/responsive-calendar/js/responsive-calendar.js"></script>
<script type="text/javascript"
        src="<?= CSS_PATH ?><?= CONST_CODENAME ?>/js-plugin/word-rotator/jquery.wordrotator.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        $(".responsive-calendar").responsiveCalendar({
            startFromSunday: true,
            events: <?=$json_arr_cal?>
        });

        $("#event_rotator").wordsrotator({
            autoLoop: true,             //auto rotate words
            randomize: false,               //show random entries from the words array
            stopOnHover: false,             //stop animation on hover
            changeOnClick: false,           //force animation run on click
            animationIn: "flipInY",         //css class for entrace animation
            animationOut: "flipOutY",           //css class for exit animation
            speed: 5000,                //delay in milliseconds between two words
            words: <?=$json_incoming_event_rotator?>  //Array of words, it may contain HTML values
        });
    });
</script>
</body>
</html>
