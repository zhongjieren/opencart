-- ------------------------------------
-- 
-- Module - contentslider
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%contentslider%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_contentslider', 'rg1MQ', '{"common":{"title_status":false,"title":{"1":"Theme features"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Content slider 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%contentslider%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%contentslider%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%contentslider%';

