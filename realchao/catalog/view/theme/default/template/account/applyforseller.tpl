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
      <form action="<?php echo $applyforsellerurl; ?>" enctype="multipart/form-data" method="post" name="uploadfile">
      		<input type="hidden" name="apply_id" value="<?php echo $apply_id; ?>" />
      		<table class="table table-bordered table-hover">
      			<tr>
      				<td><?php echo $column_idcardphoto_front; ?></td>
      				<td><input type="file" name="idcardphoto_front[]" value="" multiple="multiple" /></td>
      			</tr>
      			<tr>
      				<td><?php echo $column_idcardphoto_back; ?></td>
      				<td><input type="file" name="idcardphoto_back[]" value="" multiple="multiple" /></td>
      			</tr> 
      		</table>
      		<div class="buttons clearfix">
		        <div class="pull-right">
		        	<a href="javascript:void(0);" data-type="save" class="btn btn-default"><?php echo $button_save; ?></a>
		        	&nbsp;&nbsp;
		        	<a href="javascript:void(0);"  data-type="submit" class="btn btn-primary"><?php echo $button_submit; ?></a>
		        </div>
		      </div>
      </form>
      </div>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>