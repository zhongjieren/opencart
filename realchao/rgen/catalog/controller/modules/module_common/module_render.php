<?php 
// Generate caching file
$factory->caching($cache_file, $data, $tpl, $this->load);

$output = '';
$output = $this->load->view($tpl, $data);
/*if (file_exists(DIR_TEMPLATE . $tpl)) {
	$output = $this->load->view($tpl, $data);
}*/
?>