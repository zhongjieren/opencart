<?php
class ModelExtensionPaymentAlipayWap extends Model {
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/alipay_wap');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('alipay_wap_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('alipay_wap_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('alipay_wap_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}
		
		//判断是否移动设备访问
		$this->load->helper('mobile');
		if (is_mobile()) {
			if (is_weixin()) {
				$status = false;
			}else{
				$status = true;
			}
		}else{
			$status = false;
		}

		$currencies = array(
			'CNY',
		);

		if (!in_array(strtoupper($this->session->data['currency']), $currencies)) {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'alipay_wap',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('alipay_wap_sort_order')
			);
		}

		return $method_data;
	}
}