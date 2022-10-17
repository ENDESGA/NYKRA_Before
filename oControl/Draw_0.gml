
CX = camera_get_view_x(cam);
CY = camera_get_view_y(cam);
CW = camera_get_view_width(cam);
CH = camera_get_view_height(cam);
CMX = CX+(CW/2);
CMY = CY+(CH/2);
depth = -1000;

if game_dialogue==1 {
	draw_sprite_stretched_ext(sScreen_Glow,0,CX-1,CY-1,CW+2,CH+2,c_black,1/2);
	if instance_number(oIs_Inside)>=1 draw_sprite_stretched_ext(sScreen_Glow,0,CX-2,CY-2,CW+3,CH+3,c_black,1);
};

/*gpu_set_blendmode(bm_add);
draw_rectangle_view(c_iiem,1);
gpu_set_blendmode_ext(bm_dest_color,bm_zero);
draw_rectangle_view(make_colour_rgb(255,128,192),1);
gpu_set_blendmode(bm_normal);