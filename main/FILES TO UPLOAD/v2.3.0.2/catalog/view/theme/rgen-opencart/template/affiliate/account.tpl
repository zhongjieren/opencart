<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>

<div class="frm-wrp">
	<ul class="ul-list-1">
		<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
		<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
		<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
	</ul>
</div>

<div class="frm-wrp">
	<h3 class="frm-hd"><?php echo $text_my_tracking; ?></h3>
	<ul class="ul-list-1">
		<li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
	</ul>
</div>

<div class="frm-wrp">
	<h3 class="frm-hd"><?php echo $text_my_transactions; ?></h3>
	<ul class="ul-list-1">
		<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
	</ul>
</div>

<?php 
	include $rgen_config->layout_bottom;
	include $rgen_config->msg_success;
	echo $footer;
?>