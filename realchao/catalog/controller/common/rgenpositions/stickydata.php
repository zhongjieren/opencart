<?php
class ControllerCommonRgenpositionsStickydata extends Controller {
	public function index() {

		/* CONFIG
		=========================*/
		$position_name = 'stickydata';
		$position_key  = 'stickydata';
		$data['pos_name'] = $position_name;

		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');
			
			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');
			
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');
			
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$this->load->model('extension/module');

		$data['modules'] = array();

		$modules = $this->model_design_layout->getLayoutModules($layout_id, $position_key);
		$modules = array_merge($modules, $this->model_design_layout->getLayoutModules(9999, $position_key));

		foreach ($modules as $module) {
			$part = explode('.', $module['code']);

			/* rgen modification */
			if($this->registry->get('config')->get('theme_default_directory') == DIR_THEME && $this->registry->get('rgen_check') != false){
				$rgen = explode('_', $part[0]);
				if (isset($rgen) && sizeof($rgen) > 0) {
					if ($rgen[0] == 'rgen' && isset($part[2])) {
						if (isset($part[0]) && $this->config->get($part[0] . '_R.' . $part[1] . '.' . $part[2])) {
							$setting_info = $module['code'];
							$data['modules'][] = $this->load->controller('rgen/' . $rgen[1], $setting_info);
						}
					}
				}
				
				if (isset($part[0])) {
					$tmp[] = $part[0];
					$this->rgen->rgenSettings->setSettings($module['position'], $tmp);
					$this->rgen->rgenSettings->setSettings('current_pos', $module['position']);
				}
			}
			//-------------------

			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$module_data = $this->load->controller('module/' . $part[0]);

				if ($module_data) {
					$data['modules'][] = $module_data;
				}
			}

			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);

				if ($setting_info && $setting_info['status']) {
					$module_data = $this->load->controller('module/' . $part[0], $setting_info);

					if ($module_data) {
						$data['modules'][] = $module_data;
					}
				}
			}
		}

		return $this->load->view('common/rgenpositions/place_'.$position_name, $data);
	}
}
