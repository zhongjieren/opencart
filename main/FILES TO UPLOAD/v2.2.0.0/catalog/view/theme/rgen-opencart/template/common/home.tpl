<?php 
if ($this->rgen('rgen_check')) {
	include $this->rgen('layout_top');
	include $this->rgen('layout_bottom');
	echo $footer;
}else{
	echo $this->rgen('rgen_error');
}
	
?>