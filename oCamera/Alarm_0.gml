if instance_number(oPlayer)>=1 {
	oCamera.x = oPlayer.x;
	oCamera.y = oPlayer.y;
	oCamera.xx = oPlayer.x;
	oCamera.yy = oPlayer.y;
}
camera_set_view_pos(cam,oCamera.x-(camera_get_view_width(cam)/2),oCamera.y-(camera_get_view_height(cam)/2));
oCamera.mv = 0;
oCamera.mh = 0;

//var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam);
/*
var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
x = (oControl.mw*8);
y = (oControl.mh*8);
camera_set_view_pos(cam,(oControl.mw*8)-(cw/2),(oControl.mh*8)-(ch/2));