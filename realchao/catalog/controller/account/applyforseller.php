<?php
//Apply for seller
class ControllerAccountApplyforseller extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/wishlist', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}
		$this->load->language('account/wishlist');
		$this->load->model('account/wishlist');
		
		$this->load->language('account/applyforseller');

		$this->load->model('account/applyforseller');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		$currCustomerApplyedforseller = $this->model_account_applyforseller->getCurrCustomerApplyedforseller();
		$data['saveorapplyurl'] = $currCustomerApplyedforseller;
		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/applyforseller')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		
		
		
		$data['column_idcardphoto_front'] = $this->language->get('column_idcardphoto_front');
		$data['column_idcardphoto_back'] = $this->language->get('column_idcardphoto_back');
		 
		$data['button_save'] = $this->language->get('button_save');
		$data['button_submit'] = $this->language->get('button_submit');
		
	 
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

// 		if(isset($currCustomerApplyedforseller['apply_id'])){
// 			$data['applyforsellerurl'] = $this->url->link('account/applyforseller/saveorapply', 'token=' . $this->session->data['token'] . '&directory=' . urlencode(utf8_strlen(DIR_IMAGE . 'catalog/customer/')) , true);
// 		}else{
			
// 		}
		$data['applyforsellerurl'] = $this->url->link('account/applyforseller/saveorapply', 'token=' . $this->session->data['token'] . '&directory=' . urlencode(utf8_strlen(DIR_IMAGE . 'catalog/customer/')) , true);
		
// 		$data['applyforsellerurl'] = $this->url->link('account/applyforseller/saveorapply', 'token=' . $this->session->data['token'] . '&directory=' . urlencode(utf8_strlen(DIR_IMAGE . 'catalog/customer/')) , true);
// 		$data['editapplyurl'] = $this->url->link('account/applyforseller/editapply', 'token=' . $this->session->data['token'] . '&directory=' . urlencode(utf8_strlen(DIR_IMAGE . 'catalog/customer/')), true);
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/applyforseller', $data));
	}
	
	//saveorapply
	public function saveorapply(){
		
		$json = array();
		$idcardphotoFrontjson = $this->upload("idcardphoto_front",$this->request);
		$idcardphotoBackjson = $this->upload("idcardphoto_back",$this->request);
		if(!$idcardphotoFrontjson['filename']!="" && !$idcardphotoBackjson['filename']!=""){
			$data['idcardphoto_front'] = $idcardphotoFrontjson['filename'];
			$data['idcardphoto_back'] = $idcardphotoBackjson['filename'];
				
			$this->model_account_applyforseller->addApplyforseller($data);
		}
		
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	} 
	
	//saveorapply
	public function editapply(){
	
		$json = array();
		$idcardphotoFrontjson = $this->upload("idcardphoto_front",$this->request);
		$idcardphotoBackjson = $this->upload("idcardphoto_back",$this->request);
		if(!$idcardphotoFrontjson['filename']!="" && !$idcardphotoFrontjson['filename']!=""){
			
			$this->model_account_applyforseller->editAddress($this->request->get['address_id'], $this->request->post);
		}
	
	
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	
	
	private function upload($fileType,$request){
		$this->load->language('common/filemanager');
		
		$json = array();
		
		// Check user has permission
		// 		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
		// 			$json['error'] = $this->language->get('error_permission');
		// 		}
		
		// Make sure we have the correct directory
		
		if (isset($request->get['directory'])) {
			$directory = rtrim(DIR_IMAGE . 'catalog/' . $request->get['directory'], '/');
		} else {
			$directory = DIR_IMAGE . 'catalog/customer/';
		}
		
		// Check its a directory
		if (!is_dir($directory) || substr(str_replace('\\', '/', realpath($directory)), 0, strlen(DIR_IMAGE . 'catalog')) != DIR_IMAGE . 'catalog') {
			$json['error'] = $this->language->get('error_directory');
		}
		
		if (!$json) {
			// Check if multiple files are uploaded or just one
			$files = array();
		
			if (!empty($request->files[$fileType]['name']) && is_array($request->files[$fileType]['name'])) {
				foreach (array_keys($request->files[$fileType]['name']) as $key) {
					$files[] = array(
							'name'     => $request->files[$fileType]['name'][$key],
							'type'     => $request->files[$fileType]['type'][$key],
							'tmp_name' => $request->files[$fileType]['tmp_name'][$key],
							'error'    => $request->files[$fileType]['error'][$key],
							'size'     => $request->files[$fileType]['size'][$key]
					);
				}
			}
		
			foreach ($files as $file) {
				if (is_file($file['tmp_name'])) {
					// Sanitize the filename
					$filename = basename(html_entity_decode($file['name'], ENT_QUOTES, 'UTF-8'));
					
					// Validate the filename length
					if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 255)) {
						$json['error'] = $this->language->get('error_filename');
					}
					
					// Allowed file extension types
					$allowed = array(
							'jpg',
							'jpeg',
							'gif',
							'png'
					);
		
					if (!in_array(utf8_strtolower(utf8_substr(strrchr($filename, '.'), 1)), $allowed)) {
						$json['error'] = $this->language->get('error_filetype');
					}
		
					// Allowed file mime types
					$allowed = array(
							'image/jpeg',
							'image/pjpeg',
							'image/png',
							'image/x-png',
							'image/gif'
					);
		
					if (!in_array($file['type'], $allowed)) {
						$json['error'] = $this->language->get('error_filetype');
					}
		
					// Return any upload error
					if ($file['error'] != UPLOAD_ERR_OK) {
						$json['error'] = $this->language->get('error_upload_' . $file['error']);
					}
				} else {
					$json['error'] = $this->language->get('error_upload');
				}
		
				if (!$json) {
					move_uploaded_file($file['tmp_name'], $directory . '/' . $filename);
				}
				$json['filename'] = $filename;
			}
		}
		
// 		if (!$json) {
// 			$json['success'] = $this->language->get('text_uploaded');
// 		}
		
		return $json;
	}
	
	
	
	
	
}
