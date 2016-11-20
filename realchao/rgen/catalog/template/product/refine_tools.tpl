<div class="refine-tools">
	<ul class="list-unstyled product-filter">
		<li class="sort">
			<label for="input-sort"><?php echo $text_sort; ?></label>
			<select id="input-sort" class="form-control" onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</li>
		<li class="limit">
			<label for="input-limit"><?php echo $text_limit; ?></label>
			<select id="input-limit" class="form-control" onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</li>
		<li class="display">
			<button type="button" class="vm" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="glyphicon glyphicon-th-large"></i></button>
		</li>
	</ul>

	<b class="hr"></b>
</div>