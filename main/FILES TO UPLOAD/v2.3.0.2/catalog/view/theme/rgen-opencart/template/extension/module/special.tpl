<?php 
$rgen_config = $rgen;
$rgen   = $rgen_config->settings;
$mod    = $rgen['ocmd_special'];
$modid  = 'oc-special-'.$rgen_config->factory->uid();

?><div class="mod-wrp oc-special" id="<?php echo $modid; ?>">
	<?php include $rgen_config->oc_bfsl; ?>
</div>
