-- ------------------------------------
-- 
-- Module - revslider
-- 
-- ------------------------------------

DELETE FROM `mcc_rgen_modules` WHERE `section` LIKE '%revslider%';

INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_revslider_set', 'set_rgixj', '{"data":[{"module_id":"rgrVA","layout_id":"1","position":"pos_ss","status":true,"sort_order":0,"container":"fw","slider_size":"pfs","slider_id":"1","slider_data":{"title":"demo-01-home-slideshow-pagefull","alias":"demo-01-home-slideshow-pagefull","id":"1","params":{"0":"Execute settings on all slides","title":"demo-01-home-slideshow-pagefull","alias":"demo-01-home-slideshow-pagefull","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1320","height":"380","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}}}],"name":"Home - Main slider"}');
INSERT INTO `mcc_rgen_modules` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_module', 'rgen_revslider', 'rgrVA', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":["No node"],"name":"Home - Main slider"}');


DELETE FROM `mcc_rgen_modules_customize` WHERE `key` LIKE '%revslider%';

INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.m_html', 'null');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.m_html', 'null');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.r_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'rgen_revslider', 'rgen_revslider.rgrVA', '{"status":true,"d":{"status":true,"main":[],"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: auto;"},"l_cl":[],"m_cl":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: auto;"},"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]}}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.b_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.m_html', 'null');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.l_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.t_html', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`store_id`, `group`, `section`, `key`, `value`) VALUES ('0', 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.mod_hd', '{"family":"","subset":""}');


DELETE FROM `mcc_layout_module` WHERE `code` LIKE '%revslider%';

INSERT INTO `mcc_layout_module` (`layout_id`, `code`, `position`, `sort_order`) VALUES ('1', 'rgen_revslider.set_rgixj.rgrVA', 'pos_ss', '0');


DELETE FROM `mcc_setting` WHERE `code` LIKE '%revslider%';

INSERT INTO `mcc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES ('0', 'rgen_revslider', 'rgen_revslider_R.set_rgixj.rgrVA', '1', '0');
