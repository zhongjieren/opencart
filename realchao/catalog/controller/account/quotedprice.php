<?php
class ControllerAccountQuotedprice extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/quotedprice', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/quotedprice');
		
		$this->load->model('account/wishlist');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$url = '';
		if (isset($this->request->get['filter_name'])) {
		    $filter_name = $this->request->get['filter_name'];
		} else {
		    $filter_name = null;
		}
		
		if (isset($this->request->get['filter_model'])) {
		    $filter_model = $this->request->get['filter_model'];
		} else {
		    $filter_model = null;
		}
		
		if (isset($this->request->get['filter_price'])) {
		    $filter_price = $this->request->get['filter_price'];
		} else {
		    $filter_price = null;
		}
		
		if (isset($this->request->get['filter_quantity'])) {
		    $filter_quantity = $this->request->get['filter_quantity'];
		} else {
		    $filter_quantity = null;
		}
		
		if (isset($this->request->get['filter_status'])) {
		    $filter_status = $this->request->get['filter_status'];
		} else {
		    $filter_status = null;
		}
		
		if (isset($this->request->get['filter_image'])) {
		    $filter_image = $this->request->get['filter_image'];
		} else {
		    $filter_image = null;
		}
		if (isset($this->request->get['page'])) {
		    $page = $this->request->get['page'];
		} else {
		    $page = 1;
		}
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
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
			'href' => $this->url->link('account/quotedprice', $url, true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		
		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_stock'] = $this->language->get('column_stock');
		$data['column_price'] = $this->language->get('column_price');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_price'] = $this->language->get('entry_price');
			
		
		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_filter'] = $this->language->get('button_filter');
		
		$data['button_quotedprice'] = $this->language->get('button_quotedprice');
		
		
		$data['products'] = array();
		
		$filter_data = array(
// 		    'filter_name'	  => $filter_name,
// 		    'filter_model'	  => $filter_model,
// 		    'filter_price'	  => $filter_price,
// 		    'filter_quantity' => $filter_quantity,
// 		    'filter_status'   => $filter_status,
// 		    'filter_image'    => $filter_image,
// 		    'sort'            => $sort,
// 		    'order'           => $order,
		    'start'           => ($page - 1) * 10,
		    'limit'           => 10
		);
		$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
		
		$results = $this->model_catalog_product->getProducts($filter_data);
		
		foreach ($results as $product_info) {
		    if (is_file(DIR_IMAGE . $product_info['image'])) {
		        $image = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_wishlist_width'), $this->config->get($this->config->get('config_theme') . '_image_wishlist_height'));
		    } else {
		        $image = $this->model_tool_image->resize('no_image.png', 40, 40);
		    }
		    if ($product_info['quantity'] <= 0) {
	            $stock = $product_info['stock_status'];
	        } elseif ($this->config->get('config_stock_display')) {
	            $stock = $product_info['quantity'];
	        } else {
	            $stock = $this->language->get('text_instock');
	        }

	        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
	            $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
	        } else {
	            $price = false;
	        }

	        if ((float)$product_info['special']) {
	            $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
	        } else {
	            $special = false;
	        }

	        $data['products'][] = array(
	            'product_id' => $product_info['product_id'],
	            'thumb'      => $image,
	            'name'       => $product_info['name'],
	            'model'      => $product_info['model'],
	            'stock'      => $stock,
	            'price'      => $price,
	            'special'    => $special,
	            'href'       => $this->url->link('account/quotedprice/quotedprice', 'product_id=' . $product_info['product_id']),
	        );
		}
		 
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('account/quotedprice', 'page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($product_total - 10)) ? $product_total : ((($page - 1) * 10) + 10), $product_total, ceil($product_total / 10));

		
		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');
		
		$data['filter_name'] = $filter_name;
		$data['filter_model'] = $filter_model;
		$data['filter_price'] = $filter_price;
		$data['filter_quantity'] = $filter_quantity;
		$data['filter_status'] = $filter_status;
		$data['filter_image'] = $filter_image;
		
// 		$this->response->setOutput($this->load->view('account/wishlist', $data));
		$this->response->setOutput($this->load->view('account/quotedprice_list', $data));
	}

	public function info() {
		$this->load->language('account/order');

		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/order/info', 'order_id=' . $order_id, true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->model('account/order');

		$order_info = $this->model_account_order->getOrder($order_id);

		if ($order_info) {
			$this->document->setTitle($this->language->get('text_order'));

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

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
				'href' => $this->url->link('account/order', $url, true)
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_order'),
				'href' => $this->url->link('account/order/info', 'order_id=' . $this->request->get['order_id'] . $url, true)
			);

			$data['heading_title'] = $this->language->get('text_order');

			$data['text_order_detail'] = $this->language->get('text_order_detail');
			$data['text_invoice_no'] = $this->language->get('text_invoice_no');
			$data['text_order_id'] = $this->language->get('text_order_id');
			$data['text_date_added'] = $this->language->get('text_date_added');
			$data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$data['text_shipping_address'] = $this->language->get('text_shipping_address');
			$data['text_payment_method'] = $this->language->get('text_payment_method');
			$data['text_payment_address'] = $this->language->get('text_payment_address');
			$data['text_history'] = $this->language->get('text_history');
			$data['text_comment'] = $this->language->get('text_comment');
			$data['text_no_results'] = $this->language->get('text_no_results');
            
			$data['entry_quantity'] = $this->language->get('entry_quantity');
			$data['entry_price'] = $this->language->get('entry_price');
			
			
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_date_added'] = $this->language->get('column_date_added');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_comment'] = $this->language->get('column_comment');

			$data['button_reorder'] = $this->language->get('button_reorder');
			$data['button_return'] = $this->language->get('button_return');
			$data['button_continue'] = $this->language->get('button_continue');

			if (isset($this->session->data['error'])) {
				$data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			if ($order_info['invoice_no']) {
				$data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
			} else {
				$data['invoice_no'] = '';
			}

			$data['order_id'] = $this->request->get['order_id'];
			$data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));

			if ($order_info['payment_address_format']) {
				$format = $order_info['payment_address_format'];
			} else {
				$format = '{fullname}' . "\n" . '{company}' . "\n" . '{address}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}

			$find = array(
				'{fullname}',
				'{company}',
				'{address}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
			);

			$replace = array(
				'fullname' => $order_info['payment_fullname'],
				'company'   => $order_info['payment_company'],
				'address' => $order_info['payment_address'],
				'city'      => $order_info['payment_city'],
				'postcode'  => $order_info['payment_postcode'],
				'zone'      => $order_info['payment_zone'],
				'zone_code' => $order_info['payment_zone_code'],
				'country'   => $order_info['payment_country']
			);

			$data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

			$data['payment_method'] = $order_info['payment_method'];

			if ($order_info['shipping_address_format']) {
				$format = $order_info['shipping_address_format'];
			} else {
				$format = '{fullname}' . "\n" . '{company}' . "\n" . '{address}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
			}

			$find = array(
				'{fullname}',
				'{company}',
				'{address}',
				'{city}',
				'{postcode}',
				'{zone}',
				'{zone_code}',
				'{country}'
			);

			$replace = array(
				'fullname' => $order_info['shipping_fullname'],
				'company'   => $order_info['shipping_company'],
				'address' => $order_info['shipping_address'],
				'city'      => $order_info['shipping_city'],
				'postcode'  => $order_info['shipping_postcode'],
				'zone'      => $order_info['shipping_zone'],
				'zone_code' => $order_info['shipping_zone_code'],
				'country'   => $order_info['shipping_country']
			);

			$data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

			$data['shipping_method'] = $order_info['shipping_method'];

			$this->load->model('catalog/product');
			$this->load->model('tool/upload');

			// Products
			$data['products'] = array();

			$products = $this->model_account_order->getOrderProducts($this->request->get['order_id']);

			foreach ($products as $product) {
				$option_data = array();

				$options = $this->model_account_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);

				foreach ($options as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

				$product_info = $this->model_catalog_product->getProduct($product['product_id']);

				if ($product_info) {
					$reorder = $this->url->link('account/order/reorder', 'order_id=' . $order_id . '&order_product_id=' . $product['order_product_id'], true);
				} else {
					$reorder = '';
				}

				$data['products'][] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'option'   => $option_data,
					'quantity' => $product['quantity'],
					'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
					'reorder'  => $reorder,
					'return'   => $this->url->link('account/return/add', 'order_id=' . $order_info['order_id'] . '&product_id=' . $product['product_id'], true)
				);
			}

			// Voucher
			$data['vouchers'] = array();

			$vouchers = $this->model_account_order->getOrderVouchers($this->request->get['order_id']);

			foreach ($vouchers as $voucher) {
				$data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
				);
			}

			// Totals
			$data['totals'] = array();

			$totals = $this->model_account_order->getOrderTotals($this->request->get['order_id']);

			foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
				);
			}

			$data['comment'] = nl2br($order_info['comment']);

			// History
			$data['histories'] = array();

			$results = $this->model_account_order->getOrderHistories($this->request->get['order_id']);

			foreach ($results as $result) {
				$data['histories'][] = array(
					'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'status'     => $result['status'],
					'comment'    => $result['notify'] ? nl2br($result['comment']) : ''
				);
			}

			$data['continue'] = $this->url->link('account/order', '', true);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('account/order_info', $data));
		} else {
			$this->document->setTitle($this->language->get('text_order'));

			$data['heading_title'] = $this->language->get('text_order');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

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
				'href' => $this->url->link('account/order', '', true)
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_order'),
				'href' => $this->url->link('account/order/info', 'order_id=' . $order_id, true)
			);

			$data['continue'] = $this->url->link('account/order', '', true);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
    
	//
	public function quotedprice() {
	    $this->load->language('account/quotedprice');
	    
    	if (isset($this->request->get['product_id'])) {
        	$product_id = (int)$this->request->get['product_id'];
        } else {
        	$product_id = 0;
        }
        
	    if (!$this->customer->isLogged()) {
	        $this->session->data['redirect'] = $this->url->link('account/quotedprice/quotedprice', 'product_id=' . $product_id, true);
	
	        $this->response->redirect($this->url->link('account/login', '', true));
	    }
	
	    $this->document->setTitle($this->language->get('text_order'));

        $url = '';
        if (isset($this->request->get['product_id'])) {
            $data['action'] = $this->url->link('account/quotedprice/edit','product_id=' . $this->request->get['product_id'] . $url, true);
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

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
            'href' => $this->url->link('account/quotedprice', $url, true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_productinfo'),
            'href' => $this->url->link('account/quotedprice/quotedprice', 'product_id=' . $this->request->get['product_id'] . $url, true)
        );

        $data['heading_title'] = $this->language->get('text_productinfo');
       

        $data['button_save'] = $this->language->get('button_save');
        $data['text_order_detail'] = $this->language->get('text_order_detail');
        $data['text_invoice_no'] = $this->language->get('text_invoice_no');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_date_added'] = $this->language->get('text_date_added');
        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_shipping_address'] = $this->language->get('text_shipping_address');
        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_payment_address'] = $this->language->get('text_payment_address');
        $data['text_history'] = $this->language->get('text_history');
        //
        $data['text_quotedpricehistory'] = $this->language->get('text_quotedpricehistory');
        
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_price'] = $this->language->get('entry_price');
        	
        $data['text_comment'] = $this->language->get('text_comment');
        $data['text_no_results'] = $this->language->get('text_no_results');
        
        $data['column_name'] = $this->language->get('column_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_total'] = $this->language->get('column_total');
        $data['column_action'] = $this->language->get('column_action');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_comment'] = $this->language->get('column_comment');

        $data['button_reorder'] = $this->language->get('button_reorder');
        $data['button_return'] = $this->language->get('button_return');
        $data['button_continue'] = $this->language->get('button_continue');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
 


       
        $this->load->model('tool/upload');

        // Products
        $this->load->model('catalog/product');
        $quoteprice_option_id = 11;
        $this->model_catalog_product->addProductQuotepriceOption($product_id,$quoteprice_option_id);
        $product_info = $this->model_catalog_product->getProduct($product_id);
        
        $data['product'] = array(
            'product_id'     => $product_id,
            'name'     => $product_info['name'],
            'model'    => $product_info['model'],
            'quantity' => $product_info['quantity'],
            'price'    => $product_info['price'],
            'return'   => ""
        );
        // Options
        $this->load->model('catalog/option');
       
        if (isset($this->request->get['product_id'])) {
            $product_option = $this->model_catalog_product->getProductOptionsByOptionId($this->request->get['product_id'],$quoteprice_option_id);
        } else {
            $product_option = array();
        }
        $data['product_option'] = array();
        if(isset($product_option['product_option_id'])){
            $product_option_value_data = array();
        
            if (isset($product_option['product_option_value'])) {
                foreach ($product_option['product_option_value'] as $product_option_value) {
                    $product_option_value_data[] = array(
                        'product_option_value_id' => $product_option_value['product_option_value_id'],
                        'option_value_id'         => $product_option_value['option_value_id'],
                        'quantity'                => $product_option_value['quantity'],
                        'subtract'                => $product_option_value['subtract'],
                        'price'                   => $product_option_value['price']
//                         'price_prefix'            => $product_option_value['price_prefix'],
//                         'points'                  => $product_option_value['points'],
//                         'points_prefix'           => $product_option_value['points_prefix'],
//                         'weight'                  => $product_option_value['weight'],
//                         'weight_prefix'           => $product_option_value['weight_prefix']
                    );
                }
            }
//             var_dump($product_option);
//             var_dump($product_option[0]['product_option_id']);
//             die;
            
            $data['product_option'] = array(
                'product_option_id'    => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id'            => $product_option['option_id'],
                'name'                 => $product_option['name'],
                'type'                 => $product_option['type'],
                'value'                => isset($product_option['value']) ? $product_option['value'] : '',
                'required'             => $product_option['required']
            );
        }
        
        $data['option_values'] = array();
        $data['option_values'][$quoteprice_option_id] = $this->model_catalog_option->getOptionValues($quoteprice_option_id);
//         if(isset($product_option) && isset($product_option['type'] ) && $product_option['type'] == 'select'){
//             if (!isset($data['option_values'][$product_option['option_id']])) {
//                 $data['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
//             }
//         }
        
        $data['histories'][] = array(
            'name'     => $product_info['name'],
            'model'    => $product_info['model'],
            'quantity' => $product_info['quantity'],
            'price'    => $product_info['price'],
            'return'   => ""
        );
        $data['continue'] = $this->url->link('account/quotedprice', '', true);

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('account/quotedprice_info', $data));
	}
	
	public function edit() {
	    $this->load->language('catalog/product');
	    
	    $this->document->setTitle($this->language->get('heading_title'));
	    
	    $this->load->model('catalog/product');
	    
	    if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
// 	        var_dump( $this->request->post);
// 	        die;
	        $this->model_catalog_product->editProductQuotepriceOption($this->request->get['product_id'], $this->request->post);
	    
	        $this->session->data['success'] = $this->language->get('text_success');
	    
	        $url = '';
	    
	        if (isset($this->request->get['filter_name'])) {
	            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
	        }
	    
	        if (isset($this->request->get['filter_model'])) {
	            $url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
	        }
	    
	        if (isset($this->request->get['filter_price'])) {
	            $url .= '&filter_price=' . $this->request->get['filter_price'];
	        }
	    
	        if (isset($this->request->get['filter_quantity'])) {
	            $url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
	        }
	    
	        if (isset($this->request->get['filter_status'])) {
	            $url .= '&filter_status=' . $this->request->get['filter_status'];
	        }
	    
	        if (isset($this->request->get['sort'])) {
	            $url .= '&sort=' . $this->request->get['sort'];
	        }
	    
	        if (isset($this->request->get['order'])) {
	            $url .= '&order=' . $this->request->get['order'];
	        }
	    
	        if (isset($this->request->get['page'])) {
	            $url .= '&page=' . $this->request->get['page'];
	        }
	    
	        $this->response->redirect($this->url->link('account/quotedprice/index', $url, true));
	    }
	     
	}
}