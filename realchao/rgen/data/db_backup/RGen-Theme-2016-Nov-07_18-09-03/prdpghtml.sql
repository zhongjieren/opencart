-- ------------------------------------
-- 
-- Module - prdpghtml
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%prdpghtml%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml', 'rgFot', '{"common":{"title_status":false,"top":{"status":true,"html":{"1":"<h2 class=\\"h2\\">Custom HTML below main image<\\/h2>\\n\\n<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\" target=\\"_blank\\"><img src=\\"image\\/catalog\\/rgen\\/demo06_images\\/other\\/445x200.jpg\\" class=\\"img-responsive\\"><\\/a>\\n<br>\\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.<\\/p>"}},"hoverstyle":"1","title":[],"gt":"gt40","bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Below main image"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml_set', 'set_rgDGm', '{"data":[{"module_id":"rgFot","layout_id":"2","position":"pdpg_bimg","status":true,"sort_order":0,"container":"bx","prd_page":"selected","products":[{"id":"42","name":"Apple Cinema 30\\""}]}],"name":"Below main image"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml', 'rgraI', '{"common":{"top":{"status":true,"html":{"1":"FREE Home delivery on orders above *$150.<br>\\n<span style=\\"font-size: 12px;\\">* Conditions apply<\\/span>\\n\\n<!--<img src=\\"image\\/catalog\\/rgen\\/demo06_images\\/product\\/free-delivery.png\\" class=\\"img-responsive\\" alt=\\"free-delivery\\">-->"}},"hoverstyle":"1","title_status":true,"title":{"1":"Custom HTML content"},"gt":"gt40","bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Custom HTML content"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_prdpghtml_set', 'set_rgvYr', '{"data":[{"module_id":"rgraI","layout_id":"2","position":"pdpg_toption","status":true,"sort_order":0,"container":"bx","prd_page":"all","products":[]}],"name":"Custom HTML content"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%prdpghtml%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.t_html', '{"family":"Roboto:300","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.mod_hd', '{"family":"Oswald:regular","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.t_html', '{"family":"Roboto:300","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rgraI', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding: 15px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"20px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 20px; text-align: left; "},"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rgFot', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"rgb(28, 28, 28)","color":"rgba(255, 255, 255, 0.5)","f_size":"16px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"30","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 30px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 16px; text-align: center; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding: 30px;"},"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%prdpghtml%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpghtml.set_rgDGm.rgFot', 'pdpg_bimg', '0');
INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('2', 'rgen_prdpghtml.set_rgvYr.rgraI', 'pdpg_toption', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%prdpghtml%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rgvYr.rgraI', '1', '0');
INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rgDGm.rgFot', '1', '0');
