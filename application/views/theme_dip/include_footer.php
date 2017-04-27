
<section id="before-footer">
	<div class="before-footer"></div>
</section>

<!-- footer 1-->
<footer id="footerWrapper">
	<section id="mainFooter">
		<div class="container">
			<div class="row">

				<div class="col-md-6" >
					<div class="col-md-12" >
						<h3>กรมทรัพย์สินทางปัญญา กระทรวงพาณิชย์(DIP)</h3>
						<p>
							เลขที่ 563 ถนนนนทบุรี  ต.บางกระสอ อ.เมืองนนทบุรี จังหวัดนนทบุรี 11000
						</p>
					</div>
					<div class="col-sm-4" >
						<div class="col-xs-4" >
<!--							<img src="--><?//=CSS_PATH?><!----><?//=CONST_CODENAME?><!--/images/background/logo-fb.png" />-->
						</div>
						<div class="col-xs-4" >
<!--							<img src="--><?//=CSS_PATH?><!----><?//=CONST_CODENAME?><!--/images/background/logo-tw.png" />-->
						</div>
						<div class="col-xs-4" >
<!--							<img src="--><?//=CSS_PATH?><!----><?//=CONST_CODENAME?><!--/images/background/logo-google.png" />-->
						</div>		
					</div>
					<div class="col-sm-8" >
						<!--
						<div class="col-xs-12" >
							Library line : 0-2281-7399 ต่อ 223,227
						</div>
						<div class="col-xs-12" >
							Library Fax : 0-2282-6803
						</div>
						<div class="col-xs-12" >
							E-mail : nia.library@nia.go.th
						</div>
						-->
					</div>
				</div>

				<div class="col-md-6" >
					<div class="col-sm-6 " >
						<div class="col-xs-12" >
							<p><h3>HOURS</h3></p>
						</div>
						<div class="col-xs-12" >	
							<p>Monday through Sunday</p>
						</div>
						<div class="col-xs-12" >
							<p>10am-5pm</p>
						</div>		
					</div>

					<div class="col-sm-6" >
						<div class="col-xs-12" >
							<p><h3>CONTACT</h3></p>
						</div>
						<div class="col-xs-12" >
							<p><a href="<?=site_url('ask-librarian')?>">Ask Librarian</a></p>
						</div>
						<div class="col-xs-12" >
							<p><a href="https://www.dip.go.th" target="_bllank">Go to www.dip.go.th</a></p>
						</div>
						<div class="col-xs-12" >
							<p><a href="https://www.bookdose.com" target="_bllank">Go to Bookdose</a></p>
						</div>
					</div>

				</div><!--row-->
			</div>
		</div>
	</section>
</footer>
<!-- End footer 1-->
<section id="after-footer">
	<div class="after-footer"></div>
</section>
<script>
	$(document).ready(function () {


		//stick in the fixed 100% height behind the navbar but don't wrap it
		$('#slide-nav.navbar-inverse').after($('<div class="inverse" id="navbar-height-col"></div>'));

		$('#slide-nav.navbar-default').after($('<div id="navbar-height-col"></div>'));

		// Enter your ids or classes
		var toggler = '.navbar-toggle';
		var pagewrapper = '#page-content';
		var navigationwrapper = '.navbar-header';
		var menuwidth = '100%'; // the menu inside the slide menu itself
		var slidewidth = '80%';
		var menuneg = '-100%';
		var slideneg = '-80%';


		$("#slide-nav").on("click", toggler, function (e) {

			var selected = $(this).hasClass('slide-active');

			$('#slidemenu').stop().animate({
				left: selected ? menuneg : '0px'
			});

			$('#navbar-height-col').stop().animate({
				left: selected ? slideneg : '0px'
			});

			$(pagewrapper).stop().animate({
				left: selected ? '0px' : slidewidth
			});

			$(navigationwrapper).stop().animate({
				left: selected ? '0px' : slidewidth
			});


			$(this).toggleClass('slide-active', !selected);
			$('#slidemenu').toggleClass('slide-active');


			$('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');


		});


		var selected = '#slidemenu, #page-content, body, .navbar, .navbar-header';


		$(window).on("resize", function () {

			if ($(window).width() > 767 && $('.navbar-toggle').is(':hidden')) {
				$(selected).removeClass('slide-active');
			}


		});




	});
</script>

