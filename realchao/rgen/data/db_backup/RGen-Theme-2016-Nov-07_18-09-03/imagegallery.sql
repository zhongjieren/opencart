-- ------------------------------------
-- 
-- Module - imagegallery
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%imagegallery%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_imagegallery', 'rgO2R', '{"common":{"title_status":true,"title":{"1":"\\u652f\\u4ed8\\u65b9\\u5f0f"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"zoon_icon":{"status":false,"type":"ico","icon":"fa fa-signal","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"inherit","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"240","block_h":"150","css":""},"url_icon":{"icon":"fa fa-link","status":false,"type":"ico","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":""},"view":"grid","grids":{"lg_desktop":"eq3","desktop":"d-eq3","tablet":"t-eq3","mob_xl":"mxl-eq3","mob_sm":"msm-eq3","mob_xs":"mxs-eq3","gutter":"gt10","margin_b":"mb10","classGroup":" eq3 d-eq3 t-eq3 mxl-eq3 msm-eq3 mxs-eq3 gt10 mb10"},"gt":10,"base_size":97,"image_w":"240","image_h":"150","resize_type":"fill","carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false}}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"yinlian","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/yinlian.png","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/zhifubao.png","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/04.jpg","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]}]}]}],"name":"Footer - image gallery"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%imagegallery%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.mod_hd', '{"family":"Oswald:regular","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.mod_hd', '{"family":"Oswald:regular","subset":"latin"}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_imagegallery', 'rgen_imagegallery.rgO2R', '{"status":true,"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"d":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"overlay":"rgb(255, 255, 255)","icon":[]}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":[],"overlay":"rgba(0,0,0,0.5)","icon":[]}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":[],"overlay":"rgba(0,0,0,0.5)","icon":[]}}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.mod_hd', '{"family":"","subset":""}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%imagegallery%';



DELETE FROM `mcc_setting` WHERE `code` LIKE '%imagegallery%';

