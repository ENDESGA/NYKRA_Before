if fps_n_t==45 {fps_n_tt=(fps_n/fps_n_t); fps_n=0; fps_n_t=0;};
fps_n += real(fps_real);
fps_n_t += 1;
draw_set_alpha(1);
//shader_set(shBloom)
//shader_set_uniform_f(uBlur,surface_get_width(application_surface),surface_get_height(application_surface),11);
//draw_surface(application_surface,0,0);

//shader_reset();
//application_surface_draw_enable(1);
//draw_surface_ext(application_surface,0,0,1,1,0,c_fuchsia,0.5);

cam_glitch = max(cam_glitch-0.01,0);

tick += (1/60);

if application_surface_is_enabled() {
	application_surface_draw_enable(0);
	application_surface_enable(0);
}

if (global.t_SOUND_VOLUME!=SOUND_VOLUME) {
	
	global.t_SOUND_VOLUME = reach(global.t_SOUND_VOLUME,SOUND_VOLUME,1/120);
	
	if SOUND_VOLUME<0.01 global.t_SOUND_VOLUME=0;
	var num = audio_get_listener_count(), info;
	for( var i = 0; i < num; i++;) {
		info = audio_get_listener_info(i);
		audio_set_master_gain(info[? "index"], global.t_SOUND_VOLUME);
		ds_map_destroy(info);
	}
};





/*
if !application_surface_is_enabled() {
	application_surface_draw_enable(0);
	application_surface_enable(1);
} else {
	application_surface_draw_enable(0);
	application_surface_enable(1);
	surface_resize(application_surface,display_get_width(),display_get_height());
	shader_set(shd_bloom)
	//shader_set_uniform_f(uBlur,surface_get_width(application_surface),surface_get_height(application_surface),11);
	draw_surface(application_surface,0,0);
	shader_reset();
};
//draw_texture_flush();
//draw_flush();