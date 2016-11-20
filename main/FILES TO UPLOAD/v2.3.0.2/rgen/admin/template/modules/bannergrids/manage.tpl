<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">Save</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	Banner grids
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">Save</button>
</h2>
<!-- Inner layout -->
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">Create</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<!--
		Module name
		=========================-->
		<div class="rgen-panel dark" tooltip="Module name">
			<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
		</div>
		
		<div class="rgen-btn-group tab-group mr10-b h-c">
			<label ng-repeat="data in manage_tabs" class="rgen-btn" ng-model="manage_tab" btn-radio="data.val" ng-click="tabtype(data.val)">{{data.label}}</label>
		</div>
		<div ng-if="manage_tab == 'common'" ng-include="tpl.common"></div>
		<div ng-if="manage_tab == 'manage'" ng-include="tpl.manage"></div>

	</div>
</div>
