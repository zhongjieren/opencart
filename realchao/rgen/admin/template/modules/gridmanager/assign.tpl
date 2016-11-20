<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">保存</button>
</div>
<div class="rgen-row gut-10">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<div class="pd5">
				<button class="rgen-btn mediumlight small btn-block" ng-click="create()">模组设置</button>
			</div>
			<ul class="list mr5-t" ng-show="modStorage">
				<li ng-repeat="(key, value) in modStorage | orderBy: 'name'" ng-class="{'active' : key == modId}"><a ng-click="getkey(key)">{{value.name}}</a><i class="fa fa-times del" ng-click="modRemove(key)"></i><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		<div ng-repeat="module in modConetnt.data">
			<div class="rgen-panel dark" tooltip="Module name">
				<input type="text" placeholder="Module name" ng-model="modConetnt.name" class="form-field w-full large h-c">
			</div>
			<section class="rgen-panel">
				<h2 class="hd">选中模组</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full">
						<rgen-onoff label="状态" data-ng-model="module.status"></rgen-onoff>
						<rgen-text label="排序顺序" pholder="Sort order" size="w-mini" data-ng-model="module.sort_order"></rgen-text>
						<rgen-select label="选择模组" selectdata="modList" size="w-large" data-ng-model="module.module_id"></rgen-select>

						<div class="field-box">
							<label>选择布局</label>
							<div class="fields">
								<span class="select inline w-large">
									<select data-ng-model="module.layout_id" data-ng-options="o.layout_id as o.name for o in layoutList" data-ng-change="layoutdata(module.layout_id)"></select>
								</span>
							</div>
						</div>
						<rgen-select label="选择位置" selectdata="positionList" size="w-large" data-ng-model="module.position"></rgen-select>
						<rgen-radio radiodata="layout_width" size="mini" label="屏幕宽度" data-ng-model="module.container"></rgen-radio>
					</div>
				</div>
			</section>
		</div>
		
	</div>
</div>