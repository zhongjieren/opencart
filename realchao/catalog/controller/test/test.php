<php?

<div class="field-box ng-isolate-scope ng-pristine ng-valid" label="Brands" pholder="Enter text to search" size="w-large" searchtype="brand" data-ng-model="sub_menu.sub_item.brands">
	<label class="ng-binding">
		Brands
		<div class="help-text ng-binding ng-hide" ng-show="lhelp"></div>
	</label>
	<div class="fields">
		<div class="typeahead-wrp">
			<div class="rgen-addon">
				<input type="text" class="form-field w-large" placeholder="Enter text to search" data-ng-model="typeaheadData" typeahead="item as item.name for item in getData(searchtype, $viewValue)" typeahead-loading="loadingLocations" typeahead-on-select="onSelect($item, $model, $label, searchtype)" aria-autocomplete="list" aria-expanded="false" aria-owns="typeahead-0CM-2355"><ul class="dropdown-menu ng-isolate-scope ng-hide" ng-show="isOpen()" ng-style="{top: position.top+'px', left: position.left+'px'}" style="display: block;;display: block;" role="listbox" aria-hidden="true" typeahead-popup="" id="typeahead-0CM-2355" matches="matches" active="activeIdx" select="select(activeIdx)" query="query" position="position">
    <!-- ngRepeat: match in matches track by $index -->
</ul>
					<span ng-show="loadingLocations" class="addon ng-hide" style="font-size: 20px;"><i class="glyphicon glyphicon-refresh"></i></span>
			</div>
			<!-- <i ng-show="loadingLocations" class="glyphicon glyphicon-refresh"></i> -->
			<div class="data-container w-large">
				<!-- ngRepeat: itemdata in dataSet -->
			</div>
		</div>
		
		<div class="help-text ng-binding ng-hide" ng-show="fhelp"></div>
	</div>
</div>
	    } 
}          		