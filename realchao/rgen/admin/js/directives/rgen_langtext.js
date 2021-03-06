(function(){
	"use strict";
	
	angular.module('rgenDirectives').directive('rgenLangtext', function() {
		return {
			restrict: 'E',
			require: '?ngModel',
			replace: true,
			//templateUrl: '../rgen/admin/template/directive/rgen_langtext.tpl',
			templateUrl: function(el,attrs){
				return (angular.isDefined(attrs.type)) ? 
				tpl('rgen_langtext_alone', 'dir'):
				tpl('rgen_langtext', 'dir');
			},
			scope: {
				ngModel: '=',
				label: '@',
				lhelp: '@',
				fhelp: '@',
				pholder: '@',
				size: '@',
				defaultVal: '='
			},
			link: function(scope, element, attrs, ctrl) {
				scope.languages = rgen_config.language;
				
				scope.active = scope.languages[0].id;
				scope.lngtab = function(tab) {
					scope.active = tab;
				}

				scope.lngdata = {};
				$.each(scope.languages, function(index, val) {
					scope.lngdata[val.id] = scope.ngModel[val.id] ? scope.ngModel[val.id] : val.code+' - No data';
				});

				scope.ngModel = scope.lngdata;

				ctrl.$render = function() {
					if (ctrl.$viewValue) {
						scope.lngdata = ctrl.$viewValue;
					};
				};
			},
			controller: function($scope){
				
			}
		};
	});

	
})();

