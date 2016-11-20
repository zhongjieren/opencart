<?php 
$tbar = $rgen['topbar2_general']; 

/* Top bar links
------------------------*/
if ($tbar['cart_link']) { $tlinks[] = array( 'link' => $shopping_cart, 'name' => $text_shopping_cart ); }
if ($tbar['checkout_link']) { $tlinks[] = array( 'link' => $checkout, 'name' => $text_checkout ); }
if ($tbar['wishlist']) { $tlinks[] = array( 'link' => $wishlist, 'name' => $text_wishlist ); }
if ($tbar['customlinks']) {
	if(isset($tbar['customlink_data']) && sizeof($tbar['customlink_data']) > 0){
		foreach ($tbar['customlink_data'] as $key => $lnk) {
			$customlinks[] = array(
				'link' => $lnk['link'],
				'name' => isset($lnk['text'][$rgen['lng']]) ? $lnk['text'][$rgen['lng']] : 'No data'
			);
		} 
	} 
}
$logo_cls = $logo_in == 'n' ? ' logo-'.$tbar['logo_position'] : null;
?>
<div class="tbar2">
	<div class="<?php echo $topbar_w; ?>out-wrapper">
		<div class="upper-top">
			<div class="container">
				<div class="rw gt0">
					<div class="cl6 l">
						<?php if (isset($customlinks) && sizeof($customlinks) > 0) { ?>
						<ul class="list-unstyled top-links inline l-tlinks">
							<?php foreach ($customlinks as $link) { ?>
							<?php if (isset($link) && sizeof($link) > 0) { ?>
							<li><a href="<?php echo $link['link']; ?>"><?php echo $link['name']; ?></a></li>
							<?php } ?>
							<?php } ?>
						</ul>
						<?php } ?>
					</div>
					<div class="cl6 r">
						
						<div class="m-dd t-dd"><a><i class="fa fa-link"></i> <i class="caret"></i></a><div class="t-dd-menu"></div></div>
						
						<?php if (isset($tlinks) && is_array($tlinks) && sizeof($tlinks) > 0) { ?>
						<ul class="list-unstyled top-links inline r-tlinks">
							<?php foreach ($tlinks as $link) { ?>
							<?php if (isset($link) && sizeof($link) > 0) { ?>
							<li><a href="http://opencart.arenzhj.org/index.php?route=account/register">注册</a></li>
							<li><a href="http://opencart.arenzhj.org/index.php?route=account/login">登录</a></li>
							<li><a href="<?php echo $link['link']; ?>"><?php echo $link['name']; ?></a></li>
							<li><a href="http://opencart.arenzhj.org/index.php?route=account/login">我要出售</a></li>
							<?php } ?>
							<?php } ?>
						</ul>
						<?php } ?>

						<?php 
						// My account link
						if ($tbar['myaccount']) {
						$myaccount_icon = isset($tbar['myaccount_icon']) ? $tbar['myaccount_icon'] : 'fa fa-user'; ?>
						<div  class="t-dd">
							<a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="<?php echo $myaccount_icon; ?>"></i> <i class="caret"></i></a>
							<div class="t-dd-menu" title="<?php echo $text_account; ?>">
								<?php if ($logged) { ?>
								<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
								<a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
								<a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
								<a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
								<a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
								<?php } else { ?>
								<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
								<a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
						<?php if ($tbar['currency']) { ?><div class="t-dd"><?php echo $currency; ?></div><?php } ?>
						<?php if ($tbar['language']) { ?><div class="t-dd"><?php echo $language; ?></div><?php } ?>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-top">
			<div class="container<?php echo $logo_cls; ?>">
				<div class="tbar-row">
					<div class="tbar-cell l">
						<?php 
						/* Logo display left
						------------------------*/
						if ($logo_in == 'n' && $tbar['logo_position'] == 'l') { ?>
							<div id="logo" style="max-width: <?php echo $logo_w; ?>px;">
								<?php if ($logo) { ?>
								<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
								<?php } else { ?>
								<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
								<?php } ?>
							</div>	
						<?php } ?>
						
						<?php
						/* Logo display center
						------------------------*/
						if ($logo_in == 'n' && $tbar['logo_position'] == 'c') { ?>
						<ul class="tbar-tools">
							<?php if ($tbar['search']) { ?>
							<li class="top-search-wrp search-2"><?php echo $search; ?></li>
							<?php } ?>
						</ul>
						<?php } ?>
					</div>
					<div class="tbar-cell m">
						<?php
						/* Logo display center
						------------------------*/
						if ($logo_in == 'n' && $tbar['logo_position'] == 'c') { ?>
							<div id="logo">
								<?php if ($logo) { ?>
								<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
								<?php } else { ?>
								<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
								<?php } ?>
							</div>
						<?php } ?>
					</div>
					<div class="tbar-cell r">
						<ul class="tbar-tools">
							<?php if ($tbar['search'] && $tbar['logo_position'] == 'l' || $tbar['search'] && $logo_in == 'y') { ?>
							<li class="top-search-wrp search-2">
								<?php echo $search; ?>
							</li>
							<?php } ?>
							<?php if ($tbar['cart']) {  ?>
							<li class="top-other-wrp">
								<div class="cart-lg"><?php echo $cart; ?></div>
							</li>
							<?php } ?>
						</ul>
					</div>
				</div>
				<?php if ($tbar['search']) { ?><div class="m-search search-2"></div><?php } ?>
			</div>
		</div>
	</div>
</div>