
CX = camera_get_view_x(cam);
CY = camera_get_view_y(cam);
CW = camera_get_view_width(cam);
CH = camera_get_view_height(cam);
CMX = CX+(CW/2);
CMY = CY+(CH/2);

obj_list_size = ds_list_size(obj_list);

if START_GAME==0 {
	if keyboard_check_pressed(vk_f11) {
		if scale==1 scale=0 else scale=1;
		event_user(1);
	}
	else
	if keyboard_check_pressed(vk_f12) {
		if scale==1 scale=2 else scale=1;
		event_user(1);
	}
	else
	if keyboard_check_pressed(vk_f10) {
		if scale==1 scale=4 else scale=1;
		event_user(1);
	}
	
	if window_get_fullscreen()==0 {
		//window_set_position((display_get_width()/2)-(window_get_width()/2),(display_get_height()/2)-(window_get_height()/2));
		//window_center();
	};
}