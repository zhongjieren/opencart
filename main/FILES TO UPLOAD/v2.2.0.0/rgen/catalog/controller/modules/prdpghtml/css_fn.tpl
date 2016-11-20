<?php 
function fn_prdpghtmls($arr, $prefix='') {
	echo isset($arr['main']) ? 
	$prefix.' { '. $arr['main'] . ' }' : '';

	echo isset($arr['mod_wrp']) ? 
	$prefix.' .mod-wrp { '. $arr['mod_wrp'] . ' }' : '';

	echo isset($arr['mod_content']) ? 
	$prefix.' .mod-content { '. $arr['mod_content'] . ' }' : '';

	echo isset($arr['mod_hd']) ? 
	$prefix.' .mod-hd { '. $arr['mod_hd'] . ' }' : '';

	/* Custom HTML
	------------------------*/
	echo isset($arr['t_html']) ? 
	$prefix.' .t-html { '. $arr['t_html'] . ' }' : '';

	echo isset($arr['b_html']) ? 
	$prefix.' .b-html { '. $arr['b_html'] . ' }' : '';
	
	echo isset($arr['l_html']) ? 
	$prefix.' .l-html { '. $arr['l_html'] . ' }' : '';

	echo isset($arr['m_html']) ? 
	$prefix.' .m-html { '. $arr['m_html'] . ' }' : '';
	
	echo isset($arr['r_html']) ? 
	$prefix.' .r-html { '. $arr['r_html'] . ' }' : '';

	/* Custom HTML grids
	------------------------*/
	echo isset($arr['rw']) ? 
	$prefix.' .mod-content > .rw { '. $arr['rw'] . ' }' : '';

	echo isset($arr['l_cl']) ? 
	$prefix.' .mod-content > .rw > .l-cl { '. $arr['l_cl'] . ' }' : '';

	echo isset($arr['m_cl']) ? 
	$prefix.' .mod-content > .rw > .m-cl { '. $arr['m_cl'] . ' }' : '';

	echo isset($arr['r_cl']) ? 
	$prefix.' .mod-content > .rw > .r-cl { '. $arr['r_cl'] . ' }' : '';
}
?>