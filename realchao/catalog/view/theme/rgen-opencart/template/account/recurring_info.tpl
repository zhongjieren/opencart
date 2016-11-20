<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>
<h3><?php echo $heading_title; ?></h3>
<table class="table table-bordered">
	<thead>
		<tr>
			<td class="text-left" colspan="2"><?php echo $text_recurring_detail; ?></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="text-left" style="width: 50%;">
				<p><b><?php echo $text_order_recurring_id; ?></b> #<?php echo $order_recurring_id; ?></p>
				<p><b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></p>
				<p><b><?php echo $text_status; ?></b> <?php echo $status; ?></p>
				<p><b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></p>
			</td>
            <td class="text-left" style="width: 50%; vertical-align: top;">
            	<p><b><?php echo $text_order_id; ?></b> <a href="<?php echo $order; ?>">#<?php echo $order_id; ?></a></p>
            	<p><b><?php echo $text_product; ?></b> <a href="<?php echo $product; ?>"><?php echo $product_name; ?></a></p>
            	<p><b><?php echo $text_quantity; ?></b> <?php echo $product_quantity; ?></p>
            </td>
		</tr>
	</tbody>
</table>
<table class="table table-bordered">
	<thead>
		<tr>
			<td class="text-left"><?php echo $text_recurring_description; ?></td>
			<td class="text-left"><?php echo $text_reference; ?></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="text-left" style="width: 50%;"><?php echo $recurring_description; ?></td>
            <td class="text-left" style="width: 50%;"><?php echo $reference; ?></td>
		</tr>
	</tbody>
</table>

<h3><?php echo $text_transactions; ?></h3>
<table class="table table-bordered">
	<thead>
		<tr>
			<td class="text-left"><?php echo $column_date_added; ?></td>
			<td class="text-center"><?php echo $column_type; ?></td>
			<td class="text-right"><?php echo $column_amount; ?></td>
		</tr>
	</thead>
	<tbody>
		<?php if ($transactions) { ?>
		<?php foreach ($transactions as $transaction) { ?>
		<tr>
			<td class="text-left"><?php echo $transaction['date_added']; ?></td>
			<td class="text-left"><?php echo $transaction['type']; ?></td>
			<td class="text-right"><?php echo $transaction['amount']; ?></td>
		</tr>
		<?php } ?><?php } else { ?>
		<tr>
			<td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<?php echo $recurring; ?>

<?php 
	include $rgen_config->layout_bottom;
	include $rgen_config->msg_error;
	echo $footer;
?>