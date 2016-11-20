-- ------------------------------------
-- 
-- Module - basicslideshow
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%basicslideshow%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgyWB', '{"data":[{"module_id":"rgNUo","layout_id":"3","position":"content_top","status":true,"sort_order":0,"w":"940","h":"350","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Inner page slider"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgNUo', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"random","speed":"1000","pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-1.jpg","url":"","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/Innerpage-slideshow-withcol\\/withcol-940x350-2.jpg","url":"","win":true}}],"name":"Inner page slider"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgN0C', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"random","speed":"1000","pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/banners\\/other-banners\\/376x510_1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/banners\\/other-banners\\/376x510_2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Home - Featured banners"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow_set', 'set_rgYlC', '{"data":[{"module_id":"rgfTN","layout_id":"1","position":"pos_ss","status":false,"sort_order":0,"w":"1800","h":"600","sizetype":"pfw","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Basic slideshow 01"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicslideshow', 'rgfTN', '{"common":{"effect":"slide","speed":1500,"auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/home-slideshow\\/slide01.jpg","url":"","win":false}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/home-slideshow\\/slide02.jpg","url":"","win":false}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/home-slideshow\\/slide03.jpg","url":"","win":false}}],"name":"Basic slideshow 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%basicslideshow%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgN0C', '{"status":true,"main_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgfTN', '{"status":true,"main_wrp":[],"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"}}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_basicslideshow.set_rgYlC.rgfTN', 'pos_ss', '0');
INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('3', 'rgen_basicslideshow.set_rgyWB.rgNUo', 'content_top', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%basicslideshow%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgyWB.rgNUo', '1', '0');
INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgYlC.rgfTN', '', '0');
