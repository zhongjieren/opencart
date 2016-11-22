<?php
class ModelAccountApplyforseller extends Model {
	
	public function addApplyforseller($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "applyforseller SET customer_id = '" . (int)$this->customer->getId() . "', idcardphoto_front = '" . $this->db->escape($data['idcardphoto_front']) . "', idcardphoto_back = '" . $this->db->escape($data['idcardphoto_back']) . "'");
		$apply_id = $this->db->getLastId();
		return $apply_id;
	}
	
	public function editApplyforseller($address_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "applyforseller SET idcardphoto_front = '" . $this->db->escape($data['idcardphoto_front']) . "' WHERE  customer_id = '" . (int)$this->customer->getId() . "'");
	
		if (!empty($data['default'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}
	
	}
	
	public function isCurrCustomerApplyedforseller($customer_id) {
		$applyedNum = $this->getTotalNumOfApplyedforseller();
		if(isset($applyedNum) && $applyedNum>0){
			return true;
		} else{
			return false;
		}
	}
	
	public function getCurrCustomerApplyedforseller() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "applyforseller WHERE customer_id = '" .  (int)$this->customer->getId() . "'");
		return $query->row;
	}
	
	public function getTotalNumOfApplyedforseller() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "applyforseller WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	
		return $query->row['total'];
	}
}
