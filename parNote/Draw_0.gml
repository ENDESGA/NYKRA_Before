if instance_number(oPlayer)>=1 {
var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));

if on==0 {
	if player_interact(x,y,17,0,0) {
		if player_interact(x,y,17,1,1) {
			on = 1;
			anim7 = 1;
			play_sound(choose(sndPaper_01,sndPaper_02,sndPaper_03,sndPaper_04,sndPaper_05),10,0,mean(1,random_range(0.9,1.1)),2/3,1);
		}
		//gpu_set_blendmode(bm_add);
		//draw_sprite_ext(sprite_index,image_index+6,x,y,1,1,0,c_aqua,1);
		anim = reach_tween(anim,1,7);
		//draw_line_width_color(x,y,lerp(x,oPlayer.x,anim),lerp(y,oPlayer.y,anim),1,c_aqua,c_black);
		//draw_line_width_color(x,y,lerp(x,oPlayer.x,anim),lerp(y,oPlayer.y,anim),1,c_aqua,c_black);
		//gpu_set_blendmode(bm_normal);
	}
	else
	{
		anim = 0;
	};
	//anim1 *= 0.9;
	anim1 = max((anim1*0.5)-0.001,0);
	
	/*if anim7==0 {
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_ink,sqr(0.5+lengthdir_x(0.5,(tick*300)+sqr(xstart)+sqr(ystart)+x+y)));
		gpu_set_blendmode(bm_normal);
	}*/
}
else
if on==1 {
	oPlayer.control = 0;
	oPlayer.UI_OPEN = 1;
	anim1 = reach_tween(anim1,2,10.5);
	if anim1>1.9 && player_interact(x,y,32,1,0) {
		on=2;
		play_sound(choose(sndPaper_01,sndPaper_02,sndPaper_03,sndPaper_04,sndPaper_05),10,0,mean(1,random_range(0.9,1.1))*0.66666,0.2,1);
	};
}
else
if on==2 {
	oPlayer.control = 0;
	oPlayer.UI_OPEN = 1;
	anim1 = reach_tween(anim1,0,5.25);
	if anim1<0.1 on=0;
};

if player_distance(x,y,32)==0 && on==1 on=2;

if on==0 {
	draw_self();
	if anim7==0 {
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_ink,sqr(0.5+lengthdir_x(0.5,(tick*300)+sqr(xstart)+sqr(ystart)+x+y)));
		gpu_set_blendmode(bm_normal);
	}
}
if anim1>0 draw_sprite_ext(sprite_index,image_index,lerp(cmx,x,max(0,1-anim1)),lerp(cmy,y,max(0,1-anim1)),1+(anim1*2),1+(anim1*2),0,c_white,max(0,1-anim1));
}