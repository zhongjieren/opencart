-- ------------------------------------
-- 
-- Module - stickyhtml
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%stickyhtml%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_stickyhtml', 'rgajo', '{"common":{"title_status":false,"title":[],"html_status":true,"html":{"1":"<iframe src=\\"https:\\/\\/www.flickr.com\\/photos\\/we-are-envato\\/13090422515\\/player\\/\\" width=\\"100%\\" height=\\"420\\" frameborder=\\"0\\" allowfullscreen=\\"\\" webkitallowfullscreen=\\"\\" mozallowfullscreen=\\"\\" oallowfullscreen=\\"\\" msallowfullscreen=\\"\\"><\\/iframe>"},"icon":{"status":true,"type":"ico","icon":"fa fa-flickr","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"position":"r","top":"252","w":"600","cssclass":""},"data":["No node"],"name":"Sticky HTML 01"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%stickyhtml%';



DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%stickyhtml%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%stickyhtml%';

