-- ------------------------------------
-- 
-- Module - catshowcase
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%catshowcase%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_catshowcase', 'rgzIa', '{"common":{"title_status":true,"title":{"1":"Shop by category"},"gt":"gt40","top":{"status":true,"html":{"1":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr<br>\\nsed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat."}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Category showcase 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%catshowcase%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%catshowcase%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%catshowcase%';

