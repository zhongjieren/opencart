-- ------------------------------------
-- 
-- Module - bannergrids
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%bannergrids%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_bannergrids', 'rgVV7', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Banner grids 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%bannergrids%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%bannergrids%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%bannergrids%';

