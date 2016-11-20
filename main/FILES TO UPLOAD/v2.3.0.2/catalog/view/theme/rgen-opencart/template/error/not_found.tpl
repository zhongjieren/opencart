<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>
<p><?php echo $text_error; ?></p>
<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>
<?php 
	include $rgen_config->layout_bottom;
	echo $footer;
?>