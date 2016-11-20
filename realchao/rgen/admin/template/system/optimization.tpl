<h2 class="main-hd-dark sticky-true">
	主题优化
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">保存</button>
</h2>
<div class="pd20">
	<section class="rgen-panel">
		<h2 class="hd">CSS / JS 压缩</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<div class="field-box">
					<label>CSS 压缩</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">状态</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization.cssminify"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">清除</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('css', 'n')">清除CSS文件</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="field-box">
					<label>JS 压缩</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">状态</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization.jsminify"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">Clear</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('js', 'n')">清除JS文件</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">模组数据缓存</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">

				<div class="field-box" ng-repeat="mod in modlist">
					<label>{{mod.name}}</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">状态</label>
								<rgen-onoff type="alone" data-ng-model="systemData.system_optimization[mod.code]"></rgen-onoff>
							</li>
							<li>
								<label class="lbl">清除</label><br>
								<a class="rgen-btn highlighted mini" ng-click="clear('module', mod.code)">清除缓存数据</a>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</section>


</div>
