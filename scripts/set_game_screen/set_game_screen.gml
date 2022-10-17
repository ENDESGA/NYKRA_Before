function set_game_screen() {

	set_controls();

	game_set_speed(60,gamespeed_fps);
	room_speed = 60;
	
	var _full = bool(real(config_get("Settings","Fullscreen",1)));

	if _full {window_set_fullscreen(1); scale = 1;} else {window_set_fullscreen(0); scale = 2;};

	var scl = floor(display_get_height()/360)*2;
	repeat(4) {
		if floor(frac(scl/2)*10)<=0 {
			scl /= 2;
		}
		else break;
	}

	var scll = scl;
	scl = (display_get_height()/180);
	scll = scale;

	var scrn = scl/(scl/scale);
	if (scale==0) scrn = scl;
	globalvar cam;
	//camera_destroy(cam);
	cam = camera_create();
	cam_scale = scl;
	cam_scale_d = scl;
	camera_set_view_size(cam,floor((display_get_width()/scl)/2)*2,floor((display_get_height()/scl)/2)*2);

	view_camera[0] = cam;
	view_wport[0] = display_get_width()/scrn;
	view_hport[0] = display_get_height()/scrn;

	window_set_size(floor((display_get_width()/scrn)/2)*2,floor((display_get_height()/scrn)/2)*2);
	display_set_gui_size(display_get_width(),display_get_height());

	//window_center()
	application_surface_draw_enable(0);
	application_surface_enable(0);

	depth = -1000;

	if instance_number(oPlayer)>=1 {
		if instance_number(oCamera)<=0 instance_create_depth(x,y,0,oCamera);
		if instance_exists(oCamera) {
			oCamera.x = oPlayer.x;
			oCamera.y = oPlayer.y;
			oCamera.xx = oPlayer.x;
			oCamera.yy = oPlayer.y;
			oCamera.mv = 0;
			oCamera.mh = 0;
			camera_set_view_pos(cam,oCamera.x-(camera_get_view_width(cam)/2),oCamera.y-(camera_get_view_height(cam)/2));
		}
	}
	else
	{
		if instance_number(oCamera)<=0 instance_create_depth(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),
		camera_get_view_y(cam)+(camera_get_view_height(cam)/2),0,oCamera);
		if instance_exists(oCamera) {
			oCamera.mv = 0;
			oCamera.mh = 0;
		}
	};

	gpu_set_zwriteenable(0);
	gpu_set_ztestenable(0);
	draw_texture_flush();
	draw_flush();

	//if _full==0 {
		//window_set_position((display_get_width()/2)-(window_get_width()/2),(display_get_height()/2)-(window_get_height()/2));
		//window_center();
	//};

	if (os_type!=os_windows) {
		var dw = display_get_width(), dh = display_get_height();
		var dwt = (dw/3), dhh = (dh/2);
		var dwhh = (dwt/2), dhhh = (dhh/2);
	
		//virtual_key_delete(global.touch_left);
		//virtual_key_delete(global.touch_right);
		//virtual_key_delete(global.touch_up);
		//virtual_key_delete(global.touch_down);
		//virtual_key_delete(global.touch_jump);
		//virtual_key_delete(global.touch_aenox);
		//virtual_key_delete(global.touch_telarod);
		//virtual_key_delete(global.touch_eo);
		//virtual_key_delete(global.touch_inv);
	
		global.touch_left		= virtual_key_add(0,dh-dhhh,dwhh,dhhh,global.kkl);
		global.touch_right		= virtual_key_add(dwhh,dh-dhhh,dwhh,dhhh,global.kkr);
		global.touch_up			= virtual_key_add(0,dhh,dwhh,dhhh,global.kku);
		global.touch_down		= virtual_key_add(dwhh,dhh,dwhh,dhhh,global.kkd);
		global.touch_jump		= virtual_key_add(dw-dwhh,dhh,dwhh,dhh,global.kkj);
		global.touch_aenox		= virtual_key_add(dw-dwt,dhh,dwhh,dhhh,global.key_aenox);
		global.touch_telarod	= virtual_key_add(dw-dwt,dh-dhhh,dwhh,dhhh,global.key_telarod);
		global.touch_eo			= virtual_key_add(dw-dwt,0,dwhh,dhhh,global.key_eo);
		global.touch_inv		= virtual_key_add(dw-dwhh,0,dwhh,dhhh,global.key_inv);
	} else {
		//virtual_key_delete(global.touch_left);
		//virtual_key_delete(global.touch_right);
		//virtual_key_delete(global.touch_up);
		//virtual_key_delete(global.touch_down);
		//virtual_key_delete(global.touch_jump);
		//virtual_key_delete(global.touch_aenox);
		//virtual_key_delete(global.touch_telarod);
		//virtual_key_delete(global.touch_eo);
		//virtual_key_delete(global.touch_inv);
	};
};
