-- ------------------------------------
-- 
-- Module - customhtml
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%customhtml%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_customhtml', 'rgu2K', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":true,"size":9,"html":{"1":"<h2 class=\\"h2\\" style=\\"font-size: 35px; font-weight:300;\\">Check all features<\\/h2>\\n\\n<p style=\\"font-family: Roboto; font-weight: 300; color: rgba(255, 255, 255, 0.5); font-size:20px;\\">\\n\\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\\n\\n<\\/p>"}},"middle":{"status":false,"size":6,"html":[]},"right":{"status":true,"size":3,"html":{"1":"<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\" target=\\"_blank\\" class=\\"default-btn\\" style=\\"display:block;margin: 35px 0 0 0; font-size: 18px; font-weight: 300; padding: 15px;\\">More details<\\/a>"}}},"data":["No node"],"name":"Custom HTML 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%customhtml%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.customhtml', '{"family":"","subset":""}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%customhtml%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%customhtml%';

