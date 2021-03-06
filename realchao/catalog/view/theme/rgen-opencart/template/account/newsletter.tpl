<?php 
$rgen_config = $rgen;
include $rgen_config->layout_top; ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="frm-wrp">
		<fieldset>
			<legend class="frm-hd"><?php echo $heading_title; ?></legend>
			<div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_newsletter; ?></label>
				<div class="col-sm-10">
					<?php if ($newsletter) { ?>
					<label class="radio-inline">
					<input type="radio" name="newsletter" value="1" checked="checked" />
					<?php echo $text_yes; ?> </label>
					<label class="radio-inline">
					<input type="radio" name="newsletter" value="0" />
					<?php echo $text_no; ?></label>
					<?php } else { ?>
					<label class="radio-inline">
					<input type="radio" name="newsletter" value="1" />
					<?php echo $text_yes; ?> </label>
					<label class="radio-inline">
					<input type="radio" name="newsletter" value="0" checked="checked" />
					<?php echo $text_no; ?></label>
					<?php } ?>
				</div>
			</div>
		</fieldset>
	</div>
	<div class="buttons clearfix">
		<div class="pull-left"><a href="<?php echo $back; ?>" class="default-btn"><?php echo $button_back; ?></a></div>
		<div class="pull-right"><input type="submit" value="<?php echo $button_continue; ?>" class="primary-btn" /></div>
	</div>
</form>

<?php 
	include $rgen_config->layout_bottom;
	echo $footer;
?>