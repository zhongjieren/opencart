<?php 
if (isset($modules)) {
$rgen_config = $rgen;
$rgen      = $rgen_config->settings;
$modid     = $module_name.'-'.$rgen_config->factory->uid();
$container = isset($settings['container']) && $settings['container'] == 'bx' || !isset($settings['container']) ? ' container' : null;

$l         = $modules['config']['left']['status'];
$r         = $modules['config']['right']['status'];
$t         = $modules['config']['top']['status'];
$b         = $modules['config']['bottom']['status'];

$col_l     = isset($modules['config']['left']['size']) && $l ? $modules['config']['left']['size'] : 0;
$col_r     = isset($modules['config']['right']['size']) && $r ? $modules['config']['right']['size'] : 0;
$col_m     = 12;
if ($l && !$r) { $col_m = 12-$col_l; }
if ($l && $r) { $col_l+$col_r < 12 ? $col_m = 12-($col_l+$col_r) : $col_m = 12-$col_l; }
if (!$l && $r) { $col_m = 12-$col_r; }

/* Normal view
------------------------*/
if (isset($modules['data'])) {
?>
<div id="<?php echo $modid; ?>" class="<?php echo $module_name . $module_class; ?>">
	<?php include $rgen_config->{'prdgroup_'.$settings['viewtype']}; ?>
</div>
<?php } } ?>