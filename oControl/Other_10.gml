//set_game_screen();

/*game_set_speed(60,gamespeed_fps);
room_speed = 60;
display_reset(0,1);

//view_wview[0] = round(display_get_width()/6);
//view_hview[0] = round(display_get_height()/6);
//round(mean(display_get_height()/360,display_get_width()/640));
/*var scl = floor(display_get_height()/360)*2;

repeat(4) {
	if floor(frac(scl/2)*10)<=0 {
		scl /= 2;
	}
	else break;
}* /
var scl = floor(display_get_height()/360);
var scll = scale;
//scl = floor(display_get_height()/360);
//scl = round(display_get_height()/180);
var scrn = scale;
globalvar cam;
cam = camera_create();
cam_scale = scl;
cam_scale_d = scl;
//camera_set_view_size(cam,round(display_get_width()/scl),round(display_get_height()/scl));
//camera_set_view_pos(cam,oPlayer.x,oPlayer.y);
view_camera[0] = cam;
view_wport[0] = display_get_width()/scll;
view_hport[0] = display_get_height()/scll;

window_set_size(display_get_width()/scrn,display_get_height()/scrn);
display_set_gui_size(display_get_width(),display_get_height());
window_center()

//surface_resize(application_surface,display_get_width()/scll,display_get_height()/scll);
//surface_resize(application_surface,1,1);
depth = -1000;

if instance_number(oPlayer)>=1 {
if instance_number(oCamera)<=0 instance_create_depth(x,y,0,oCamera);
}
else
{
	if instance_number(oCamera)<=0 instance_create_depth(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),
	camera_get_view_y(cam)+(camera_get_view_height(cam)/2),0,oCamera);
	oCamera.mv = 0;
	oCamera.mh = 0;
};*/