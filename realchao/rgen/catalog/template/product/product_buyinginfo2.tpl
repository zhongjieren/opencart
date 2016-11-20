<div class="buying-info2">
	<table>
		<tr>
			<?php 
			/* PRICE DATA
			**************************/
			if ($rgen['prdpg_price_status']) {
			if ($price) { ?>
			<td>
				<div class="price">
					<div>
						<?php 
						/* Price */
						if (!$special) { ?>
						<span class="price-new"><?php echo $price; ?></span>
						<?php } else { ?>
						<span class="price-old"><?php echo $price; ?></span>
						<span class="price-new price-spl"><?php echo $special; ?></span>
						<?php } ?>
						
						<?php 
						/* TAX */
						if ($rgen['prdpg_tax_status']) {
						if ($tax) { ?>
						<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
						<?php } } ?>				
					</div>
				</div>
			</td>
			<?php } } ?>
			<td>
				<?php 
				/* REIVEW
				**************************/ ?>
				<?php if ($rgen['prdpg_rating_status']) { ?>
				<?php if ($review_status) { ?>

					
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($rating < $i) { ?>
						
						<?php } else { ?>

						<?php } ?>
						<?php } ?>	
					</span>

				</div>
				<?php } ?>
				<?php } ?>

				<ul class="ul-reset item-info">
					<?php if ($manufacturer) { ?>
					<li><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
					<?php } ?>
					<li><span><?php echo $text_model; ?></span> <?php echo $model; ?></li>
					<?php if ($reward) { ?>
					
					<?php } ?>
					
				</ul>
			</td>
		</tr>
	</table>
	<?php 
	if ($rgen['prdpg_price_status']) {
	if ($points || $discounts) { ?>
	<div class="">
		<?php 
		/* Points */
		if ($points) { ?>

		<?php } ?>

		<?php
		/* Discount */
		if ($discounts) { ?>
		<div class="discount">
		<?php foreach ($discounts as $discount) { ?>
		<?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?><span>, </span>
		<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php } } ?>
</div>

<?php 
/* PLACE - BELOW INFORMATION
**************************/ ?>
<?php echo isset($pdpg_binfo) ? $pdpg_binfo : null; ?>