-- ------------------------------------
-- 
-- Module - deals
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%deals%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_deals', 'rgzUQ', '{"common":{"title_status":false,"title":{"1":"en - No data"},"gt":"gt0","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":{"1":"en - No data"}},"left":{"status":false,"size":4,"html":{"1":"en - No data"}},"right":{"status":false,"size":4,"html":{"1":"en - No data"}}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Deals showcase 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%deals%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%deals%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%deals%';

