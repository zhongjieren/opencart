<div id="rgen-basicslideshow-rgenK1u4uc" class="rgen-basicslideshow basicslideshow-rgvME">
	<div>
		<div class="slideshow-wrp dots-typ1 normal">
			<div class="slideshow">
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://127.0.0.1:90/image/cache/catalog/rgen/demo07_images/slideshow/home-slideshow/slide01-930x400.jpg" alt="R.Gen - OpenCart Modern Store Design"/></a>
									</div>
								<div class="slide">
										<a href="http://themeforest.net/item/rgen-opencart-modern-store-design/2699592?ref=R_GENESIS" target="_blank"><img src="http://127.0.0.1:90/image/cache/catalog/rgen/demo07_images/slideshow/home-slideshow/slide02-930x400.jpg" alt="R.Gen - OpenCart Modern Store Design"/></a>
									</div>
							</div>
		</div>
	</div>
</div>


<script type="text/javascript" ><!--
$(document).ready(function(){

		if ($('.ly-column').length == 0) {
		$("#rgen-basicslideshow-rgenK1u4uc > div").addClass('container');
	};
	
	var win         = $(window);
	var auto        = true;
	var autostopped = false;
	var container   = $("#rgen-basicslideshow-rgenK1u4uc .slideshow-wrp");

	/* Default slide script
	------------------------*/
	var sudoSlider = $("#rgen-basicslideshow-rgenK1u4uc .slideshow").sudoSlider({
		responsive: true,
		controlsAttr: 'class="owl-controls"',
		effect: "random",
		speed: 1500,
				auto: true,
				pause: 2000,
				prevNext: true,
		nextHtml: '<a class="next"><i class="fa fa-chevron-right"></i></a>',
		prevHtml: '<a class="prev"><i class="fa fa-chevron-left"></i></a>',
						numeric: true,
		numericAttr: 'class="dots ul-reset"',
		
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
