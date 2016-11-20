<?php 
$rgen_config = $rgen;
$rgen   = $rgen_config->settings;
$mod    = $rgen['ocmd_best'];
$modid  = 'oc-best-'.$rgen_config->factory->uid();

?><div class="mod-wrp oc-best" id="<?php echo $modid; ?>">
	<?php include $rgen_config->oc_bfsl; ?>
</div>
