<!-- Navbar -->
<?php
$this_front_tab_menu = @thisFrontTabMenu;
$this_front_sub_menu = @thisFrontSubMenu;
$master_product_main = @$master_product_main;
$this_product_main_name = @$this_product_main_name;
$page_name = @$page_name;

// print_r($master_product_main);
// echo "<br/>";
// print_r($this_product_main_name);
?>
<section id="main-header">
    <div class="container dip-headbar">
        <div class="row">
            <div class="col-md-4 col-sm-4 dip-topmeu_logo">
                <a href="/"><img class="image-responsive"
                                 src="<?= CSS_PATH ?><?= CONST_CODENAME ?>/images/background/head-dip/dip-logo.png"/></a>
            </div>
            <div class="col-md-8 col-sm-8 dip-topmeu_red">
                <div class="dip-menu-list">
                    <nav id="navWrap" role="navigation">
                        <ul id="nav">
                            <?php if (is_login()) { ?>
                                <li class="nav-item"><a class="nav-item-link" href="<?= site_url('my-account'); ?>"
                                                        title="Profile"><span
                                            class="circle"><?php /*=get_array_value($user_login_info,"avatar_tiny","")*/ ?>
                                            <img src="/styles/<?= CONST_CODENAME ?>/images/avatar/avatar.png"/></span>&nbsp;<span
                                            class="hidden-sm"><?= getUserLoginFirstNameTh($user_login_info) ?></span></a>
                                </li>
                                <?php if (is_staff_or_higher() && @$mode != "backend") { ?>
                                    <li class="nav-item"><a class="nav-item-link"
                                                            href="<?= site_url('admin/dashboard'); ?>"
                                                            title="Control Panel"><span class="circle"><img
                                                    src="/styles/<?= CONST_CODENAME ?>/images/avatar/setting.png"/></span>&nbsp;<span
                                                class="hidden-sm">Control Panel</span></a></li>
                                <?php } ?>
                                <li class="nav-item"><a class="nav-item-link" href="<?= site_url('my-bookshelf'); ?>"
                                                        title="MY SHELF"><span class="circle"><img
                                                src="/styles/<?= CONST_CODENAME ?>/images/avatar/myshelf.png"/></span>&nbsp;<span
                                            class="hidden-sm">MY SHELF</span></a></li>
                                <li class="nav-item"><a class="nav-item-link" href="<?= site_url('logout') ?>"
                                                        title="SIGN OUT"><span class="circle"><img
                                                src="/styles/<?= CONST_CODENAME ?>/images/avatar/logout.png"/></span>&nbsp;<span
                                            class="hidden-sm">SIGN OUT</span></a></li>
                            <? } else { ?>
                                <li class="nav-item"><a class="nav-item-link" href="<?= site_url('login') ?>"
                                                        title="SIGN IN"><span class="circle"><img
                                                src="/styles/<?= CONST_CODENAME ?>/images/avatar/login.png"/></span>&nbsp;<span
                                            class="hidden-sm">SIGN IN</span></a></li>
                                <li class="nav-item"><a class="nav-item-link" href="<?= site_url('registration') ?>"
                                                        title="SIGN UP"><span class="circle"><img
                                                src="/styles/<?= CONST_CODENAME ?>/images/avatar/register.png"/></span>&nbsp;<span
                                            class="hidden-sm">SIGN UP</span></a></li>
                            <?php } ?>

                        </ul>
                    </nav>
                </div>
                <div class="search-top">
                    <?php include('include_search_box.php'); ?>
                </div>
            </div>

        </div><!--/row-->
        <div class="col-md-12">
        </div>
    </div>
    <div class="row">
    </div>
    </div>
</section>


<style>

    .show-resolution {
        position: fixed;
        top: 0px;
        width: 100%;
        height: 30px;
        text-align: right;
        padding-right: 10px;
    }

    .nav > li > a {
        padding: 10px 10px;
        font-size: 18px;
    }

    .navbar-nav > li > a:hover {
        color: #555 !important;
    }

    .navbar {
        margin-bottom: 0px;
    }

    #search-box {
        max-width: 100% !important;
        /*float: right !important;*/
        width: 500px !important;
        padding-right: 10px;
    !important
    }

    #keyword {
        width: 300px !important;
    }

    .nav {
        margin-top: 18px !important;
    }

    @media (min-width: 901px) and (max-width: 1024px) {
        .logo_image {
            width: 270px;
        }
    }

    @media (min-width: 768px) and (max-width: 900px) {
        .logo_image {
            width: 250px;
        }

    }

    @media (min-width: 480px) and (max-width: 767px) {
        .text-slider-header-top {
            visibility: hidden;
        }

        .logo_image {
            width: 220px;
        }

        #keyword {
            width: 100% !important;
        }
    }

    @media (min-width: 360px) and (max-width: 479px) {
        .text-slider-header-top {
            visibility: hidden;
        }

        .logo_image {
            width: 200px;
        }

        #keyword {
            width: 100% !important;
        }
    }

    @media (min-width: 320px) and (max-width: 359px) {
        .text-slider-header-top {
            visibility: hidden;
        }

        .logo_image {
            width: 150px;
        }

        #keyword {
            width: 100% !important;
        }
    }


</style>
<script>
    $(document).ready(function () {
        //var x = "Total Width: " + screen.width + "px";
        var x = "Total Width: " + $(window).width() + "px";
        //document.getElementById("screen_area").innerHTML = x;
        $("#screen_area").html(x);

        $(window).resize(function () {
            var x = "Total Width: " + $(window).width() + "px";

            $("#screen_area").html(x);
        });
    });

</script>