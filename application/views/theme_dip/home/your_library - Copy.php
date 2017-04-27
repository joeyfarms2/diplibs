<script type="text/javascript">
	jQuery(document).ready(function($){
		<?=@$message?>
		<?=@$js_code?>
	});
</script>
<style>
.mb20 a img {
    width: 100% !important;
}

@media (min-width:360px) and (max-width:479px)
{
	.mb20 a img {
    	width: 100% !important;
    }
}

@media (min-width:320px) and (max-width:359px)
{
	.mb20 a img {
    	width: 100% !important;
    }
}
</style>
<section id="message-box">
	<div class="container">
		<div id="result-msg-box" class="hidden" ></div>
	</div>
</section>
<section id="projects">
	<div class="container mt15 book-box">		<!-- call to action -->
		<div class="mt10 mb10">
			<div class="row">
			<?php if(CONST_FRONT_NEWS_MENU=='1'){ ?>
				<div class="col-xs-6 col-sm-4 mb20">
					<a href="<?=site_url('news')?>">
						<!--<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_news_button.png"  onmouseover="this.src='<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/1_1.png';" onmouseout="this.src='<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/1.png';" />-->
						<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_news_button.png" />
					</a>
				</div>

			<?php }?>
				<?php if(CONST_FRONT_BOOK_MENU=='1'){ ?>
					<div class="col-xs-6 col-sm-4 mb20">
						<a href="<?=site_url('list-book/category/books')?>">
							<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_e_book_button.png" />
						</a>
					</div>
				<?php } ?>
			<?php if(CONST_FRONT_EBOOK_MENU=='1'){ ?>
				<div class="col-xs-6 col-sm-4 mb20">
					<a href="<?=site_url('list-book/category/ebooks')?>">
						<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_e_book_button.png" />
					</a>
				</div>
			<?php } ?>
			<?php if(CONST_FRONT_EMAGAZINE_MENU=='1'){ ?>
				<div class="col-xs-6 col-sm-4 mb20">
					<a href="<?=site_url('list-magazine/category/emagazines')?>">
					<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_e_magazine_button.png" />
					</a>
				</div>
			<?php } ?>
			<?php if(CONST_FRONT_INFROMATION_MENU=='1'){ ?>
					<div class="col-xs-6 col-sm-4 mb20">
						<a href="<?=site_url('list-book/category/information')?>">
							<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_information_button.png" />
						</a>
					</div>
				<?php } ?>
			<?php if(CONST_FRONT_GALLERY_MENU=='1'){ ?>
					<div class="col-xs-6 col-sm-4 mb20">
						<a href="<?=site_url('list-vdo/category/photo-gallerys')?>">
							<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_gallery_button.png" />
						</a>
					</div>
			<?php } ?>
			<?php if(CONST_FRONT_MUTIMEDIA_MENU=='1'){ ?>
					<div class="col-xs-6 col-sm-4 mb20">
						<a href="<?=site_url('list-vdo/category/multimedia')?>">
							<img src="<?=CSS_PATH?><?=CONST_CODENAME?>/images/background/your-library/menu_multimedia_button.png" />
						</a>
					</div>
			<?php } ?>

			</div>
		</div>
		<!-- call to action -->


	</div>
</section>
