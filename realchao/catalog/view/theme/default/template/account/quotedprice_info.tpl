<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
            </tr>
          </tbody>
        </table>
      </div>
       
		<h3><?php echo $text_quotedpricehistory; ?></h3>
		<div class="table-responsive">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
			<input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">
			<input type="hidden" name="option_id" value="11">
			<table id="product_attribute" class="table table-bordered table-hover">
				<thead>
					<tr>
						<td class="text-left">产品类型</td>
						<td class="text-left">库存数量</td> 
						<td class="text-left">产品价格</td> 
						<td></td>
					</tr>
				</thead>
				<tbody>
				<?php $option_value_row = 0; ?>
				 <?php if (isset($product_option['product_option_value'])) { ?>
				 	
					<?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
					<tr id="option-value-row<?php echo $option_value_row; ?>">
						<td class="text-left">
						  <select name="product_option[product_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control">
								<?php if (isset($option_values[$product_option['option_id']])) { ?>
								<?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
								<?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
								<option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
								<?php } ?>
								<?php } ?>
								<?php } ?> 
							</select> 
							<input type="hidden" name="product_option[product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" />
						</td>
						<td class="text-right">
							<input type="text" name="product_option[product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" />
						</td>
						<td class="text-right">
							<input type="text" name="product_option[product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" />
						</td> 
						<td class="text-right">
							<button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();"  data-toggle="tooltip" title="-" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
						</td> 
					</tr>
					<?php $option_value_row++; ?>
					<?php } ?>
				<?php } ?>
				</tbody>
				 <tfoot>
					<tr>
					  <td colspan="3"></td>
					  <td class="text-right"><button type="button" onclick="addOptionValue();"  data-toggle="tooltip" title="+" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
					</tr>
				  </tfoot>
			</table>
			</form>
			<select id="option-valuesop" style="display: none;">
                <?php if (isset($option_values[$product_option['option_id']])) { ?>
                <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
             </select>
		</div>
	  
      <div class="buttons clearfix">
        <div class="pull-right">
        	<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
         
        	&nbsp;&nbsp;&nbsp;
        	<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

 <script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue() {
    html  = '<tr id="option-value-row' + option_value_row + '">';
	html += '  <td class="text-left">'
			+'<select name="product_option[product_option_value][' + option_value_row + '][option_value_id]" class="form-control"> '
			+$('#option-valuesop').html() 
			+' </select>'
			+'<input type="hidden" name="product_option[product_option_value][' + option_value_row + '][product_option_value_id]" value="" />' 
			+'  </td>';
	html += '  <td class="text-right">';
	html += '<input type="text" name="product_option[product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" />';
	html += '  </td>';
	html += '  <td class="text-right">';
	html += '<input type="text" name="product_option[product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" />';
	html += '  </td>'; 
	html += '  <td class="text-right">';
	 html += '  <button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();"  data-toggle="tooltip" title="-" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button> ';
	html += '  </td>';
    html += '</tr>';

	$('#product_attribute tbody').append(html);
	option_value_row++;
} 
//--></script>


<?php echo $footer; ?>