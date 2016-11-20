<?php 
	$rgen_config = $rgen;
	include $rgen_config->layout_top;
	echo $text_message;
	include $rgen_config->layout_bottom;
	echo $footer;
?>