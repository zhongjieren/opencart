(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenPrdbox1',['$modal', function($modal) {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_margin.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_prdbox1_alone', 'dir'):
				tpl('rgen_prdbox1', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				buttonlabel: '@',
				type: '@',
				config: '='
			},
			link: function(scope, element, attrs, ctrl) {
				ctrl.$render = function() {
					scope.ngModel = ctrl.$viewValue;
				};
				
				scope.open = function(newscope) {
					var modalInstance = $modal.open({
						templateUrl: tpl('rgen_prdbox1_modal', 'dir'),
						controller: "rgenPrdbox1Modal",
						size: 'lg',
						backdrop: 'static',
						resolve: {
							ngModel: function () {
								return scope.ngModel;
							},
							config: function () {
								return scope.config;
							}
						}
					});
					modalInstance.result.then(function (response) {
						ctrl.$setViewValue(response);
						scope.ngModel = response;
					}, function(err){
						console.log(err);
					});
				}
			}, 
			controller: function($scope, $modal){}
		};
	}]);

	angular.module('rgenDirectives').controller('rgenPrdbox1Modal', [
		'$scope', 
		'$modalInstance', 
		'Rest', 
		'Pop',
		'ngModel', 
		'config',
		function($scope, $modalInstance, Rest, Pop, ngModel, config){

		$scope.modaldata = {
			status:	true,
			type: 'grid',
			prd: {
				block: {
					normal: {},
					hover: {}
				},
				image: {
					normal: {},
					hover: {}
				},
				info_block: {},
				info_wrpper: {},
				info_name: {},
				info_name_hover: {},
				info_description: {},
				price_wrp: {},
				price_block: {},
				price_spl: {},
				price_new: {},
				price_old: {},
				price_tax: {},
				btn_wrp: {},
				cart_btn: {},
				quickview_btn: {},
				links: {
					wrp: {},
					normal: {},
					hover: {}
				}
				/*,
				wish_btn: {},
				compare_btn: {}*/
			},
			css_data: {
				block_normal: '',
				block_hover: '',
				image_normal: '',
				image_hover: '',
				info_block: '',
				info_wrpper: '',
				info_name: '',
				info_name_hover: '',
				info_description: '',
				price_wrp: '',
				price_block: '',
				price_spl: '',
				price_new: '',
				price_old: '',
				price_tax: '',
				btn_wrp: '',
				cart_btn_normal: '',
				cart_btn_hover: '',
				quickview_btn_normal: '',
				quickview_btn_hover: '',
				links_wrp: '',
				links_normal: '',
				links_hover: ''
				/*,
				wish_btn_normal: '',
				wish_btn_hover: '',
				compare_btn_normal: '',
				compare_btn_hover: ''*/
			}
		}
		$scope.config = {
			type: 'normal'
		}

		// Types
		/*$scope.prd_types = [
			{ label:'Grid view', val:'grid' },
			{ label:'List view', val:'list' },
			{ label:'Normal', val:'normal' }
		];*/

		// Align
		$scope.alignment = [
			{ label:'Left', val:'left' },
			{ label:'Center', val:'center' },
			{ label:'Right', val:'right' }
		];

		// Font size
		$scope.font_size = [];
		var sizerange = _.range(9, 101);
		_.map(sizerange, function(s){
			$scope.font_size.push({ val:s+'px', name: s+'px' });
		});

		$scope.config         = $.extend(true, $scope.config, config);
		$scope.modaldata      = $.extend(true, $scope.modaldata, ngModel);
		$scope.modaldata.type = $scope.config.type;
		
		$scope.apply = function () {
			
			var prd = $scope.modaldata.prd;

			$scope.modaldata.css_data.block_normal         = Rest.chk(prd.block.normal.css) ? prd.block.normal.css : '';
			$scope.modaldata.css_data.block_hover          = Rest.chk(prd.block.hover.css) ? prd.block.hover.css : '';
			
			$scope.modaldata.css_data.image_normal         = Rest.chk(prd.image.normal.css) ? prd.image.normal.css : '';
			$scope.modaldata.css_data.image_hover          = Rest.chk(prd.image.hover.css) ? prd.image.hover.css : '';
			
			$scope.modaldata.css_data.info_block           = Rest.chk(prd.info_block.css) ? prd.info_block.css : '';
			$scope.modaldata.css_data.info_wrpper          = Rest.chk(prd.info_wrpper.css) ? prd.info_wrpper.css : '';
			$scope.modaldata.css_data.info_name            = Rest.chk(prd.info_name.css) ? prd.info_name.css : '';
			$scope.modaldata.css_data.info_name_hover      = Rest.chk(prd.info_name_hover.css) ? prd.info_name_hover.css : '';
			$scope.modaldata.css_data.info_description     = Rest.chk(prd.info_description.css) ? prd.info_description.css : '';
			
			$scope.modaldata.css_data.price_wrp            = Rest.chk(prd.price_wrp.css) ? prd.price_wrp.css : '';
			$scope.modaldata.css_data.price_block          = Rest.chk(prd.price_block.css) ? prd.price_block.css : '';
			$scope.modaldata.css_data.price_spl            = Rest.chk(prd.price_spl.css) ? prd.price_spl.css : '';
			$scope.modaldata.css_data.price_new            = Rest.chk(prd.price_new.css) ? prd.price_new.css : '';
			$scope.modaldata.css_data.price_old            = Rest.chk(prd.price_old.css) ? prd.price_old.css : '';
			$scope.modaldata.css_data.price_tax            = Rest.chk(prd.price_tax.css) ? prd.price_tax.css : '';
			
			$scope.modaldata.css_data.btn_wrp              = Rest.chk(prd.btn_wrp.css) ? prd.btn_wrp.css : '';
			
			$scope.modaldata.css_data.cart_btn_normal      = Rest.chk(prd.cart_btn.css_normal) ? prd.cart_btn.css_normal : '';
			$scope.modaldata.css_data.cart_btn_hover       = Rest.chk(prd.cart_btn.css_hover) ? prd.cart_btn.css_hover : '';
			
			$scope.modaldata.css_data.quickview_btn_normal = Rest.chk(prd.quickview_btn.css_normal) ? prd.quickview_btn.css_normal : '';
			$scope.modaldata.css_data.quickview_btn_hover  = Rest.chk(prd.quickview_btn.css_hover) ? prd.quickview_btn.css_hover : '';
			
			$scope.modaldata.css_data.links_wrp            = Rest.chk(prd.links.wrp.css) ? prd.links.wrp.css : '';
			$scope.modaldata.css_data.links_normal         = Rest.chk(prd.links.normal.css) ? prd.links.normal.css : '';
			$scope.modaldata.css_data.links_hover          = Rest.chk(prd.links.hover.css) ? prd.links.hover.css : '';
			
			/*$scope.modaldata.css_data.wish_btn_normal    = Rest.chk(prd.wish_btn.normal_css) ? prd.wish_btn.normal_css : '';
			$scope.modaldata.css_data.wish_btn_hover     = Rest.chk(prd.wish_btn.hover_css) ? prd.wish_btn.hover_css : '';
			
			$scope.modaldata.css_data.compare_btn_normal = Rest.chk(prd.compare_btn.normal_css) ? prd.compare_btn.normal_css : '';
			$scope.modaldata.css_data.compare_btn_hover  = Rest.chk(prd.compare_btn.hover_css) ? prd.compare_btn.hover_css : '';*/

			$modalInstance.close($scope.modaldata);
		};
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	}])
	
})();

