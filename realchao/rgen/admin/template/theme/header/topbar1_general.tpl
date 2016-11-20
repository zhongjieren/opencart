<section class="rgen-panel">
	<h2 class="hd">Logo</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<rgen-radio radiodata="yn" label="Logo inline with menu" data-ng-model="themeData.logo.in_menu"></rgen-radio>
			<rgen-text ng-if="themeData.logo.in_menu == 'y'" fhelp="Value will apply in PX" label="Logo block width" size="w-mini" data-ng-model="themeData.logo.w"></rgen-text>
			<rgen-radio ng-if="themeData.logo.in_menu == 'n'" radiodata="positions" label="Logo position" data-ng-model="themeData.logo.position"></rgen-radio>
		</div>
	</div>
</section>


<section class="rgen-panel">
	<h2 class="hd">标题链接</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			<div class="field-box">
				<label>链接</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">购物车</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart_link"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">结账</label>
							<rgen-onoff type="alone" data-ng-model="themeData.checkout_link"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">收藏</label>
							<rgen-onoff type="alone" data-ng-model="themeData.wishlist"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
			<div class="field-box">
				<label>会员账号</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">状态</label>
							<rgen-onoff type="alone" data-ng-model="themeData.myaccount.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="themeData.myaccount.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">标题组件</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>购物车图标</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">状态</label>
							<rgen-onoff type="alone" data-ng-model="themeData.cart.status"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">Icon</label>
							<rgen-icons type="alone" buttonlabel="Edit" data-ng-model="themeData.cart.icon"></rgen-icons>
						</li>
					</ul>
				</div>
			</div>

			<div class="field-box">
				<label>组件</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">搜索框</label>
							<rgen-onoff type="alone" data-ng-model="themeData.search"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">货币</label>
							<rgen-onoff type="alone" data-ng-model="themeData.currency"></rgen-onoff>
						</li>
						<li>
							<label class="lbl">语言</label>
							<rgen-onoff type="alone" data-ng-model="themeData.language"></rgen-onoff>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="rgen-panel">
	<h2 class="hd">自定义链接</h2>
	<div class="panel-container">
		<div class="rgen-form-wrp form-full form-small">
			
			<div class="field-box">
				<label>自定义链接</label>
				<div class="fields">
					<ul class="form-row">
						<li>
							<label class="lbl">状态</label>
							<rgen-onoff type="alone" ng-click="customlinks_status()" data-ng-model="themeData.customlinks"></rgen-onoff>
						</li>
						<li ng-if="themeData.customlinks == true">
							<label class="lbl">Search box</label><br>
							<a class="rgen-btn mini" ng-click="addCustomlink()">添加链接</a>
						</li>
					</ul>
				</div>
			</div>

			<div ng-if="themeData.customlinks == true">
				<div ng-repeat="(key, value) in themeData.customlink_data">
					<h3 class="rgen-hd-1">
						自定义链接
						<a class="rgen-btn highlighted small remove" ng-click="removeCustomlink($index)"><i class="fa fa-times"></i></a>
					</h3>
					<div class="pos-rel">
						<rgen-langtext label="链接标题" size="w-large" data-ng-model="value.text"></rgen-langtext>
						<rgen-text label="URL" size="w-large" data-ng-model="value.link"></rgen-text>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
