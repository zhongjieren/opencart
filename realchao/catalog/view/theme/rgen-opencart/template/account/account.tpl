<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>
<div class="frm-wrp">
	<h2 class="frm-hd"><?php echo $text_my_account; ?></h2>
	<ul class="ul-list-1">
		<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
		<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
		<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
		<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
	</ul>	
</div>

<?php if ($credit_cards) { ?>
<div class="frm-wrp">
	<h2><?php echo $text_credit_card; ?></h2>
	<ul class="list-unstyled">
		<?php foreach ($credit_cards as $credit_card) { ?>
		<li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
		<?php } ?>
	</ul>
</div>
<?php } ?>

<div class="frm-wrp">
	<h2 class="frm-hd"><?php echo $text_my_orders; ?></h2>
	<ul class="ul-list-1">
		<li><a href="<?php echo $order; ?>">11111<?php echo $text_order; ?></a></li>
		<li><a href="<?php echo $applyforseller; ?>"><?php echo $text_applyforseller; ?></a></li>
		
		<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
		<?php if ($reward) { ?>
		<li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
		<?php } ?>
		<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
		<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
		<li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
	</ul>
</div>

<div class="frm-wrp">
	<h2 class="frm-hd"><?php echo $text_my_newsletter; ?></h2>
	<ul class="ul-list-1">
		<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
	</ul>
</div>

<?php 
	include $rgen_config->layout_bottom;
	include $rgen_config->msg_success;
	echo $footer;
?>