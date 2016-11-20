<?php 
$rgen_config = $rgen;
$rgen   = $rgen_config->settings;
$mod    = $rgen['ocmd_featured'];
$modid  = 'oc-featured-'.$rgen_config->factory->uid();

?><div class="mod-wrp oc-featured" id="<?php echo $modid; ?>">
	<?php include $rgen_config->oc_bfsl; ?>
</div>