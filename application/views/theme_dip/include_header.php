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

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="slide-nav">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="navbar-brand" href="/"><img class="img-responsive"
                                                  src="<?= CSS_PATH ?><?= CONST_CODENAME ?>/images/background/head-dip/dip-logo.png"/>
            </a>
        </div>
        <?php #include ('include_search_box.php');?>
        <div id="slidemenu">
            <form id="frm_search" name="frm_search" class="navbar-form navbar-right mt25" role="form">
                <div class="form-group">
                    <input type="search" placeholder="search" class="form-control" value="" id="keyword" name="keyword" onkeypress="isEnterGoTo(event,'search_advance(1)')" >
                </div>
                <button type="button" class="btn btn-primary_red" onclick="search_advance(1)">Search</button>
            </form>
            <ul class="nav navbar-nav">
                <li class=""><a href="/">HOME</a></li>
                <?php if (is_login()) { ?>
                    <!--<li class="dropdown <?php if($this->uri->segment(1)=="my-account"){echo "active";}else{echo "";}?>"><a href="<?= site_url('my-account'); ?>"><?= getUserLoginFirstNameTh($user_login_info) ?></a>
                    </li>-->
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><?= getUserLoginFirstNameTh($user_login_info) ?> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?= site_url('my-account'); ?>">PROFILE</a></li>
                            <li><a href="<?= site_url('logout'); ?>">LOGOUT</a></li>
                        </ul>    
                    </li>
                  
                    <?php if (is_staff_or_higher() && @$mode != "backend") { ?>
                        <li><a href="<?= site_url('admin/dashboard'); ?>">CONTROL PANEL</a></li>

                    <?php } ?>
                    <li class="<?php if($this->uri->segment(1)=="my-bookshelf"){echo "active";}else{echo "";}?>"><a href="<?= site_url('my-bookshelf'); ?>">MY SHELF</a></li>
                <?php } else { ?>
                    <li class="<?php if($this->uri->segment(1)=="login"){echo "active";}else{echo "";}?>"><a href="<?= site_url('login'); ?>">SIGN IN</a></li>
                    <li class="<?php if($this->uri->segment(1)=="registration"){echo "active";}else{echo "";}?>"><a href="<?= site_url('registration'); ?>">SIGN UP</a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>


<section id="main-header">

    <div class="row">
    </div>
    </div>
</section>
