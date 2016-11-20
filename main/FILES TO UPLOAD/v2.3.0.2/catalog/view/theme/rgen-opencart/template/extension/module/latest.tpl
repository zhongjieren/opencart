<?php 
$rgen_config = $rgen;
$rgen   = $rgen_config->settings;
$mod    = $rgen['ocmd_latest'];
$modid  = 'oc-latest-'.$rgen_config->factory->uid();

?><div class="mod-wrp oc-latest" id="<?php echo $modid; ?>">
	<?php include $rgen_config->oc_bfsl; ?>
</div>