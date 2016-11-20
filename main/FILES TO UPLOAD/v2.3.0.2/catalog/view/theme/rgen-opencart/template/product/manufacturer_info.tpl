<?php
$rgen_config = $rgen;
include $rgen_config->layout_top;
$rgen   = $rgen_config->settings;
?>

<?php 
/* REFINE OPTIONS
**************************/
if ($products) { ?>
	<?php include $rgen_config->refine_tools; ?>

	<?php 
	/* PRODUCT GRIDS
	**************************/ ?>
	<div class="prd-container rw" data-gridview="<?php echo $rgen['brand_prd']['gridview']; ?>" data-listview="<?php echo $rgen['brand_prd']['listview']; ?>">
		<?php foreach ($products as $product) { ?>
		<div class="product-layout product-list cl">
			<?php include $rgen_config->{'prd'.$rgen['brand_prd']['prd_style']}; ?>
		</div>
		<?php } ?>
	</div>

	<div class="pagination-wrp">
		<div class="row">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>	
	</div>

<?php } else { ?>
	<p><?php echo $text_empty; ?></p>
	<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
	</div>
<?php } ?>

<?php 
	include $rgen_config->layout_bottom;
	echo $footer;
?>
