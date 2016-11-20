<?php
class ControllerRgenContentslider extends Controller {
	public function index($setting) {
		
		$data         = array();
		$factory      = $this->rgen->factory;
		$rgenSettings = $this->rgen->rgenSettings->st_data;
		$module_key   = 'contentslider';

		require(FILE_CACHING);

		/* Get module data
		------------------------*/
		if ($rgenSettings['cache_'.$module_key] == false || $rgenSettings['cache_'.$module_key] && !file_exists($cache_file)) {

			if ($factory->node($setting, 'module_type', 0,0) == 'gridmanager') {
				$part = explode('.', $factory->node($setting, 'setting_key', 0,0));
			}else{
				$part = explode('.', $setting);	
			}

			if (isset($part)) {
				require(FILE_MODULE_COMMON);
				
				/* Construct module
				------------------------*/
				if (isset($module_data) && $this->chk($module_data)) {
					$data['modules'] = array();
					$data['modules']['config'] = $module_common;
					foreach ($module_data as $key => $value) {
						if ($value['status']) {
							$data['modules']['data'][] = array(
								'node_type' => $value['node_type'],
								'row'       => $value['item_data'],
								'columns'   => $this->columnData($value['items'])
							);
						}
					}
				}

				require(FILE_MODULE_RENDER);
				return $output;
			}
		} else {
			return $factory->render($cache_file);
		}
	}

	/* Block content functions
	------------------------*/
	private function columnData($arr)
	{
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {
					$tmp[] = array(
						'node_type'     => $value['node_type'],
						'col_size'      => $this->rgen->factory->node($value, 'item_data/column/classGroup', 0,0),
						
						'title_status'  => $this->rgen->factory->node($value, 'item_data/content_view/title/status', 0,0), 
						'title'         => $this->lngdata($this->rgen->factory->node($value, 'item_data/content_view/title/text', 0,0)), 
						'title_css'     => $this->rgen->factory->node($value, 'item_data/content_view/title/block', 1), 
						'cssclass'      => $this->rgen->factory->node($value, 'item_data/content_view/cssclass', 0,0), 
						
						'content_view'  => $this->rgen->factory->node($value, 'item_data/content_view', 0,0),
						'content_items' => $this->itemsData($value['items'])
					);
				}		
			}
		}
		return $tmp;
	}
	private function itemsData($arr)
	{
		$tmp = array();
		if (isset($arr) && sizeof($arr) > 0 && is_array($arr)) {
			foreach ($arr as $key => $value) {
				if ($value['status']) {

					$tmp[] = array(
						'node_type'   => $value['node_type'],
						'title_status'  => $this->rgen->factory->node($value, 'item_data/content/title_status', 0,0), 
						'description_status'  => $this->rgen->factory->node($value, 'item_data/content/description_status', 0,0), 
						
						'title'       => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/title', 0,0)),
						'description' => $this->lngdata($this->rgen->factory->node($value, 'item_data/content/description', 0,0))
					);
				}
			}
		}
		return $tmp;
	}


	/* Helper functions
	------------------------*/
	private function chk($val){
		return $this->rgen->factory->checkdata($val);
	}
	private function chkstr($val, $str){
		return $this->rgen->factory->checkstr($val, $str);
	}
	private function lngdata($val) {
		$lng = $this->rgen->storage->get('language', 'language');
		return $this->rgen->factory->lngdata($val, $lng);
	}

}