
if oControl.mode!=3 {
	draw_set_colour(c_aqua)
	draw_set_alpha(1);
	draw_text(x,y,string(text)+"\n"+string(page));
};

if instance_number(oPlayer)>=1 {
if on==0 {
	interact_arrow(x,y,17,c_aqua);
	if anim7==0 {
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_ink,0.5+lengthdir_x(0.5,(tick*300)+sqr(xstart)+sqr(ystart)+x+y));
		gpu_set_blendmode(bm_normal);
	}
}

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));
cmx -= ((sqr(sqr(sqr(sqr(sqr(anim1/2))))*4)/7)/4);
cmy -= ((sqr(sqr(sqr(sqr(sqr(anim1/2))))*6.5)/7)/4);

if anim1>0 {
	draw_rectangle_view(c_black,anim1/3.5);
	//draw_rectangle_view(c_black,anim1/3.5);
	draw_sprite_ext(sNote,page,cmx+((sqr(sqr(sqr(sqr(sqr(anim1/2))))*4)/7)/1.25),cmy+((sqr(sqr(sqr(sqr(sqr(anim1/2))))*6.5)/7)/1.25),anim1/2,anim1/2,0,merge_colour(c_black,c_blackink,0.5),sqr(anim1/3)/2);
	draw_sprite_ext(sNote,page,cmx,cmy,anim1/2,anim1/2,0,c_white,anim1/2);
	
	draw_set_colour(merge_colour($000000,make_colour_rgb(107,105,111),0.5));
	draw_set_font(FONT_MAIN);
	draw_set_alpha(sqr(anim1/2));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if align==1 draw_set_halign(fa_left);
	draw_text_transformed(cmx-((40*anim1*(align==1))/2),cmy,display_text,anim1/4,anim1/4,0); // display_text
	
	if top_t!="" {
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(FONT_MAIN);
		draw_set_alpha(sqr(anim1/2)/2);
		draw_text_transformed(lerp(cmx-36,cmx,(1-(anim1/2))),lerp(cmy-50,cmy,(1-(anim1/2))),top_t,anim1/4,anim1/4,0);
	}
	gpu_set_blendmode(bm_add);
	draw_ui_arrow(0,CMX,mean(CMY+50,CY+CH)+1,0,merge_color(c_black,$0080ff,sqr(anim1/2)));
	gpu_set_blendmode(bm_normal);
}
}