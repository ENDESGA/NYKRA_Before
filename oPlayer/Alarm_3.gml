var _qx = 0;

if instance_number(parMob)>0 {
	var _inn = instance_nearest(x,y,parMob);
	if _inn.x>=(camera_get_view_x(cam)-8) {
		if _inn.x<=(camera_get_view_x(cam)+camera_get_view_width(cam)+8) {
			if _inn.y>=(camera_get_view_y(cam)-8) {
				if _inn.y<=(camera_get_view_y(cam)+camera_get_view_height(cam)+8) {
					mob_near = 1;
				}
			}
		}
	}
}
else _qx=6;

//alarm[3] = (round(fps/11)+1+_qx);