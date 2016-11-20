-- ------------------------------------
-- 
-- Module - stickyhtml
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%stickyhtml%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_stickyhtml_set', 'set_rgGpy', '{"data":[{"module_id":"rgajo","layout_id":"9999","position":"stickydata","status":true,"sort_order":0}],"name":"liucheng"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_stickyhtml', 'rgajo', '{"common":{"title_status":true,"html_status":true,"title":[null,"\\u8d2d\\u4e70\\u6d41\\u7a0b"],"html":{"1":"<iframe src=\\"https:\\/\\/www.flickr.com\\/photos\\/we-are-envato\\/13090422515\\/player\\/\\" width=\\"100%\\" height=\\"420\\" frameborder=\\"0\\" allowfullscreen=\\"\\" webkitallowfullscreen=\\"\\" mozallowfullscreen=\\"\\" oallowfullscreen=\\"\\" msallowfullscreen=\\"\\"><\\/iframe>"},"icon":{"status":true,"type":"ico","icon":"fa fa-hand-o-right","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"position":"r","top":"252","w":"600","cssclass":""},"data":["No node"],"name":"liucheng"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%stickyhtml%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_stickyhtml.rgajo.d.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_stickyhtml.rgajo.d.content', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_stickyhtml.rgajo.t.content', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_stickyhtml', 'rgen_stickyhtml.rgajo', '{"status":true,"d":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"content":[],"icon":{"top":0,"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"20px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 20px; text-align: left; border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}}},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"content":[],"icon":{"top":0,"block":[]}}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_stickyhtml.rgajo.t.mod_hd', '{"family":"","subset":""}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%stickyhtml%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('9999', 'rgen_stickyhtml.set_rgGpy.rgajo', 'stickydata', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%stickyhtml%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_stickyhtml', 'rgen_stickyhtml_R.set_rgGpy.rgajo', '1', '0');
