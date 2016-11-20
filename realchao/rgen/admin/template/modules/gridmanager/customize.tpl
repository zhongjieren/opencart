<div class="btn-holder">
	<button class="rgen-btn large mediumlight btn-tr" ng-click="save()" type="submit">保存</button>
</div>
<h2 class="main-hd-dark sticky-true" style="display: none; margin-left: -20px;">
	Grid manager
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">保存</button>
</h2>
<div ng-if="!module">
	<div class="alert alert-warning">No module available. <a ui-sref="mod_productgroups" class="dark rgen-btn mini">创建模组</a></div>
</div>
<div class="rgen-row gut-10" ng-if="module">
	<div class="rgen-col-3">
		<section class="rgen-panel">
			<h2 class="hd h-c">模组列表</h2>
			<ul class="list">
				<li ng-repeat="mod in modList | orderBy: 'name'" ng-class="{'active' : mod.val == modId}"><a ng-click="getkey(mod.val)">{{mod.name}}</a><i class="fa fa-caret-right crt"></i></li>
			</ul>
		</section>
	</div>
	<div class="rgen-col-9">
		
		<rgen-reset resetfn="reset('fullreset')" data-ng-model="themeData.status"></rgen-reset>
		
		<script type="text/ng-template" id="theme_data.html">
			<section class="rgen-panel">
				<h2 class="hd">General</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<div class="field-box">
							<label>Layout</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Main wrapper</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].main"></rgen-box>
									</li>
									<li>
										<label class="lbl">Main wrapper BG</label>
										<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData[manage_tab].main_bg"></rgen-bgimage>
									</li>
									<li>
										<label class="lbl">Container</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_wrp"></rgen-box>
									</li>
									<li>
										<label class="lbl">Content area</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_content"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<div class="field-box">
							<label>标题</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Common header</label>
										<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].mod_hd"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<div class="field-box">
							<label>Custom HTML</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">顶部</label>
										<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].t_html"></rgen-box>
									</li>
									<li>
										<label class="lbl">底部</label>
										<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].b_html"></rgen-box>
									</li>
									<li>
										<label class="lbl">左边</label>
										<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].l_html"></rgen-box>
									</li>
									<li>
										<label class="lbl">右边</label>
										<rgen-box type="alone" config="{align:1, f_size:1, color:1}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].r_html"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

						<div class="field-box">
							<label>Custom HTML row</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Row</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].rw"></rgen-box>
									</li>
									<li>
										<label class="lbl">Left</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].l_cl"></rgen-box>
									</li>
									<li>
										<label class="lbl">Middle</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].m_cl"></rgen-box>
									</li>
									<li>
										<label class="lbl">Right</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].r_cl"></rgen-box>
									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</section>

			<section class="rgen-panel">
				<h2 class="hd">Row settings</h2>
				<div class="panel-container">
					<div class="rgen-form-wrp form-full form-medium">
						<div class="field-box">
							<label>Rows</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Row</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.rw"></rgen-box>
									</li>
									<li>
										<label class="lbl">First row</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.first_rw"></rgen-box>
									</li>
									<li>
										<label class="lbl">Last row</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.last_rw"></rgen-box>
									</li>
								</ul>
							</div>
						</div>
						<div class="field-box">
							<label>Columns</label>
							<div class="fields">
								<ul class="form-row">
									<li>
										<label class="lbl">Column</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.cl"></rgen-box>
									</li>
									<li>
										<label class="lbl">First column</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.first_cl"></rgen-box>
									</li>
									<li>
										<label class="lbl">Last column</label>
										<rgen-box type="alone" config="{fonts:0}" buttonlabel="Edit" data-ng-model="themeData[manage_tab].outer_rw.last_cl"></rgen-box>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>

			
		</script>

		
		


		<div class="rgen-btn-group tab-group mr10-b h-c">
			<label ng-repeat="data in manage_tabs" class="rgen-btn" ng-model="manage_tab" btn-radio="data.val" ng-click="tabtype(data.val)"><span ng-bind-html="data.label"></span></label>
		</div>
		<section class="rgen-panel" ng-if="manage_tab != 'd'">
			<div class="panel-container">
				<div class="rgen-form-wrp form-full form-medium">
					<div class="field-box">
						<label>Status</label>
						<div class="fields">
							<rgen-onoff type="alone" data-ng-model="themeData[manage_tab].status" ng-click="checkStatus(manage_tab)"></rgen-onoff>
						</div>
					</div>
					<div class="field-box">
						<label>Copy settings from large screen section</label>
						<div class="fields">
							<a class="rgen-btn mini mediumlight" ng-click="copySettings(manage_tab, 'copy')">Copy now</a>
							<a class="rgen-btn mini highlighted" ng-click="copySettings(manage_tab, 'reset')">Reset to default</a>
							<div class="help-text">Custom font selection only apply from desktop settings</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		
		<div ng-if="manage_tab == 'd'" ng-include="'theme_data.html'"></div>
		<div ng-if="manage_tab == 't'" ng-include="'theme_data.html'"></div>
		<div ng-if="manage_tab == 'm'" ng-include="'theme_data.html'"></div>

	</div>
</div>