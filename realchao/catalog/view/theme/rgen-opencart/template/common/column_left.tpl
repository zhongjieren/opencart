<?php 
$err_msg  = '<div style="font-family:arial; font-size:16px; line-height:2; color:#7c4a4a; padding:20px; background:#ffdbdb; border:1px solid #e06b6b; border-radius:5px; width:600px; margin:30px auto;">';
$err_msg .= 'Theme not installed properly. <br><ul>';
$err_msg .= '<li>Please install theme module <strong>R.Gen - OpenCart</strong> from<br><strong>Admin > Extensions > Modules</strong>.</li>';
$err_msg .= '<li>Than go to <strong>Extensions > Modifications</strong> and click on the<br><strong>Blue Refresh button (top right corner)</strong> to apply theme changes.';
$err_msg .= 'Theme will not work without Modifications changes.</li>';
$err_msg .= '</ul></div>';
if (!isset($rgen)) {
	echo $err_msg;
	exit();
}
if (null === $rgen->rgen_check || $rgen->rgen_check === false) {
	echo $err_msg;
	exit();
} ?>
<?php if ($modules) { ?>
<aside id="column-left" class="ly-column hidden-xs">
	<?php foreach ($modules as $module) { ?>
	<?php echo $module; ?>
	<?php } ?>
</aside>
<?php } ?>