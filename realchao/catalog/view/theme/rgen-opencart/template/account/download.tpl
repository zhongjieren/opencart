<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>

<?php if ($downloads) { ?>
<div class="table-responsive">
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<td class="text-right"><?php echo $column_order_id; ?></td>
			<td class="text-left"><?php echo $column_name; ?></td>
			<td class="text-left"><?php echo $column_size; ?></td>
			<td class="text-left"><?php echo $column_date_added; ?></td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($downloads as $download) { ?>
		<tr>
			<td class="text-right"><?php echo $download['order_id']; ?></td>
			<td class="text-left"><?php echo $download['name']; ?></td>
			<td class="text-left"><?php echo $download['size']; ?></td>
			<td class="text-left"><?php echo $download['date_added']; ?></td>
			<td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn-xs primary-btn"><?php echo $button_download; ?></a></td>
		</tr>
		<?php } ?>
	</tbody>
</table>
</div>
<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
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