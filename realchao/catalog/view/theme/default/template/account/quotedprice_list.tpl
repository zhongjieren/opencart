<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		<h1><?php echo $heading_title; ?></h1>
		 <div class="row">
			<div class="col-sm-3">
			  <div class="form-group">
				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
			  </div> 
			</div> 
			<div class="col-sm-3"> 
				<div class="form-group">
					<label class="control-label" for="input-model"><?php echo $entry_model; ?></label>
					<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
				</div>
			</div> 
			<div class="col-sm-3"> 
				<div class="form-group">
					<label class="control-label" for="input-model">竞价成功</label>
					<select name="product_option" class="form-control">
						<option value="1">全部</option>
						<option value="2">成功</option>
					</select>
				</div>
			</div> 
			<div class="col-sm-3"> 
			  <button type="button" id="button-filter" class="btn btn-primary pull-right" style="margin-top:20px;"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
			</div>
		  </div>
      <?php if ($products) { ?> 
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
               <td class="text-center"><?php echo $column_image; ?></td>
               <td class="text-left"><?php echo $column_name; ?></td>
               <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_stock; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_action; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-center"><?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?></td>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['stock']; ?></td>
              <td class="text-right"><?php if ($product['price']) { ?>
                <div class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                  <?php } ?>
                </div>
                <?php } ?></td>
              <td class="text-right">
              	 <a href="<?php echo $product['href']; ?>" data-toggle="tooltip" title="<?php echo $button_quotedprice; ?>" class="btn btn-danger"><?php echo $button_quotedprice; ?></a>
          	 </td>
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
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
