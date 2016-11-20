<?php  
$tab_list = array();
if (isset($pdpg_tabs['modules']) && sizeof($pdpg_tabs['modules']) > 0) {
	foreach ($pdpg_tabs['modules'] as $key => $value) {
		$lng = $rgen_config->factory->node($value, 'lng', 0,0);
		$mod_tabs = $rgen_config->factory->node($value, 'modules/data', 0,0);
		if (is_array($mod_tabs) && sizeof($mod_tabs) > 0) {
			foreach ($mod_tabs as $tb) {
				$tab_list[] = $tb;	
			}	
		}
	}
}
?>