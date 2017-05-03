<?php
$calendar_list = @$calendar_list;
$event_list = @$event_list;
$news_popular_list = @$news_popular_list['results'];
$news_recommended_list = @$news_recommended_list['results'];
$news_talk_of_the_town_list = @$news_talk_of_the_town_list['results'];
$news_top_commenters = @$news_top_commenters['results'];
$word = "news";




$new_list = @$new_list;
$recommended_list = @$recommended_list;
$product_type_aid = @$product_type_aid;

$word_is = "books";
$class = "";
if ($product_type_aid == "2") {
    $word_is = "magazines";
} else if ($product_type_aid == "3") {
    $word_is = "vdo";
    $class = "vdo-";
}


?>

<aside id="sidebar2" class="col-md-3 custom-right-box">

    <?php include_once('include_right_ads.php'); ?>
    <?php if (current_url() == PUBLIC_PATH || current_url() == PUBLIC_PATH . "home") { ?>
        <!-- Start : Calendar box -->
        <!--<div class="boxTitle clearfix">
			<p><a class="not-btn" href="<?= site_url('home_ecard') ?>"><img src='<?= CSS_PATH . CONST_CODENAME . "/images/background/ecard_button.png" ?>'></a></p>
		</div>-->
        <?php //if(is_var_array($calendar_list)){ ?>


        <!-- End : Calendar box -->

        <!-- Start : Rss box -->
    <?php }
    if (current_url() == PUBLIC_PATH || current_url() == PUBLIC_PATH . "home") { ?>

    <?php } ?>
    <!-- End : Rss box -->
    <!-- Start : Event box -->
    <?php if (is_var_array($event_list)) { ?>
        <div class="separator"></div>

        <div class="boxFocus">
            <div class="boxTitle clearfix">
                <h3 class="txt-green pull-left">Events</h3>
                <a href="<?= site_url('event') ?>" class="pull-right">See all</a>
            </div>

            <div class="boxContent">
                <?php foreach ($event_list as $item) { ?>
                    <div class="row pan box-event" data-event-aid='<?= get_array_value($item, "aid", "") ?>'>
                        <div class="col-md-12 event-content">
                            <div class="media">
                                <a href="#" class="pull-left">
                                    <?php if (file_exists(str_replace(site_url(), '', get_array_value($item, "avatar_mini_path", "")))) { ?>
                                        <img src='<?= get_array_value($item, "avatar_mini_path", "") ?>'
                                             class='img-responsive size-s'/>
                                    <?php } else { ?>
                                        <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                             class="img-responsive size-s"/>
                                    <?php } ?>
                                </a>
                                <div class="media-body">
                                    <div class="media-heading clearfix">
                                        <div class="event-header col-sm-7">
                                            <a href="<?= site_url('event/detail/' . get_array_value($item, "aid", "")) ?>">
                                                <h4 class="mbn pln prn"><?= get_array_value($item, "title", "") ?></h4>
                                            </a>
                                            <div
                                                class="line-2"><?= get_array_value($item, 'event_period_date_txt', '') ?></div>
                                        </div>
                                        <div class="event-actions col-sm-5">
                                            <?php if ($item['is_public'] == '1') { ?>
                                                <span>Public Event</span>
                                            <?php } else if (!$item['has_passed'] && $item['is_invited'] == true) { ?>
                                                <?php if ($item['has_action'] == true) { ?>
                                                    <span
                                                        class="has-action"><?= get_array_value($item, 'has_joined_txt', '') ?></span>
                                                <?php } else { ?>
                                                    <a href="javascript:void(0);" class="action-event"
                                                       data-val='1'>Join</a>
                                                    <a href="javascript:void(0);" class="action-event"
                                                       data-val='0'>No</a>
                                                <?php } ?>
                                            <?php } else if (!$item['has_passed'] && $item['is_invited'] == false) { ?>
                                                <span>No invitation</span>
                                            <?php } ?>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="line-3"><?= get_array_value($item, 'location', '') ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>

        </div>
    <?php } ?>
    <!-- End : Event box -->
<!--Start Event Calendar -->
    <?php if (current_url() == PUBLIC_PATH || current_url() == PUBLIC_PATH . "home") { ?>
    <div class="boxContent">
        <div class="row">
            <div class="col-lg-12">
                <!-- Responsive calendar - START -->
                <div class="responsive-calendar">
                    <div class="controls pts pbl">
                        <h4><span data-head-month></span> <span data-head-year></span></h4>
                    </div>
                    <div class="day-headers">
                        <div class="day header">Sun</div>
                        <div class="day header">Mon</div>
                        <div class="day header">Tue</div>
                        <div class="day header">Wed</div>
                        <div class="day header">Thu</div>
                        <div class="day header">Fri</div>
                        <div class="day header">Sat</div>
                    </div>
                    <div class="days" data-group="days">

                    </div>
                </div>
                <!-- Responsive calendar - END -->

            </div>
        </div>

    </div>
    <?php } ?>
<!--End Event calendar-->

    <!-- Start : Popular News box -->
    <?php if(CONST_POPULAR_NEWS=='1'){ ?>
    <?php if (is_var_array($news_popular_list)) { ?>
        <div class="separator"></div>

        <div class="boxFocus">
            <div class="boxTitle">
                <h3 class="txt-green">Popular News</h3>
            </div>
            <p>Our popular <?= $word ?>.</p>

            <div class="boxContent">
                <?php foreach ($news_popular_list as $item) { ?>
                    <div class="row">
                        <div class="col-md-12 news-content">
                            <div class="media">
                                <div class="pull-left mrn">
                                    <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>"
                                       class="clearfix">
                                        <?php
                                        if (get_array_value($item, "cover_image_file_type", "") != "") {
                                            $cover_image_full_path = './' . get_array_value($item, "cover_image_actual", "");
                                            if (file_exists($cover_image_full_path)) {
                                                ?>
                                                <img
                                                    src='<?= get_image(get_array_value($item, "cover_image_thumb", ""), "-thumb") ?>'
                                                    class='img-responsive size-w-l'/>
                                                <?php
                                            } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                                <?= $item['dummy_cover_image'] ?>
                                                <?php
                                            } else {
                                                ?>
                                                <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                     class="img-responsive"/>
                                                <?php
                                            }
                                        } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                            <?= $item['dummy_cover_image'] ?>
                                        <?php } else { ?>
                                            <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                 class="img-responsive"/>
                                        <?php } ?>
                                    </a>
                                    <div class="under-img">
                                        <i class="bd-icon bd-icon-wow" title="Wow!"></i>
                                        <div class="text">
                                            <span
                                                class="badge bg-orange"><?= get_array_value($item, 'total_wow', '0') ?>
                                                &nbsp;Wow!</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="media-body">
                                    <div class="media-heading clearfix">
                                        <div class="event-header col-sm-12">
                                            <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>">
                                                <h4 class="line-1 mbn textSub pln prn"><?= get_array_value($item, "short_title", "") ?></h4>
                                            </a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div
                                            class="line-2 col-sm-12"><?= get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item, "publish_date", ""), ''); ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php } ?>
            </div>

        </div>
    <?php } ?>
    <?php }?>
    <!-- End : Popular News box -->


    <!-- Start : Recommended box -->
    <?php if(CONST_NEWS_RECOMMENDED=='1'){ ?>
    <?php if (is_var_array($news_recommended_list)) { ?>
        <div class="separator"></div>

        <div class="boxFocus">
            <div class="boxTitle">
                <h3 class="txt-green">Recommended</h3>
            </div>
            <p>The recommended <?= $word ?> selected by your librarian.</p>

            <div class="boxContent">
                <?php foreach ($news_recommended_list as $item) { ?>
                    <div class="row">
                        <div class="col-md-12 news-content">
                            <div class="media">
                                <div class="pull-left mrn">
                                    <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>"
                                       class="clearfix">
                                        <?php
                                        if (get_array_value($item, "cover_image_file_type", "") != "") {
                                            $cover_image_full_path = './' . get_array_value($item, "cover_image_actual", "");
                                            if (file_exists($cover_image_full_path)) {
                                                ?>
                                                <img
                                                    src='<?= get_image(get_array_value($item, "cover_image_thumb", ""), "-thumb") ?>'
                                                    class='img-responsive size-w-l'/>
                                                <?php
                                            } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                                <?= $item['dummy_cover_image'] ?>
                                                <?php
                                            } else {
                                                ?>
                                                <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                     class="img-responsive"/>
                                                <?php
                                            }
                                        } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                            <?= $item['dummy_cover_image'] ?>
                                        <?php } else { ?>
                                            <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                 class="img-responsive"/>
                                        <?php } ?>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <div class="media-heading clearfix">
                                        <div class="event-header col-sm-12">
                                            <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>">
                                                <h4 class="line-1 mbn textSub pln prn"><?= get_array_value($item, "short_title", "") ?></h4>
                                            </a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div
                                            class="line-2 col-sm-12"><?= get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item, "publish_date", ""), ''); ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php } ?>
            </div>

        </div>
    <?php } ?>
    <?php }?>
    <!-- End : Recommended box -->


    <!-- Start : Talk of the town box -->
    <?php if(CONST_NEWS_TALK_OF_THE_TOWN=='1'){ ?>
    <?php if (is_var_array($news_talk_of_the_town_list)) { ?>
        <div class="separator"></div>

        <div class="boxFocus">
            <div class="boxTitle">
                <h3 class="txt-green">Talk of the Town</h3>
            </div>

            <div class="boxContent">
                <?php foreach ($news_talk_of_the_town_list as $item) { ?>
                    <div class="row">
                        <div class="col-md-12 news-content">
                            <div class="media">
                                <div class="pull-left mrn">
                                    <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>"
                                       class="clearfix">
                                        <?php
                                        if (get_array_value($item, "cover_image_file_type", "") != "") {
                                            $cover_image_full_path = './' . get_array_value($item, "cover_image_actual", "");
                                            if (file_exists($cover_image_full_path)) {
                                                ?>
                                                <img
                                                    src='<?= get_image(get_array_value($item, "cover_image_thumb", ""), "-thumb") ?>'
                                                    class='img-responsive size-w-l'/>
                                                <?php
                                            } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                                <?= $item['dummy_cover_image'] ?>
                                                <?php
                                            } else {
                                                ?>
                                                <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                     class="img-responsive"/>
                                                <?php
                                            }
                                        } else if (isset($item['dummy_cover_image']) && !empty($item['dummy_cover_image'])) { ?>
                                            <?= $item['dummy_cover_image'] ?>
                                        <?php } else { ?>
                                            <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                                 class="img-responsive"/>
                                        <?php } ?>
                                    </a>
                                    <div class="under-img">
                                        <i class="bd-icon bd-icon-comment" title="Comment"></i>
                                        <div class="text">
                                            <span
                                                class="badge bg-orange"><?= get_array_value($item, 'total_comment', '0') ?>
                                                &nbsp;Comments</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <div class="media-heading clearfix">
                                        <div class="event-header col-sm-12">
                                            <a href="<?= site_url('news/detail/' . get_array_value($item, 'aid')) ?>">
                                                <h4 class="line-1 mbn textSub pln prn"><?= get_array_value($item, "short_title", "") ?></h4>
                                            </a>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div
                                            class="line-2 col-sm-12"><?= get_datetime_pattern(CONST_DEFAULT_DATE_PATTERN, get_array_value($item, "publish_date", ""), ''); ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <?php } ?>
            </div>

        </div>
    <?php } ?>
    <?php }?>
    <!-- End : Talk of the town box -->


    <!-- Start : Hot comments box -->
    <?php if (is_var_array($news_top_commenters)) { ?>
        <div class="separator"></div>
        <div class="boxFocus">
            <div class="boxTitle">
                <h3 class="txt-green">Hot Comments</h3>
            </div>

            <div class="boxContent">
                <?php foreach ($news_top_commenters as $item) { ?>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="media">
                                <a href="#" class="pull-left">
                                    <?php if (file_exists(str_replace(site_url(), '', get_array_value($item, "avatar_mini_path", "")))) { ?>
                                        <img src='<?= get_array_value($item, "avatar_mini_path", "") ?>'
                                             class='img-responsive size-s'/>
                                    <?php } else { ?>
                                        <img data-src="<?= JS_PATH ?>holder.js/100x100/text:no-image"
                                             class="img-responsive size-s"/>
                                    <?php } ?>
                                </a>
                                <div class="media-body">
                                    <div class="media-heading clearfix">
                                        <div>
                                            <h4 class="mbn pln prn"><?= get_array_value($item, "full_name_th", "") ?></h4>
                                            <!-- <div class="line-2"><?= get_array_value($item, "department", "") ?></div> -->
                                        </div>
                                        <div
                                            class="textStart"><?= get_array_value($item, "total_comment", "0") ?> <?= $item['total_comment'] > 1 ? 'comments' : 'comment' ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>

        </div>
    <?php } ?>
    <!-- End : Hot comments box -->

    <!-- Show New Box -->
    <?php if (is_var_array($new_list)) { ?>
        <div class="boxFocus ">
            <h3>Most Popular</h3>
            <p>Most popular <?= $word_is ?>, Let check it out!</p>
            <?php foreach ($new_list as $item) { ?>
                <div class="col-md-12 a-center">
                    <section class="boxContent">
                        <h4><i class="fa fa-circle red"></i><a
                                href="<?= site_url(get_array_value($item, "product_type_cid", "none") . '-detail/' . get_array_value($item, "aid", "")) ?>"><?= get_array_value($item, "title_short", "") ?></a>
                        </h4>
                    </section>
                    <?php
                    $is_license = get_array_value($item, "has_license", "0");
                    if ($is_license == '1') {
                        ?>
                        <div class="mask-ipad-right"></div>
                        <?php
                    }
                    ?>
                    <div class="cover-thumb-right"><a
                            href="<?= site_url(get_array_value($item, "product_type_cid", "none") . '-detail/' . get_array_value($item, "aid", "")) ?>"><img
                                src="<?= get_image(get_array_value($item, "cover_image_thumb_path", ""), $class . "thumb", get_array_value($item, "thumbnail_image", "")) ?>"
                                alt="<?= removeAllQuote(get_array_value($item, "title", "")) ?>"
                                class="mb15 img-responsive"></a></div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <!-- End : Show New Box -->

    <!-- Show Recommend Box -->
    <?php if (is_var_array($recommended_list)) { ?>
        <div class="boxFocus ">
            <h3>Librarian's Choices</h3>
            <p>The recommended <?= $word_is ?> selected by your librarian.</p>
            <?php foreach ($recommended_list as $item) { ?>
                <div class="col-md-12 a-center">
                    <section class="boxContent">
                        <h4><i class="fa fa-circle red"></i><a
                                href="<?= site_url(get_array_value($item, "product_type_cid", "none") . '-detail/' . get_array_value($item, "aid", "")) ?>"><?= get_array_value($item, "title_short", "") ?></a>
                        </h4>
                    </section>
                    <div class="cover-thumb-right"><a
                            href="<?= site_url(get_array_value($item, "product_type_cid", "none") . '-detail/' . get_array_value($item, "aid", "")) ?>"><img
                                src="<?= get_image(get_array_value($item, "cover_image_thumb_path", ""), $class . "thumb", get_array_value($item, "thumbnail_image", "")) ?>"
                                alt="<?= removeAllQuote(get_array_value($item, "title", "")) ?>"
                                class="mb15 img-responsive"></a></div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
    <!-- End : Recommend Box -->
</aside>
