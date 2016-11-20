-- ------------------------------------
-- 
-- Module - bannergrids
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%bannergrids%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_bannergrids', 'rgZJe', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]},{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]},{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"\\u9996\\u9875"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_bannergrids_set', 'set_rgGKA', '{"data":[{"module_id":"rgaIk","layout_id":"1","position":"rg_t_up","status":true,"sort_order":0,"container":"fw"}],"name":"\\u9996\\u9875"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_bannergrids_set', 'set_rgJDK', '{"data":[{"module_id":"rgaIk","layout_id":"1","position":"rg_t_l","status":true,"sort_order":0,"container":"bx"}],"name":"Banner grids 01"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_bannergrids', 'rgaIk', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"gt":10}},"items":[]}]}],"name":"Banner grids 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%bannergrids%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%bannergrids%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_bannergrids.set_rgJDK.rgaIk', 'rg_t_l', '0');
INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_bannergrids.set_rgGKA.rgaIk', 'rg_t_up', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%bannergrids%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_bannergrids', 'rgen_bannergrids_R.set_rgGKA.rgaIk', '1', '0');
INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_bannergrids', 'rgen_bannergrids_R.set_rgJDK.rgaIk', '1', '0');
