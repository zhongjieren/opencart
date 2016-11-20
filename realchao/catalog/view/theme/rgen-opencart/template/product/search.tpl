<?php
$rgen_config = $rgen;
include $rgen_config->layout_top;
$rgen   = $rgen_config->settings;
?>

<div class="frm-wrp form-horizontal">
	<legend class="frm-hd"><?php echo $entry_search; ?></legend>
	<div class="form-group required">
		<label class="col-sm-2 control-label" for="input-search"><h>请输入关键字或货号</h></label>
		<div class="col-sm-10">
			<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
		</div>
	</div>
	<div class="form-group required">
		<label class="col-sm-2 control-label"><h>请选择分类</h></label>
		<div class="col-sm-10">
			<select name="category_id" class="form-control">
				<option value="0"><?php echo $text_category; ?></option>
				<?php foreach ($categories as $category_1) { ?>
				<?php if ($category_1['category_id'] == $category_id) { ?>
				<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
				<?php } ?>
				<?php foreach ($category_1['children'] as $category_2) { ?>
				<?php if ($category_2['category_id'] == $category_id) { ?>
				<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
				<?php } ?>
				<?php foreach ($category_2['children'] as $category_3) { ?>
				<?php if ($category_3['category_id'] == $category_id) { ?>
				<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				<?php } ?>
			</select>
</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label"></label>
		<div class="col-sm-10">
			<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="default-btn" />
		</div>
	</div>
</div>


<?php if ($products) { ?>
	<?php include $rgen_config->refine_tools; ?>
	
	<?php 
	/* PRODUCT GRIDS
	**************************/ ?>
	<div class="prd-container rw" data-gridview="<?php echo $rgen['search_prd']['gridview']; ?>" data-listview="<?php echo $rgen['search_prd']['listview']; ?>">
		<?php foreach ($products as $product) { ?>
		<div class="product-layout product-list cl">
			<?php include $rgen_config->{'prd'.$rgen['search_prd']['prd_style']}; ?>
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
<?php } ?>

<?php include $rgen_config->layout_bottom; ?>

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>

<?php echo $footer; ?>