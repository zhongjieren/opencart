<?php 
if(null !== $this->rgen('rgen_check') && $this->rgen('rgen_check') != false){
$rgen   = $this->rgen('settings');
$mod    = $rgen['ocmd_featured'];
$modid  = 'oc-featured-'.$this->rgen('factory')->uid();

?><div class="mod-wrp oc-featured" id="<?php echo $modid; ?>">
	<?php include $this->rgen('oc_bfsl'); ?>
</div>
<?php } ?>