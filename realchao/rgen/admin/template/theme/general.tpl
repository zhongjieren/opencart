<h2 class="main-hd-dark sticky-true">
	常规设置（css调整/前端样式调整）
	<button class="rgen-btn large btn-in-hd mediumlight" ng-click="save()" type="submit">保存</button>
</h2>
<div class="pd20">
	<rgen-reset resetfn="reset('theme_general')" frmsize="resetsize" data-ng-model="themeData.status"></rgen-reset>
	
	<section class="rgen-panel">
		<h2 class="hd">主题布局设置</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<!-- <rgen-onoff label="Responsive status" data-ng-model="themeData.layout_settings.responsive_status"></rgen-onoff>
				<rgen-onoff label="Wide layout" data-ng-model="themeData.layout_settings.wide_status"></rgen-onoff> -->
				<rgen-radio radiodata="layout_width" label="布局宽度" data-ng-model="themeData.layout_settings.layout_width"></rgen-radio>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">网站整页</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>风格设置</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Body</label>
								<rgen-box type="alone" buttonlabel="Edit" data-ng-model="themeData.body.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">背景图片</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.body.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">页面容器</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>风格设置</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">页面</label>
								<rgen-box type="alone" config="{ fonts:0, margin:0 }" buttonlabel="Edit" data-ng-model="themeData.page_container.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">背景图片</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.page_container.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
				<div class="field-box">
					<label>
						边缘
						<div class="help-text">上 - 下</div>
					</label>
					<div class="fields">
						<input type="text" class="form-field inline w-tiny" data-ng-model="themeData.page_container.margin_t"> - 
						<input type="text" class="form-field inline w-tiny" data-ng-model="themeData.page_container.margin_b"> px
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">内容区域</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>风格设置</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.contentarea.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">背景图片</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.contentarea.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="rgen-panel">
		<h2 class="hd">内容区域设置</h2>
		<div class="panel-container">
			<div class="rgen-form-wrp form-full">
				<div class="field-box">
					<label>风格设置</label>
					<div class="fields">
						<ul class="form-row">
							<li>
								<label class="lbl">Block</label>
								<rgen-box type="alone" config="{ fonts:0 }" buttonlabel="Edit" data-ng-model="themeData.contentbox.block"></rgen-box>
							</li>
							<li>
								<label class="lbl">背景图片</label>
								<rgen-bgimage type="alone" buttonlabel="Edit" data-ng-model="themeData.contentbox.image"></rgen-bgimage>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
