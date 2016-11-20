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