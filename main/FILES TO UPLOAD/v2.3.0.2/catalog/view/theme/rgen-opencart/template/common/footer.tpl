<?php 
//echo "<pre>".print_r($rgen,true)."</pre>";
/*if (!method_exists($this,'rgen')) {
	echo $err_msg;
	exit();
}*/
$rgen_config = $rgen;
if (null === $rgen->rgen_check || $rgen->rgen_check === false) {
	$err_msg  = '<div style="font-family:arial; font-size:16px; line-height:2; color:#7c4a4a; padding:20px; background:#ffdbdb; border:1px solid #e06b6b; border-radius:5px; width:600px; margin:30px auto;">';
	$err_msg .= 'Theme not installed properly. <br><ul>';
	$err_msg .= '<li>Please install theme module <strong>R.Gen - OpenCart</strong> from<br><strong>Admin > Extensions > Modules</strong>.</li>';
	$err_msg .= '<li>Than go to <strong>Extensions > Modifications</strong> and click on the<br><strong>Blue Refresh button (top right corner)</strong> to apply theme changes.';
	$err_msg .= 'Theme will not work without Modifications changes.</li>';
	$err_msg .= '</ul></div>';
	echo $err_msg;
	exit();
} ?>

<?php 
$rgen    = $rgen_config->settings; 

/* PLACE - BOTTOM UPPER
**************************/ ?>
<div class="place_bottomupper"><?php echo isset($bottom_upper) ? $bottom_upper : null; ?></div>

<?php 
/* PLACE - BOTTOM - LEFT, MIDDLE, RIGHT
**************************/ ?>
<div class="out-wrapper<?php echo $rgen['wide_class']; ?>">
	<div class="container">
		<div class="rw gt40">
			<?php 
				if ((isset($bottom_left) && $bottom_left != '') && (isset($bottom_right) && $bottom_right != '')) {
					$mid_cls = ' cl6 d-xl6 t-xl12 m-xl12 m-sm12 m-xs12 ';
				} elseif ( ($bottom_left == '' && $bottom_right != '') || ($bottom_left != '' && $bottom_right == '') ){
					$mid_cls = ' cl9 d-xl9 t-xl12 m-xl12 m-sm12 m-xs12 ';
				} else {
					$mid_cls = ' cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12 ';
				}
			?>
			<?php if (isset($bottom_left) && $bottom_left != '') { ?>
			<div class="place_bottomleft cl3 d-xl3 t-xl12 m-xl12 m-sm12 m-xs12"><?php echo $bottom_left; ?></div>
			<?php } ?>

			<?php if (isset($bottom_middle) && $bottom_middle != '') { ?>
			<div class="place_bottommiddle<?php echo $mid_cls; ?>"><?php echo $bottom_middle; ?></div>
			<?php } ?>

			<?php if (isset($bottom_right) && $bottom_right != '') { ?>
			<div class="place_bottomright cl3 d-xl3 t-xl12 m-xl12 m-sm12 m-xs12"><?php echo $bottom_right; ?></div>
			<?php } ?>
		</div>
	</div>
</div>

<?php 
/* PLACE - BOTTOM LOWER
**************************/ ?>
<div class="place_bottomlower"><?php echo isset($bottom_lower) ? $bottom_lower : null; ?></div>

<?php 
$phone   = $rgen['default_ft_ph'];
$fax     = $rgen['default_ft_fax'];
$mail    = $rgen['default_ft_mail'];
$mailtxt = isset($mail['text'][$rgen['lng']]) ? $mail['text'][$rgen['lng']] : '';
$ft_t_w  = ' '.$rgen['default_ft_tw'];
$ft_b_w  = ' '.$rgen['default_ft_bw'];
$social  = $rgen['default_ft_social'];

$ft_contact = false;
if ($phone['status'] || $fax['status'] || $fax['status']) {
	$ft_contact = true;
} ?>
<footer>

	<div class="out-wrapper footer-upper<?php echo $ft_t_w; ?>">
		<div class="container">
			<div class="rw gt30">
				
				<div class="<?php echo $ft_contact == true ? 'cl10 ' : 'cl12 ' ?>ft-links-wrp">
					<div class="rw gt30">
						<?php if ($informations) { ?>
						<div class="cl3">
							<h5 class="ft-hd"><?php echo $text_information; ?></h5>
							<ul class="ul-reset">
								<?php foreach ($informations as $information) { ?>
								<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>
						<div class="cl3">
							<h5 class="ft-hd"><?php echo $text_service; ?></h5>
							<ul class="ul-reset">
								<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
								<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
								<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
							</ul>
						</div>
						<div class="cl3">
							<h5 class="ft-hd"><?php echo $text_extra; ?></h5>
							<ul class="ul-reset">
								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
							</ul>
						</div>
						<div class="cl3">
							<h5 class="ft-hd"><?php echo $text_account; ?></h5>
							<ul class="ul-reset">
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
							</ul>
						</div>
					</div>
				</div>
				<?php if ($ft_contact) { ?>
				<div class="cl2 ft-contact-wrp">
					<?php if ($phone['status'] || $fax['status'] || $fax['status']) { ?>
					<ul class="list-unstyled ft-contact">
						<?php 
						if ($phone['status']) { 
						if ($phone['ph1'] != '' || $phone['ph2'] != '') { ?>
						<li class="phone">
							<span class="vm icon"><i class="<?php echo $phone['icon_type'] == 'ico' ? $phone['icon'] : '' ?>"></i></span>
							<span class="info">
								<?php echo '<h5>'.$phone['ph1'].'</h5>'; ?>
								<?php echo '<h5>'.$phone['ph2'].'</h5>'; ?>
							</span>
						</li>
						<?php } }

						if ($fax['status']) { 
						if ($fax['fax1'] != '' || $fax['fax2'] != '') { ?>
						<li class="fax">
							<span class="vm icon"><i class="<?php echo $fax['icon_type'] == 'ico' ? $fax['icon'] : '' ?>"></i></span>
							<span class="info">
								<?php echo '<h5>'.$fax['fax1'].'</h5>'; ?>
								<?php echo '<h5>'.$fax['fax2'].'</h5>'; ?>
							</span>
						</li>
						<?php } }

						if ($mail['status']) { 
						if ($mail['text'] != '' || $mail['email'] != '') { ?>
						<li class="mail">
							<span class="vm icon"><i class="<?php echo $mail['icon_type'] == 'ico' ? $mail['icon'] : '' ?>"></i></span>
							<span class="info">
								<h5><a href="mailto:<?php echo $mail['email']; ?>"><?php echo html_entity_decode($mailtxt, ENT_QUOTES, 'UTF-8'); ?></a></h5>
							</span>
						</li>
						<?php } } ?>

					</ul>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="out-wrapper footer-bottom<?php echo $ft_b_w; ?>">
		<div class="container">
			<div class="rw gt0">
				<?php 
				$cl_size = '12';
				if (isset($social) && sizeof($social) > 0) { 
				$cl_size = '6'; ?>
				<div class="cl<?php echo $cl_size; ?>">
					<div class="social">
						<?php foreach ($social as $key => $value) { 
						$win = isset($value['win']) && $value['win'] == true ? ' target="_blank"' : ''; ?>
						<a href="<?php echo $value['link']; ?>"<?php echo $win; ?> class="vm"><i class="<?php echo isset($value['icon']['type']) && $value['icon']['type'] == 'ico' ? $value['icon']['icon'] : ''; ?>"></i></a>
						<?php } ?>	
					</div>
				</div>
				<?php } ?>
				<div class="cl<?php echo $cl_size; ?>">
					<?php 
					echo isset($rgen['default_ft_cards'][$rgen['lng']]) ? 
					html_entity_decode($rgen['default_ft_cards'][$rgen['lng']], ENT_QUOTES, 'UTF-8') : 
					'<img src="catalog/view/theme/rgen-opencart/image/crads.png" class="credit-cards">'; ?>
				</div>
			</div>
		</div>
	</div>
	<div class="out-wrapper cp-text<?php echo $ft_b_w; ?>">
		<div class="container">
			<?php 
			echo isset($rgen['default_ft_cphtml'][$rgen['lng']]) ? 
			html_entity_decode($rgen['default_ft_cphtml'][$rgen['lng']], ENT_QUOTES, 'UTF-8') : 
			$powered; ?>
		</div>
	</div>
</footer>
</div><!-- / main-wrapper end -->

<?php
/* PLACE - STICKY DATA
**************************/
if ($rgen_config->factory->device != 'm') {
	echo isset($stickydata) ? $stickydata : null; 
}?>

<span class="scroll-top vm"><i class="<?php echo isset($rgen['scroll_top_icon']) ? $rgen['scroll_top_icon'] : 'fa fa-chevron-up' ?>"></i></span>

<?php 
// Custom JS input code
if ($rgen['js_status']) { echo '<script type="text/javascript" >'.html_entity_decode($rgen['jscode'], ENT_QUOTES, 'UTF-8').'</script>'; } ?>

<!-- <?php echo 'v'.RGEN_VER; ?> -->
</body></html>