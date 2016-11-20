<?php 
if ($rgen->rgen_check) {
	$top = $rgen->layout_top;
	$bottom = $rgen->layout_bottom;
	include $top;
	include $bottom;
	echo $footer;
}else{
	echo $rgen->rgen_error;
}
	
?>