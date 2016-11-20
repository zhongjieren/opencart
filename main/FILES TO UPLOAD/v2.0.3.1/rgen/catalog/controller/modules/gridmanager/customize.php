<?php
$gridmanager = $this->rgen->storage->get('modtheme_data', 'rgen_gridmanager');
if ($this->chk($gridmanager)) {
	foreach ($gridmanager as $k => $v) {
		if ($this->chk($v)) {
			$griditem = $v;

			if ($v['status']) {
				
				$screen_k = array('d', 't', 'm');
				foreach ($screen_k as $screen_v) {
					$data['gridmanager'][$k][$screen_v]['main']                = $factory->node($griditem, $screen_v.'/main', 1);
					$data['gridmanager'][$k][$screen_v]['main_bg']             = $this->cssimgpath($factory->node($griditem, $screen_v.'/main_bg', 1));
					$data['gridmanager'][$k][$screen_v]['mod_wrp']             = $factory->node($griditem, $screen_v.'/mod_wrp', 1);
					$data['gridmanager'][$k][$screen_v]['mod_content']         = $factory->node($griditem, $screen_v.'/mod_content', 1);
					$data['gridmanager'][$k][$screen_v]['mod_hd']              = $factory->node($griditem, $screen_v.'/mod_hd', 1);
					$data['gridmanager'][$k][$screen_v]['mod_sub_hd']          = $factory->node($griditem, $screen_v.'/mod_sub_hd', 1);
					
					$data['gridmanager'][$k][$screen_v]['t_html']              = $factory->node($griditem, $screen_v.'/t_html', 1);
					$data['gridmanager'][$k][$screen_v]['b_html']              = $factory->node($griditem, $screen_v.'/b_html', 1);
					$data['gridmanager'][$k][$screen_v]['l_html']              = $factory->node($griditem, $screen_v.'/l_html', 1);
					$data['gridmanager'][$k][$screen_v]['r_html']              = $factory->node($griditem, $screen_v.'/r_html', 1);
					
					$data['gridmanager'][$k][$screen_v]['rw']                  = $factory->node($griditem, $screen_v.'/rw', 1);
					$data['gridmanager'][$k][$screen_v]['l_cl']                = $factory->node($griditem, $screen_v.'/l_cl', 1);
					$data['gridmanager'][$k][$screen_v]['m_cl']                = $factory->node($griditem, $screen_v.'/m_cl', 1);
					$data['gridmanager'][$k][$screen_v]['r_cl']                = $factory->node($griditem, $screen_v.'/r_cl', 1);
					
					$data['gridmanager'][$k][$screen_v]['outer_rw']            = $factory->node($griditem, $screen_v.'/outer_rw/rw', 1);
					$data['gridmanager'][$k][$screen_v]['outer_rw_first']      = $factory->node($griditem, $screen_v.'/outer_rw/first_rw', 1);
					$data['gridmanager'][$k][$screen_v]['outer_rw_last']       = $factory->node($griditem, $screen_v.'/outer_rw/last_rw', 1);
					$data['gridmanager'][$k][$screen_v]['outer_rw_cl']         = $factory->node($griditem, $screen_v.'/outer_rw/cl', 1);
					$data['gridmanager'][$k][$screen_v]['outer_rw_cl_first']   = $factory->node($griditem, $screen_v.'/outer_rw/first_cl', 1);
					$data['gridmanager'][$k][$screen_v]['outer_rw_cl_last']    = $factory->node($griditem, $screen_v.'/outer_rw/last_cl', 1);

				}
			}
		}
	}
}