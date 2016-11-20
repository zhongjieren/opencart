-- ------------------------------------
-- 
-- Module - imagegallery
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%imagegallery%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_imagegallery', 'rgIuj', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"zoon_icon":{"icon":"fa fa-plus"},"url_icon":{"icon":"fa fa-link"},"view":"grid","grids":[],"gt":10,"base_size":97,"image_w":250,"image_h":250,"resize_type":"fill","carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false}}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":[],"description":[],"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/zhifubao.png","alt":{"1":"zh-cn - No data"},"url":"","win":false},"cssclass":""}},"items":[]}]}]}],"name":"zhifufangshi"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_imagegallery_set', 'set_rg9KI', '{"data":[{"module_id":"rgIuj","layout_id":"9999","position":"rg_b_r","status":true,"sort_order":0,"container":"bx"}],"name":"Gallery blocks 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%imagegallery%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%imagegallery%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('9999', 'rgen_imagegallery.set_rg9KI.rgIuj', 'rg_b_r', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%imagegallery%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_imagegallery', 'rgen_imagegallery_R.set_rg9KI.rgIuj', '1', '0');
