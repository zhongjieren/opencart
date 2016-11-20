<div id="rgen-basicslideshow-rgenukMc5f" class="rgen-basicslideshow basicslideshow-rg9zi">
	<div>
		<div class="slideshow-wrp dots-typ1 normal">
			<div class="slideshow">
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://127.0.0.1:90/image/cache/catalog/rgen/demo04_images/slideshow/other/offer-text1-1170x100.png" alt="R.Gen - OpenCart Modern Store Design"/></a>
									</div>
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://127.0.0.1:90/image/cache/catalog/rgen/demo04_images/slideshow/other/offer-text2-1170x100.png" alt="R.Gen - OpenCart Modern Store Design"/></a>
									</div>
							</div>
		</div>
	</div>
</div>


<script type="text/javascript" ><!--
$(document).ready(function(){

		if ($('.ly-column').length == 0) {
		$("#rgen-basicslideshow-rgenukMc5f > div").addClass('container');
	};
	
	var win         = $(window);
	var auto        = true;
	var autostopped = false;
	var container   = $("#rgen-basicslideshow-rgenukMc5f .slideshow-wrp");

	/* Default slide script
	------------------------*/
	var sudoSlider = $("#rgen-basicslideshow-rgenukMc5f .slideshow").sudoSlider({
		responsive: true,
		controlsAttr: 'class="owl-controls"',
		effect: "fadeOutIn",
		speed: 1500,
				auto: true,
				pause: 2000,
				prevNext: false,
				
				continuous: true,
				updateBefore: true,
		mouseTouch: false,
		touch: true,
		slideCount: 1
	})

		.mouseenter(function() {
		auto = sudoSlider.getValue('autoAnimation');
		if (auto) { sudoSlider.stopAuto(); } else { autostopped = true; }
	})
	.mouseleave(function() {
		if (!autostopped) { sudoSlider.startAuto(); }
	})
	;

	
	
	});
//--></script>
