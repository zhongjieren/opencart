-- ------------------------------------
-- 
-- Module - customhtml
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%customhtml%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_customhtml', 'rgttE', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":true,"size":9,"html":{"1":"<h2 class=\\"h2\\" style=\\"font-size: 35px; font-weight:300;\\">Check all features<\\/h2>\\n\\n<p style=\\"font-family: Roboto; font-weight: 300; color: rgba(255, 255, 255, 0.5); font-size:20px;\\">\\n\\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\\n\\n<\\/p>"}},"middle":{"status":false,"size":6,"html":[]},"right":{"status":true,"size":3,"html":{"1":"<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\" target=\\"_blank\\" class=\\"default-btn\\" style=\\"display:block;margin: 35px 0 0 0; font-size: 18px; font-weight: 300; padding: 15px;\\">More details<\\/a>"}}},"data":["No node"],"name":"CHECK ALL FEATURES - section"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_customhtml_set', 'set_rgdcH', '{"data":[{"module_id":"rgttE","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"6","container":"bx"}],"name":"CHECK ALL FEATURES - section"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%customhtml%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.m_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.mod_hd', '{"family":"Oswald:300","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_customhtml', 'rgen_customhtml.rgttE', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":"60","pad_type":"int","pad_t":"60","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"40","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 60px; padding-right: 0px; padding-bottom: 40px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); padding-top: 60px; padding-right: 0px; padding-bottom: 40px; padding-left: 0px; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"60px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"40","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 60px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "},"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":"60","pad_type":"int","pad_t":"30","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"30","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"60px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"40","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 60px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "},"b_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "},"l_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "},"m_html":[],"r_html":[]}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.customhtml', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.mod_hd', '{"family":"Oswald:300","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.m.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.t.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgttE.d.t_html', '{"family":"","subset":""}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%customhtml%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_customhtml.set_rgdcH.rgttE', 'rg_t_up', '6');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%customhtml%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_customhtml', 'rgen_customhtml_R.set_rgdcH.rgttE', '1', '0');
