<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>

<?php if ($recurrings) { ?>
<div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td class="text-right"><?php echo $column_order_recurring_id; ?></td>
				<td class="text-left"><?php echo $column_product; ?></td>
				<td class="text-left"><?php echo $column_status; ?></td>
				<td class="text-left"><?php echo $column_date_added; ?></td>
				<td class="text-right"></td>
			</tr>
		</thead>
		<tbody>
		<?php foreach ($recurrings as $recurring) { ?>
			<tr>
				<td class="text-right">#<?php echo $recurring['order_recurring_id']; ?></td>
				<td class="text-left"><?php echo $recurring['product']; ?></td>
				<td class="text-left"><?php echo $recurring['status']; ?></td>
				<td class="text-left"><?php echo $recurring['date_added']; ?></td>
				<td class="text-right"><a href="<?php echo $recurring['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
			</tr>
		<?php } ?>
		</tbody>
	</table>
</div>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>

<?php 
	include $rgen_config->layout_bottom;
	echo $footer;
?>
