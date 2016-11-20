<?php
class ModelFaqCategory extends Model {
	public function getFaqCategory($faq_category_id) {
		
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "faq_category c LEFT JOIN " . DB_PREFIX . "faq_category_description cd ON (c.faq_category_id = cd.faq_category_id) LEFT JOIN " . DB_PREFIX . "faq_category_to_store c2s ON (c.faq_category_id = c2s.faq_category_id) WHERE c.faq_category_id = '" . (int)$faq_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}
	
	public function getFaqCategories($parent_id = 0) {
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_category c LEFT JOIN " . DB_PREFIX . "faq_category_description cd ON (c.faq_category_id = cd.faq_category_id) LEFT JOIN " . DB_PREFIX . "faq_category_to_store c2s ON (c.faq_category_id = c2s.faq_category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}

	

}
