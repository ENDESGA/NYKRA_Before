//var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), 
var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
surf = surface_create(cw+6,ch+6);
depth = 100;
g = 0;
alarm[0] = 2;
COLOUR = c_ink;