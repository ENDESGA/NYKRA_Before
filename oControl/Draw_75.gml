draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(FONT_MAIN);
if (os_type!=os_windows) {
	var dw = display_get_width(), dh = display_get_height();
	var dwt = (dw/3), dhh = (dh/2);
	var dwhh = (dwt/2), dhhh = (dhh/2);

	draw_line(dwhh,dhh,dwhh,dh);
	draw_line(0,dh-dhhh,dwt,dh-dhhh);

	draw_line(dw-dwhh,dhh,dw-dwhh,dh);
	draw_line(dw-dwt,dh-dhhh,dw-dwhh,dh-dhhh);
};

/*
draw_text(40,40,string(array_height_2d(TEST_ARRAY))+" "+string(array_length_2d(TEST_ARRAY,1))+" "+
string(array_length_1d(TEST_ARRAY))+"\n"+string(array_height_2d(TEST_ARRAY2))+" "+string(array_length_2d(TEST_ARRAY2,1))+" "+
string(array_length_1d(TEST_ARRAY2)));