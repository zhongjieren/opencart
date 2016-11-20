-- ------------------------------------
-- 
-- Module - basicbanners
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%basicbanners%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_basicbanners', 'rg2Jt', '{"common":{"hoverstyle":"n","title":{"1":"en - No data"},"html":{"1":"en - No data"},"title_status":false,"html_status":false},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":[],"img":"..\\/image\\/no_image.jpg","url":"","win":false},"hover":{"icon":[],"title":[],"html":[]}}}],"name":"Basic banners 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%basicbanners%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%basicbanners%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%basicbanners%';

