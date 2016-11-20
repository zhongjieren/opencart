<?php include $this->rgen('layout_top'); ?>



<?php if ($products) { ?>
<table class="table table-bordered">
	<thead>
		<tr>
			<td colspan="<?php echo count($products) + 1; ?>"><strong><?php echo $text_product; ?></strong></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><?php echo $text_name; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><a href="<?php echo $product['href']; ?>"><strong><?php echo $product['name']; ?></strong></a></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_image; ?></td>
			<?php foreach ($products as $product) { ?>
			<td class="text-center"><?php if ($product['thumb']) { ?>
			<img src="<?php echo $product['thumb'];; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
			<?php } ?></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_price; ?></td>
			<?php foreach ($products as $product) { ?>
			<td>
				<?php if ($product['price']) { ?>
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-old"><?php echo $product['price']; ?> </span> <span class="price-new"> <?php echo $product['special']; ?> </span>
				<?php } ?>
				<?php } ?>
			</td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_model; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><?php echo $product['model']; ?></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_manufacturer; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><?php echo $product['manufacturer']; ?></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_availability; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><?php echo $product['availability']; ?></td>
			<?php } ?>
		</tr>
		<?php if ($review_status) { ?>
		<tr>
			<td><?php echo $text_rating; ?></td>
			<?php foreach ($products as $product) { ?>
				<td class="rating">
					<div class="review-stars">
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($product['rating'] < $i) { ?>
						<i class="fa fa-star-o"></i>
						<?php } else { ?>
						<i class="fa fa-star"></i>
						<?php } ?>
						<?php } ?>
					</div>
					<br />
					<?php echo $product['reviews']; ?>
				</td>
			<?php } ?>
		</tr>
		<?php } ?>
		<tr>
			<td><?php echo $text_summary; ?></td>
			<?php foreach ($products as $product) { ?>
			<td class="description"><?php echo $product['description']; ?></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_weight; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><?php echo $product['weight']; ?></td>
			<?php } ?>
		</tr>
		<tr>
			<td><?php echo $text_dimension; ?></td>
			<?php foreach ($products as $product) { ?>
			<td><?php echo $product['length']; ?> x <?php echo $product['width']; ?> x <?php echo $product['height']; ?></td>
			<?php } ?>
		</tr>
	</tbody>
	<?php foreach ($attribute_groups as $attribute_group) { ?>
	<thead>
		<tr>
			<td colspan="<?php echo count($products) + 1; ?>"><strong><?php echo $attribute_group['name']; ?></strong></td>
		</tr>
	</thead>
	<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
	<tbody>
		<tr>
			<td><?php echo $attribute['name']; ?></td>
			<?php foreach ($products as $product) { ?>
			<?php if (isset($product['attribute'][$key])) { ?>
			<td><?php echo $product['attribute'][$key]; ?></td>
			<?php } else { ?>
			<td></td>
			<?php } ?>
			<?php } ?>
		</tr>
	</tbody>
	<?php } ?>
	<?php } ?>
	<tr>
		<td></td>
		<?php foreach ($products as $product) { ?>
		<td>
			<input type="button" value="<?php echo $button_cart; ?>" class="default-btn btn-block" onclick="cart.add('<?php echo $product['product_id']; ?>','<?php echo $product['minimum']; ?>');" />
			<a href="<?php echo $product['remove']; ?>" class="primary-btn btn-block"><?php echo $button_remove; ?></a>
		</td>
		<?php } ?>
	</tr>
</table>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="default-btn"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>

<?php 
  include $this->rgen('layout_bottom');
  include $this->rgen('msg_success');
  echo $footer;
?>