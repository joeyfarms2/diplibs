<div class="container">
    <div class="mt30 row">
        <div class="col-xs-12 col-md-9 col-sm-9 div-breadcrumb">
            <!--<img src="<?= CSS_PATH ?><?= CONST_CODENAME ?>/images/background/menu_bar_03.png">
								<h2 class="subTitle mb15">Home</h2>-->
            <ul class="breadcrumb">
                <li><a href="<?= site_url('your-library'); ?>"><span class="textStart">M</span>ain Menu</a></li>
                <?php
                if(isset($page_title)&&$page_title !=""){ ?>
                    <li><?= @$page_title ?></li>
              <?php } else{ ?>
                    <li><?=$this->uri->segment(1);?></li>
              <?php  }
                ?>

            </ul>
        </div>

        <?php if(isset($thisFrontSubMenu) && $thisFrontSubMenu!='my_transaction' && $thisFrontSubMenu!='my_bookshelf_vdo' ) { ?>
            <div class="col-sm-3 view-by-menu pr10 mt10 hidden-xs">
                <ul>
                    <li class="<?=($show_option == 'shelf') ? "active" : "";?>"><a href="<?=site_url('my-bookshelf/sort-'.$sort_by)?>"><i class="fa fa-th-large"></i></a></li>
                    <li class="<?=($show_option == 'list') ? "active" : "";?>"><a href="<?=site_url('my-bookshelf-list/sort-'.$sort_by)?>"><i class="fa fa-list-ul"></i></a></li>
                    <li>View : </li>
                </ul>
            </div>
        <?php } else{?>
        <div class="col-md-3 col-sm-3 view-by-menu pr10 mt10 hidden-xs">
            <?php if($this->uri->segment(1) =="event"){?>
                <div class="pull-right mrl">
                    <a href="<?= site_url('event/calendar') ?>" title="Calendar view"><i
                            class="fa fa-calendar fa-lg mrm <?= (@thisAction == 'home_calendar' ? 'text-primary' : 'text-muted') ?>"></i></a>
                    <a href="<?= site_url('event') ?>" title="List view"><i
                            class="fa fa-list-ul fa-lg <?= (@thisAction != 'home_calendar' ? 'text-primary' : 'text-muted') ?>"></i></a>
                </div>
          <?php  }?>

        </div>
        <?php } ?>

    </div>
</div>