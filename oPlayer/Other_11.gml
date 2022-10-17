

//var t_hp = 0;//(0.5+lengthdir_x(0.5,tick*50));
/*draw_polygon(x,y2+4,41,208,16.5,merge_colour(c_white,c_ltgray,0.5),0.5,1,2.5,(1/3)+0.01);
draw_polygon(x,y2+4,41,210,16,c_black,1,1,1.5,(1/3));
//draw_polygon(x,y2+4,29,210,15.5,c_white,1/2,1,0.5,(1/3));
//draw_polygon(x,y2+4,28,210,14.5,c_black,0.2,1,0.5,(1/3));
draw_polygon(x,y2+4,41,210+((120-(t_hp*360))/2),16,c_iiem,1,1,1.5,t_hp);*/
//draw_polygon(x,y2+4,29,210+(t_hp*360)-1,16.5,c_iiem,1,1,2.5,0.00666);
/*
draw_set_alpha(1);
draw_set_colour(c_black);
draw_rectangle(cmx-(ch/3),cy+ch-2,cmx+(ch/3),cy+ch+1,0);
draw_set_colour(c_iiem);
draw_rectangle(ccx,cy+ch-2,ccx,cy+ch+1,0);
//draw_set_alpha(0.5);
draw_set_colour(c_gray);
draw_rectangle(cmx-(ch/3)-1,cy+ch-2-1,cmx+(ch/3),cy+ch+1,1);
*/

//fade_an1 = reach_tween(fade_an1,(((hp<hp_max)||(hept<hept_max))?1:0.5),7);

//}
/*
if damage!=0 && (round(tick*16) mod 2)==0 {
	gpu_set_fog(1,c_iiem,1,1);
	draw_sprite_ext(state,anim,x,y,facing*1.2,1.2,0,c_white,1);
	gpu_set_fog(0,0,0,0);
}
else
if damage!=0 {
	gpu_set_fog(1,c_white,1,1);
	draw_sprite_ext(state,anim,x,y,facing,1,0,c_white,1);
	gpu_set_fog(0,0,0,0);
};
if damage!=0 damage-=1;


if hept<hept_max thept = 1;
hept_an = reach(hept_an,thept,abs(thept-hept_an)/7);
if hept_an>0 {
	///draw_polygon(x,y,sides,ang,radius,colour,alpha,outline?,width?,drawn_amount?)
	//draw_rectangle_view(c_black,hept_an/2.75)
	//draw_rectangle_view(c_dkgray,hept_an/2.75)
	//draw_rectangle_view(c_black,hept_an/2.75)
	//draw_rectangle_view(c_ink,hept_an/2.75)
	//draw_rectangle_view(c_black,hept_an/2.75)
	
	var hsav = (hept_use_an*4);
	
	hxp = reach_tween(hxp,mean(cmx,xprevious),pi);
	hyp = reach_tween(hyp,mean(mean(y,cy+ch),yprevious+23.5),pi);
	
	//draw_polygon(hxp,hyp,7,(141.4285714*hept_an)-51.428528,7,c_black,0.5*sqr(hept_an),1,4.5*hept_an,1);
	gpu_set_blendmode(bm_add);
	draw_set_colour(make_colour_hsv(random_range(64,192),192,128));
	draw_set_alpha(hept_an);
	
	if instance_exists(hept_obj) && hept_use {
		//with(oHeavybox_s) {
			draw_set_colour(merge_colour(c_black,make_colour_hsv(random_range(64,192),192,128),sqr(0.5+lengthdir_x(0.5,tick*700))));
			var _t_pd = point_distance(x,y,oPlayer.x,oPlayer.y)<32;
			draw_line_width((hept_obj.x1-2.5),(hept_obj.y1-2),(hept_obj.x2+2.5)-2,(hept_obj.y1-2),1);
			draw_line_width((hept_obj.x1-2),(hept_obj.y1-1.5),(hept_obj.x1-2),(hept_obj.y2+1.5)-2,1);
			draw_line_width((hept_obj.x1-2.5),(hept_obj.y2+2)-2,(hept_obj.x2+2.5)-2,(hept_obj.y2+2)-2,1);
			draw_line_width((hept_obj.x2+2)-2,(hept_obj.y1-1.5),(hept_obj.x2+2)-2,(hept_obj.y2+1.5)-2,1);
		//}
	}
	
	if instance_exists(hept_obj) && (hept_use==0 || hept_fade>0) {
		//gpu_set_blendmode(bm_add);
		//draw_sprite_ext(sArrow,0,hept_obj.x,(hept_obj.y1-6)+lengthdir_y(1,tick*700),1,1,135,make_colour_hsv(random_range(64,192),192,128),1)
		draw_set_alpha(1);
		//draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
		var anN = 1-(tick mod 1);
		//draw_polygon(hept_obj.x,hept_obj.y,7,tick*30,(7*anN)+5,merge_colour(c_aqua,c_edgb,0.5),(1-sqrt(1-anN))*hept_fade,1,2*(1-anN),1);
		var anN = 1-((tick+0.5) mod 1);
		//draw_polygon(hept_obj.x,hept_obj.y,7,tick*30,(7*anN)+5,merge_colour(c_aqua,c_edgb,0.5),(1-sqrt(1-anN))*hept_fade,1,2*(1-anN),1);
		draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
		draw_set_font(FONT_MAIN);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_set_alpha(hept_fade);
		
		draw_rectangle_color(hept_obj.x1,hept_obj.y1,hept_obj.x2,hept_obj.y2,
		merge_colour(c_black,c_edgbbb,sqr(0.5+lengthdir_x(0.5,(tick*60)))),
		merge_colour(c_black,c_edgbbb,sqr(0.5+lengthdir_x(0.5,(tick*60)+90))),
		merge_colour(c_black,c_edgbbb,sqr(0.5+lengthdir_x(0.5,(tick*60)+270))),
		merge_colour(c_black,c_edgbbb,sqr(0.5+lengthdir_x(0.5,(tick*60)+180))),0);
		
		draw_rectangle_color(hept_obj.x1,hept_obj.y1,hept_obj.x2,hept_obj.y2,
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*220)))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*100)+90))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*140)+270))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*180)+180))))),0);
		
		draw_rectangle_color(hept_obj.x1-1,hept_obj.y1-1,hept_obj.x2+1,hept_obj.y2+1,
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*220)))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*100)+90))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*140)+270))))),
		merge_colour(c_black,c_edgb,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*180)+180))))),1);
		
		//draw_sprite_ext(sArrow,0,argument0,(bbox_top-4.5)+lengthdir_y(0.5,tick*700),1,1,-45,argument3,1);
		
		gpu_set_blendmode(bm_add);
		draw_set_alpha(mean(hept_fade,sqr(hept_fade)));
		draw_text(hept_obj.x+0.5,(hept_obj.y1-7)+lengthdir_y(0.5,tick*700),string_n_glitch(oControl.CONTROL_MODE?chr(700):"A",round(hept_fade)));
		gpu_set_blendmode(bm_normal);
		hept_fade = reach_tween(hept_fade,thept,15);
		
		//gpu_set_blendmode(bm_normal);
	}// else hept_fade = reach_tween(hept_fade,0,16);
	/*
	if hept_charge==0 draw_polygon(hxp,hyp,7,(141.4285714*hept_an)-51.428528,6+hsav,make_colour_hsv(random_range(64,192),192,128),sqrt(hept_an),1,2.5*hept_an,hept/hept_max) else {
		draw_polygon(hxp,hyp,7,(141.4285714*hept_an)-51.428528,5,c_iiem,sqr(0.5+lengthdir_y(0.5,tick*700)),1,1,0.5);
		draw_polygon(hxp,hyp,7,((141.4285714*hept_an)-51.428528),9,c_iiem,sqr(0.5+lengthdir_x(0.5,tick*700)),1,1,1);
		draw_polygon(hxp,hyp,7,((141.4285714*hept_an)-51.428528),8,c_iiem,1-sqrt(0.5+lengthdir_y(0.5,tick*700)),1,1,1);
	}
	draw_polygon(hxp,hyp,7,((141.4285714*hept_an)-51.428528),6+hsav,make_colour_hsv(random_range(64,192),192,128),sqrt(hept_an)*(hept_charge?0.666:1),1,(2.5*hept_an)+(hsav/4),hept/hept_max);
	* /
	gpu_set_blendmode(bm_normal);
}
else
{
	hxp = xprevious;
	hyp = yprevious+21;
};

hept_use_an = reach_tween(hept_use_an,hept_use,7);

var c_gloworange = make_colour_rgb(254,112,1);
if inv_open_an>0 {
	
	var circcx = ccx-(cw/4), circcy = ccy;
	draw_set_alpha(1);
	//draw_rectangle_view(c_black,inv_open_an/1.33333);
	draw_rectangle_view(c_ink,(2/3)*sqr(inv_open_an));
	draw_rectangle_view(c_black,(2/3)*sqr(inv_open_an));
	draw_set_alpha((((sqr(inv_open_an)/5)*(1-bag_sel_an))*sqr(bag_sel_ob))*1.666666);
	draw_set_colour(c_black);
	//draw_set_circle_precision(51);
	draw_circle(cx,circcy,((((cw/4)+64)*inv_open_an)+(bag_sel_an*80))*bag_sel_ob,0);
	draw_set_alpha((((sqr(inv_open_an)*sqr(bag_sel_an))/3.5)*sqr(bag_sel_ob))*1.666666);
	draw_circle(cx,circcy,(((cw/4)+82)*bag_sel_an)*bag_sel_ob,0);
	draw_set_colour(c_gloworange);
	//draw_set_circle_precision(24);
	draw_set_alpha(1);
	var inv_size = ds_list_size(INV), item_id = -1, med_inv_size = ds_list_size(MED_INV);
	draw_set_font(FONT_MAIN);
	draw_set_valign(fa_middle);
	bag_sel_ann = reach(bag_sel_ann,bag_sel,abs(bag_sel-bag_sel_ann)/4.32);
	if (current_bag == -1) && inv_open_an>0.5 {
		bag_sel += (keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up));
		//if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_up)) play_sound(sndMenu_sel,10,0,1,1,0);
		bag_sel = clamp(bag_sel,0,array_length_1d(bag_n)-1);
		if keyboard_check_pressed(vk_right) && bag_sel!=2 {
			current_bag = bag_sel;
			current_bag_prev = bag_sel;
			inv_sel=0;
			inv_sel_an=-12;
			inv_sel_an2=-12;
			inv_sel_an3=-12;
		}
	}
	//else
	
	bag_sel_an = reach(bag_sel_an,(current_bag !=-1),abs((current_bag !=-1)-bag_sel_an)/5.66);
	bag_sel_ob = reach_tween(bag_sel_ob,1-(current_bag==3),6.5);
	var tbag_sel_an = sqr(bag_sel_an*bag_sel_an*bag_sel_an);
	if smelt_choose_n<=0 && current_bag!=-1 && bag_sel_an>0.666 && current_bag!=3 && keyboard_check_pressed(vk_left) current_bag=-1 else {
		if current_bag!=-1 && bag_sel_an>0.666 && current_bag==3 && keyboard_check_pressed(vk_up) current_bag=-1;
	}
	
		gpu_set_blendmode(bm_subtract);
	//gpu_set_blendmode(bm_normal);
	
	draw_set_colour(c_black);
	draw_set_alpha(0.83333333*inv_open_an);
	draw_set_alpha(inv_open_an);
	
	//draw_rectangle(cx,(cy+ch)-(12*inv_open_an),cx+(cw),cy+ch+1,0);
	draw_rectangle_colour(cx,(cy+ch)-(16*inv_open_an),cx+(cw/2),cy+ch+1,c_black,c_black,c_black,c_ltgray,0);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sToka,4,cx+9,((cy+ch)-(20*inv_open_an))+14,1,1,0,c_white,sqr(inv_open_an));
	draw_set_alpha(inv_open_an);
	draw_set_colour(make_colour_rgb(222,106,133));
	draw_set_font(FONT_MAIN);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(cx+19,((cy+ch)-(50*inv_open_an))+44,string(toka));
	var _am = round(80-(80*(bag_weight/bag_weight_max)));
	draw_sprite_part_ext(sUI_bag,(inv_open_an>0.95),0,0,44,_am,(cx-(30*(1-inv_open_an))-13)-(34*(1-bag_sel_ob)),circcy-31,1,1,c_gloworange,inv_open_an);
	draw_sprite_part_ext(sUI_bag_fill,(inv_open_an>0.95),0,_am-1,44,80-_am+1,(cx-(30*(1-inv_open_an))-13)-(34*(1-bag_sel_ob)),(circcy-31)+_am-1,1,1,merge_colour(c_aqua,c_edgb,0.5),inv_open_an);
	
	// CURRENT THOUGHT
	
	draw_set_colour(c_orange);
	draw_set_valign(fa_top);
	draw_set_halign(fa_right);
	inv_open_annn = reach_tween(inv_open_annn,inv_open_an,9);
	draw_set_alpha(sqr(inv_open_annn)*sqr(sqr(inv_open_an)));
	draw_set_font(FONT_MAIN);
	draw_text_transformed(((CX+CW)-8)+((1-inv_open_annn)*12),CY+8+((1-inv_open_annn)*6),THOUGHT,0.5,0.5,0);
	draw_set_font(fnt4);
	draw_set_alpha(sqr(sqr(inv_open_annn)*sqr(sqr(inv_open_an)))/2);
	draw_text_transformed(((CX+CW)-8)+(sqr(1-inv_open_annn)*12),CY+20+(sqr(1-inv_open_annn)*6),"CURRENT THOUGHT",0.5,0.5,0);
	draw_set_font(FONT_MAIN);
	
	if (current_bag < 2) { //////////////////// IIEDREMOR ?!
	if bag_sel_an>0 {
	if (inv_size>0) && ((current_bag==-1 || current_bag==0) && current_bag_prev==0) {
		inv_sel = clamp(inv_sel,0,ds_list_size(INV)-1);
	var can_smelt=0, __tcol = c_white, __tselcansmel = 1;
	for(var i=0; i<inv_size; i++;) {
		can_smelt=1;
		__tcol = c_white;
		item_id = (INV[| i]);
		/*
		repeat(10) {
			if ITEM[@ item_id,9]!=0 {
				i+=1;
				item_id = (INV[| i]);
			} else break;
		}* /
		//gpu_set_blendmode(bm_add);
		//draw_sprite_ext(sItems_out,item_id,cx+lengthdir_x((cw/4),14*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4),14*(i-inv_sel_an2)),1,1,0,draw_get_colour(),sqr((abs(i-inv_sel_an))/4)/2);
		
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/7.5))*inv_open_an)*tbag_sel_an);
		if UI_SMELT==1 {
			if UI_SMELT_ID.smelt_id==noone && UI_SMELT_ID.smelt_n==0 && UI_SMELT_ID.smelt_out==0 {
			if ITEM[item_id,6]==0 {
				//draw_set_alpha(draw_get_alpha()/1.1);
				can_smelt=0;
				__tcol = merge_colour(c_dkgray,c_black,2/3);
			}
			else
			{
				draw_set_alpha(sqrt(sqrt(draw_get_alpha())*inv_open_an)*inv_open_an);
				if inv_sel==i __tselcansmel=0;
			};
			}
		}
		draw_sprite_ext(sItems,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),1+circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,c_black,sqr(draw_get_alpha()));
		draw_sprite_ext(sItems,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,__tcol,draw_get_alpha());
		
		gpu_set_blendmode(bm_add);
		draw_set_alpha(1);
		draw_sprite_ext(sItems_out,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,merge_colour(c_aqua,c_edgb,0.75),((inv_sel==i)*inv_open_an)*tbag_sel_an);
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/4.5))*inv_open_an)*tbag_sel_an);
		draw_set_colour(c_gloworange);
		if can_smelt==0 draw_set_alpha(draw_get_alpha()/3.5);
		if can_smelt==0 draw_set_colour(merge_colour(c_dkgray,c_gloworange,1/3)) else if inv_sel==i draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
		if i>=inv_sel-2 && i<=inv_sel+2 && (UI_SMELT==0 && UI_CRAFT==0) {
			//gpu_set_blendmode(bm_add);   ///   GLOW
			//for(var j=0; j<INV_N[| i];j++;) {
			//	draw_sprite_ext(sItems_out,item_id,((cx+cw)-80)+(6*j),(circcy+(36*(i-inv_sel_an)))-44,2,2,0,make_colour_rgb(168,73,1),((1-(abs(i-inv_sel_an)))*inv_open_an)/2);
			//};
			//gpu_set_blendmode(bm_normal);
			draw_sprite_ext(sItems,item_id,(((cx+cw)-(cw/4))+(32*(i-inv_sel_an)))+1,(circcy),2,2,0,c_white,(((1-sqr(abs(i-inv_sel_an)))*inv_open_an)*tbag_sel_an));
		}
		gpu_set_blendmode(bm_add);
		draw_set_halign(fa_right);
		draw_text(cx+lengthdir_x((cw/4)-14,15*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-12,15*(i-inv_sel_an3)),string(INV_N[| i]));
		draw_set_halign(fa_left);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/6.5))*inv_open_an)*tbag_sel_an);
		if can_smelt==0 draw_set_alpha(draw_get_alpha()/2.5);
		draw_text(cx+lengthdir_x((cw/4)+14,13*(i-inv_sel_an)),circcy-lengthdir_y((cw/4)+16,13*(i-inv_sel_an)),string(ITEM[item_id,(INV_N[| i]>1)]));
		draw_set_alpha(((1-((abs(i-inv_sel_an))/3.5))*inv_open_an)*tbag_sel_an);
		//draw_text(cx+lengthdir_x((cw/4)+88,7.5*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)+88,7.5*(i-inv_sel_an2)),string(ITEM[item_id,2])+"g");
		
		draw_set_colour(c_gloworange);
		if can_smelt==1 && UI_SMELT && (UI_SMELT_ID.smelt_n==0 && UI_SMELT_ID.smelt_out==0) draw_set_colour(c_aqua);
		//draw_sprite(sItems,item_id,circcx-sqr(sqr(inv_sel_an-i)/4)-abs(inv_sel_an-i),circcy+((i-inv_sel_an)*20));
		draw_set_alpha(sqr(inv_open_an*tbag_sel_an)/((inv_sel==i)?1:2));
		draw_line_width(cx+lengthdir_x((cw/4)-(30-(inv_sel==i)),3.5*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-(30-(inv_sel==i)),3.5*(i-inv_sel_an3)),cx+lengthdir_x((cw/4)-(34+(inv_sel==i)),3.5*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-(34+(inv_sel==i)),3.5*(i-inv_sel_an3)),((inv_sel==i)?1:(1/3))+0.1)
	}
	
	var inv_sel_wl = (ITEM[INV[| inv_sel],2]*INV_N[| inv_sel]);
	inv_sel_w = reach(inv_sel_w,inv_sel_wl,(abs(inv_sel_wl-inv_sel_w)/4.10619449)+0.002);
	draw_set_colour(c_gloworange);
	draw_set_alpha(inv_open_an*bag_sel_an);
	draw_set_halign(fa_right);
	draw_set_font(fnt4);
	//draw_set_colour(make_colour_rgb(180,73,1));
	//draw_sprite_ext(sUI_bord,0,(cx+cw)-108,ccy-16,1,1,0,make_colour_rgb(168,73,1),(2/3)*(inv_open_an*inv_open_an));
	if (UI_SMELT==0 && UI_CRAFT==0) {
	draw_text((cx+cw)-64,ccy+32,"WEIGHT: ");
	draw_text((cx+cw)-64,ccy+43,"RARITY: ");
	//draw_sprite_ext(sItems,INV[
	draw_set_font(FONT_MAIN);
	draw_set_halign(fa_left);
	var rarity = ITEM[INV[| inv_sel],4], t_rarity = "";
	if rarity==0 {t_rarity="common"; draw_set_colour(make_colour_rgb(96,80,64));}
	else if rarity==1 {t_rarity="uncommon"; draw_set_colour(make_colour_rgb(0,73,255));}
	else if rarity==2 {t_rarity="rare"; draw_set_colour(make_colour_rgb(255,7,77));}
	else if rarity==3 {t_rarity="unique"; draw_set_colour(make_colour_rgb(255,255,255));};
	draw_text((cx+cw)-64,ccy+42,t_rarity);
	draw_set_colour(merge_colour(make_colour_rgb(180,73,1),make_colour_rgb(217,98,0),0.5));
	if round(inv_sel_w)==inv_sel_wl draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
	draw_text((cx+cw)-64,ccy+32,string(round(inv_sel_w))+"g");
	}
	else
	{
		draw_set_alpha(lerp_bounce(inv_open_an)/2);
		draw_set_colour(merge_colour(c_black,c_gloworange,lerp_bounce(inv_open_an)/2));
		draw_set_font(FONT_MAIN);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text((cx+cw)-3,(cy+ch)-1,"SMELTING MODE");
		if !__tselcansmel && UI_SMELT_ID.smelt_n==0 && UI_SMELT_ID.smelt_id==noone && UI_SMELT_ID.smelt_t==0 && UI_SMELT_ID.smelt_out==0 {
			if smelt_choose_n>=1 {
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_alpha(1);
				draw_set_colour(c_gloworange);
				gpu_set_blendmode(bm_normal);
				draw_rectangle_view(c_ink,0.2)
				draw_rectangle_view(c_black,2/3)
				gpu_set_blendmode(bm_add);
				for(var sm=1; sm<=(INV_N[| inv_sel]); sm++) {
					draw_set_alpha(smelt_choose_n==sm?1:(((1/abs(smelt_choose_n_an-sm))/2)/abs(smelt_choose_n_an-sm)));
					draw_set_colour(smelt_choose_n==sm?c_aqua:c_gloworange);
					draw_text((cx+(cw/2)+29),(cy+(ch/2))+((((smelt_choose_n_an-sm)*12)/mean(abs(smelt_choose_n_an-sm),1,abs(smelt_choose_n_an-sm)))*1.5),string(sm));
				}
				draw_sprite_ext(sArrow,0,(cx+(cw/2)+29),(circcy-32)-lengthdir_y(0.5,tick*700),
				1,1,-45,merge_colour(c_black,c_edgbbb,inv_open_an),2/3);
				draw_sprite_ext(sArrow,0,(cx+(cw/2)+29),(circcy+32)+lengthdir_y(0.5,tick*700),
				1,1,135,merge_colour(c_black,c_edgbbb,inv_open_an),2/3);
				if keyboard_check_pressed(vk_left) smelt_choose_n=0;
			}
		//}
		
		//if !__tselcansmel {
			var _tscale_t = ((tick+0.5) mod 1);
			draw_sprite_ext(sArrow,0,((cx+(cw/2)+48)-lengthdir_y(0.5,tick*700))-(_tscale_t*1.5),(circcy),
			1+(_tscale_t),1+(_tscale_t),225,merge_colour(c_black,c_edgbb,inv_open_an*(1-_tscale_t)),1);
			var _tscale_t = ((tick) mod 1);
			draw_sprite_ext(sUI_Smelting,1,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1-(_tscale_t/4),1-(_tscale_t/4),0,merge_colour(c_black,c_gloworange,inv_open_an*(1-_tscale_t)),sqrt(inv_open_an));
			if ui_extra_an>0.99 && current_bag==0 && bag_sel_an>0.9 {
			if smelt_choose_n<=0 && keyboard_check_pressed(vk_right) {
				smelt_choose_n = INV_N[| inv_sel];
				smelt_choose_n_an = smelt_choose_n/2;
			}
			else
			if smelt_choose_n>=1 && keyboard_check_pressed(vk_right) {
				UI_SMELT_ID.smelt_t = 0;//mean(60,real(ceil(fps)))*smelt_choose_n;
				UI_SMELT_ID.smelt_id = INV[| inv_sel];
				UI_SMELT_ID.smelt_n = smelt_choose_n;
				inv_delete(oPlayer,inv_sel,smelt_choose_n);
				smelt_choose_n = 0;
			}}
			draw_sprite_ext(sUI_Smelting,1,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1,1,0,c_gloworange,sqrt(inv_open_an)*((!__tselcansmel)?1:(1/3)));
			
		}
		else
		if UI_SMELT_ID.smelt_n>0 || UI_SMELT_ID.smelt_out>0 {
			draw_sprite_ext(sUI_Smelting,1,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1,1,0,c_gloworange,sqrt(inv_open_an)*((UI_SMELT_ID.smelt_n>0)?1:(1/3)));
			//draw_sprite_ext(sUI_Smelting,0,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1,1,0,c_edgb,sqrt(inv_open_an));
			if UI_SMELT_ID.smelt_out>0 {
				__tselcansmel = 0;
				
			} else __tselcansmel = 1;
			//__tselcansmel = 0;
			if UI_SMELT_ID.smelt_n>0 {
			var _tscale_t = ((tick) mod 1);
			draw_sprite_ext(sUI_Smelting,1,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1+(_tscale_t/3),1+(_tscale_t/3),0,merge_colour(c_black,c_gloworange,inv_open_an*(1-_tscale_t)),sqrt(inv_open_an));
			var _tscale_t = ((tick+0.5) mod 1);
			draw_sprite_ext(sUI_Smelting,1,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1+(_tscale_t/2.5),1+(_tscale_t/2.5),0,merge_colour(c_black,c_gloworange,inv_open_an*(1-_tscale_t)),sqrt(inv_open_an));
			}
			gpu_set_blendmode(bm_normal);
			
			if UI_SMELT_ID.smelt_out>0 {
			draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1))+1,circcy,1,1,0,c_black,ui_extra_an);
			draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1))-1,circcy,1,1,0,c_black,ui_extra_an);
			draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy+1,1,1,0,c_black,ui_extra_an);
			draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy-1,1,1,0,c_black,ui_extra_an);
			draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1,1,0,c_white,ui_extra_an);
			//if UI_SMELT_ID.smelt_n>0 draw_sprite_ext(sItems,ITEM[@ UI_SMELT_ID.smelt_idt,6],
			//(cx+cw-(cw/4.5))+18,circcy+mean(48,ch/4),1,1,0,c_white,ui_extra_an);
			}
			gpu_set_blendmode(bm_add);
			if UI_SMELT_ID.smelt_out>0 {
				draw_set_colour(c_aqua);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(FONT_MAIN);
				draw_set_alpha(ui_extra_an);
				draw_text((cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy+19,string(UI_SMELT_ID.smelt_out));
			}
			if UI_SMELT_ID.smelt_n>0 {
			draw_sprite_ext(sItems,UI_SMELT_ID.smelt_id,
			(cx+cw-(cw/4.5)),circcy+mean(48,ch/3),1,1,0,c_white,ui_extra_an);
			
			//gpu_set_blendmode(bm_add);
			
			draw_set_font(FONT_MAIN);
			draw_set_valign(fa_middle);
			draw_set_alpha(ui_extra_an);
			draw_set_colour(c_gloworange);
			draw_set_halign(fa_center);
			draw_text((cx+cw-(cw/4.5)),circcy+mean(48,ch/3)+15,string(UI_SMELT_ID.smelt_n));
			draw_set_color(c_aqua);
			//draw_set_alpha(ui_extra_an);
			draw_set_halign(fa_left);
			//draw_text((cx+cw-(cw/4.5))+27,circcy+mean(48,ch/4),string(UI_SMELT_ID.smelt_out));
			draw_sprite_ext(sArrow,0,(cx+cw-(cw/4.5)),(circcy+mean(48,ch/3)-(UI_SMELT_ID.smelt_t*13))-6,
			1,1,-45,merge_colour(c_black,merge_colour(c_gloworange,c_aqua,UI_SMELT_ID.smelt_t),inv_open_an),ui_extra_an);
			}
			if UI_SMELT_ID.smelt_out>0 && bag_sel_an>=(1/3) && inv_open_an>=0.95 && ui_extra_an>=0.5 {
				draw_set_halign(fa_right);
				draw_set_colour(c_aqua);
				draw_text(((cx+(cw/2)+45)-lengthdir_y(0.5,tick*700)),circcy,"TAKE");
				var _tscale_t = ((tick+0.5) mod 1);
				draw_sprite_ext(sArrow,0,((cx+(cw/2)+48)-lengthdir_y(0.5,tick*700))-(_tscale_t*1.5),(circcy),
				1+(_tscale_t),1+(_tscale_t),225,merge_colour(c_black,c_edgbb,inv_open_an*(1-_tscale_t)),1);
				if keyboard_check_pressed(vk_right){
					inv_add(ITEM[@ UI_SMELT_ID.smelt_idt,6],UI_SMELT_ID.smelt_out);
					UI_SMELT_ID.smelt_out = 0;
					if UI_SMELT_ID.smelt_n<=0 {
						UI_SMELT_ID.smelt_t = 0;
						UI_SMELT_ID.smelt_id = 0;
						UI_SMELT_ID.smelt_idt = 0;
					}
				}
			}
			
		}
		draw_sprite_ext(sUI_Smelting,0,(cx+cw-(cw/4.5))+(((cw/4.5)+32)*easing(24,1-ui_extra_an,0,1,1)),circcy,1,1,0,c_edgb,sqr(inv_open_an));
		draw_sprite_ext(sArrow,__tselcansmel,((cx+(cw/2)+48)-lengthdir_y(0.5,tick*700)),(circcy),
		1,1,225+(45*__tselcansmel),merge_colour(c_black,(!__tselcansmel)?(merge_colour(c_aqua,c_edgb,random(1))):(c_red),inv_open_an),1);
	};
	/*u
	draw_line_width(cx-(30*(1-inv_open_an))+29,(circcy-29.5)+_am,cx-(30*(1-inv_open_an))+51,(circcy-29.5)+_am,1);
	draw_set_font(fnt4);
	draw_set_halign(fa_right);
	draw_text(cx-(30*(1-inv_open_an))+50,((circcy-29.5)+_am)-3,string(bag_weight/1000));
	draw_text(cx-(30*(1-inv_open_an))+50,((circcy-29.5)+_am)+5,string(bag_weight_max/1000));* /
	
	//draw_text(ccx,ccy,string(inv_sel)+" "+string(inv_sel_an));
	
	gpu_set_blendmode(bm_normal);
	}
	else
	if med_inv_size>0 && ((current_bag==-1 || current_bag==1) && current_bag_prev==1) {
		var can_smelt=0, __tcol = c_white, __tselcansmel = 1;
		inv_sel = clamp(inv_sel,0,ds_list_size(MED_INV)-1);
		
		if (inv_open_an*tbag_sel_an)>0.9 {
		
		draw_set_font(fnt4);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var MURY = mean(cmy,cy+ch), QWE = (string_width("USE MEDICINE"))/2, QWH = (string_height("USE MEDICINE"))/2;
		draw_set_alpha(inv_open_an*tbag_sel_an);
		gpu_set_blendmode(bm_normal);
		draw_set_colour(merge_colour(c_edgbb,c_blackink,2/3));
		draw_rectangle((cmx-(6))-QWE,(MURY-(5))-QWH,((cmx+(5))+QWE),(MURY+(5))+QWH,0);
		draw_set_colour(c_aqua);
		if med_use>0 {draw_rectangle((cmx-(6+keyboard_check(vk_right)))-QWE,(MURY-(5+keyboard_check(vk_right)))-QWH,
		lerp((cmx-(5+keyboard_check(vk_right)))-QWE,((cmx+(5+keyboard_check(vk_right)))+QWE),med_use),(MURY+(5+keyboard_check(vk_right)))+QWH,0);}
		draw_set_colour(c_blackink);
		draw_rectangle((cmx-3)-QWE,(MURY-2)-QWH,(cmx+2)+QWE,(MURY+2)+QWH,0);
		draw_set_colour(c_aqua);
		draw_text(cmx,MURY,"USE MEDICINE");
		draw_ui_arrow(0,((cmx+(6+keyboard_check(vk_right)))+QWE)+5,MURY,1,med_use_click?c_aqua:c_edgb)
		}
		draw_set_font(FONT_MAIN);
	for(var i=0; i<med_inv_size; i++;) {
		can_smelt=1;
		__tcol = c_white;
		item_id = (MED_INV[| i]);
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/7.5))*inv_open_an)*tbag_sel_an);

		draw_sprite_ext(sItems,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),1+circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,c_black,sqr(draw_get_alpha()));
		draw_sprite_ext(sItems,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,__tcol,draw_get_alpha());
		
		gpu_set_blendmode(bm_add);
		draw_set_alpha(1);
		draw_sprite_ext(sItems_out,item_id,cx+lengthdir_x((cw/4)-1,14*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)-1,14*(i-inv_sel_an2)),1,1,0,merge_colour(c_aqua,c_edgb,0.75),((inv_sel==i)*inv_open_an)*tbag_sel_an);
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/4.5))*inv_open_an)*tbag_sel_an);
		draw_set_colour(c_gloworange);
		if can_smelt==0 draw_set_alpha(draw_get_alpha()/3.5);
		if can_smelt==0 draw_set_colour(merge_colour(c_dkgray,c_gloworange,1/3)) else if inv_sel==i draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
		if i>=inv_sel-2 && i<=inv_sel+2 && (UI_SMELT==0 && UI_CRAFT==0) {
			//gpu_set_blendmode(bm_add);   ///   GLOW
			//for(var j=0; j<INV_N[| i];j++;) {
			//	draw_sprite_ext(sItems_out,item_id,((cx+cw)-80)+(6*j),(circcy+(36*(i-inv_sel_an)))-44,2,2,0,make_colour_rgb(168,73,1),((1-(abs(i-inv_sel_an)))*inv_open_an)/2);
			//};
			//gpu_set_blendmode(bm_normal);
			draw_sprite_ext(sItems,item_id,(((cx+cw)-(cw/4))+(32*(i-inv_sel_an)))+1,(circcy),2,2,0,c_white,(((1-sqr(abs(i-inv_sel_an)))*inv_open_an)*tbag_sel_an));
		}
		gpu_set_blendmode(bm_add);
		draw_set_halign(fa_right);
		draw_text(cx+lengthdir_x((cw/4)-14,15*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-12,15*(i-inv_sel_an3)),string(MED_INV_N[| i]));
		draw_set_halign(fa_left);
		draw_set_alpha(((1-((abs(i-inv_sel_an))/6.5))*inv_open_an)*tbag_sel_an);
		if can_smelt==0 draw_set_alpha(draw_get_alpha()/2.5);
		draw_text(cx+lengthdir_x((cw/4)+14,13*(i-inv_sel_an)),circcy-lengthdir_y((cw/4)+16,13*(i-inv_sel_an)),string(ITEM[item_id,(MED_INV_N[| i]>1)]));
		draw_set_alpha(((1-((abs(i-inv_sel_an))/3.5))*inv_open_an)*tbag_sel_an);
		//draw_text(cx+lengthdir_x((cw/4)+88,7.5*(i-inv_sel_an2)),circcy-lengthdir_y((cw/4)+88,7.5*(i-inv_sel_an2)),string(ITEM[item_id,2])+"g");
		
		draw_set_colour(c_gloworange);
		//if can_smelt==1 && UI_SMELT && (UI_SMELT_ID.smelt_n==0 && UI_SMELT_ID.smelt_out==0) draw_set_colour(c_aqua);
		//draw_sprite(sItems,item_id,circcx-sqr(sqr(inv_sel_an-i)/4)-abs(inv_sel_an-i),circcy+((i-inv_sel_an)*20));
		draw_set_alpha(sqr(inv_open_an*tbag_sel_an)/((inv_sel==i)?1:2));
		draw_line_width(cx+lengthdir_x((cw/4)-(30-(inv_sel==i)),3.5*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-(30-(inv_sel==i)),3.5*(i-inv_sel_an3)),cx+lengthdir_x((cw/4)-(34+(inv_sel==i)),3.5*(i-inv_sel_an3)),circcy-lengthdir_y((cw/4)-(34+(inv_sel==i)),3.5*(i-inv_sel_an3)),((inv_sel==i)?1:(1/3))+0.1)
	}
	
	var inv_sel_wl = (ITEM[MED_INV[| inv_sel],2]*MED_INV_N[| inv_sel]);
	//inv_sel_w = reach(inv_sel_w,inv_sel_wl,(abs(inv_sel_wl-inv_sel_w)/4.10619449)+0.002);
	draw_set_colour(c_gloworange);
	draw_set_alpha(inv_open_an*bag_sel_an);
	draw_set_halign(fa_right);
	draw_set_font(fnt4);
	//draw_set_colour(make_colour_rgb(180,73,1));
	//draw_sprite_ext(sUI_bord,0,(cx+cw)-108,ccy-16,1,1,0,make_colour_rgb(168,73,1),(2/3)*(inv_open_an*inv_open_an));
		if (UI_SMELT==0 && UI_CRAFT==0) {
			//draw_text((cx+cw)-64,ccy+32,"WEIGHT: ");
			draw_text((cx+cw)-64,ccy+43,"RARITY: ");
			//draw_sprite_ext(sItems,INV[
			draw_set_font(FONT_MAIN);
			draw_set_halign(fa_left);
			var rarity = ITEM[MED_INV[| inv_sel],4], t_rarity = "";
			if rarity==0 {t_rarity="common"; draw_set_colour(make_colour_rgb(96,80,64));}
			else if rarity==1 {t_rarity="uncommon"; draw_set_colour(make_colour_rgb(0,73,255));}
			else if rarity==2 {t_rarity="rare"; draw_set_colour(make_colour_rgb(255,7,77));}
			else if rarity==3 {t_rarity="unique"; draw_set_colour(make_colour_rgb(255,255,255));};
			draw_text((cx+cw)-64,ccy+42,t_rarity);
			draw_set_colour(merge_colour(make_colour_rgb(180,73,1),make_colour_rgb(217,98,0),0.5));
			//if round(inv_sel_w)==inv_sel_wl draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
			//draw_text((cx+cw)-64,ccy+32,string(round(inv_sel_w))+"g");
		}
		
		if (inv_open_an*tbag_sel_an)>0.9 {
		if med_use_click med_use = reach(med_use,1,1/60) else {
			med_use*=0.89;
			med_use = reach(med_use,0,1/120);
		}
		
		if keyboard_check(vk_right) {
			if med_use_click==0 && keyboard_check_pressed(vk_right) {
				med_use_click = 1;
			}
			if med_use>=1 && med_use_click==1 {
				hp += (hp_max*(ITEM[@ MED_INV[| inv_sel],10]/100));
				hp = clamp(hp,0,hp_max);
				play_sound(sndHeal,10,0,1,1,0);
				med_use_click = 0;
				med_use = 0;
				if 1>=ds_list_find_value(MED_INV_N,inv_sel) {
					ds_list_delete(MED_INV,inv_sel);
					ds_list_delete(MED_INV_N,inv_sel);
				}
				else
				{
					var __t = (ds_list_find_value(MED_INV_N,inv_sel)-1);
					ds_list_replace(MED_INV_N,inv_sel,__t);
				};
			}
		} else med_use_click = 0;
		}
	}
	else
	{
		gpu_set_blendmode(bm_add);
		draw_set_colour(c_gloworange);
		draw_set_alpha((((bag_sel_an*bag_sel_an)*bag_sel_an)/1.2)*inv_open_an);
		draw_set_font(FONT_MAIN);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(((cx+(cw/4)-20)-(16*(1-bag_sel_an))),ccy,current_bag==1?"NO MEDICINE":"EMPTY BACKPACK");
	};
	};
	}
	else
	if current_bag==1 { // IIEDREMOR
		//
	};
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font((current_bag==-1)?fnt1:fnt4);
	draw_set_alpha(sqr(inv_open_an*inv_open_an*inv_open_an)*sqr(1-bag_sel_an));
	
	for(var i=0; i<array_length_1d(bag_n); i++;) {
		draw_set_colour((bag_sel==i)?merge_colour(c_aqua,c_edgb,0.5):merge_colour(make_colour_rgb(180,73,1),make_colour_rgb(217,98,0),0.5));
		if current_bag!=-1 draw_set_colour(merge_colour(make_colour_rgb(180,73,1),make_colour_rgb(217,98,0),0.5));
		draw_text_transformed(cx+lengthdir_x(((cw/4)*inv_open_an)+(bag_sel_an*96),((15+(bag_sel_an*30))*(i-bag_sel_ann))),
		circcy-lengthdir_y(((cw/4)*inv_open_an)+(bag_sel_an*93),((15+(bag_sel_an*30))*(i-bag_sel_ann)))+1-(current_bag!=-1),
		bag_n[i],1,1,-((i-bag_sel_ann)*4));
	}
	
	//}
	draw_sprite_ext(sArrow,0,lerp((cx+((cw/4)*inv_open_an)+(bag_sel_an*98*bag_sel_ob))-8,cx,(1-bag_sel_ob)/2),circcy,1,1,(-135+(180*bag_sel_an))-(90*(bag_iie_an/14)),c_edgb,sqr(inv_open_an)*inv_open_an);
	

	gpu_set_blendmode(bm_normal);
	var inv_size = ds_list_size(INV);
	if inv_size>0 {
		random_set_seed(inv_size);
		for(var q=inv_size-1; q>=0; q--) {
			draw_sprite_ext(sItems,INV[| q],((cx+cw+16)+lengthdir_x((cw/2),225+((0-bag_sel_ann)*20)))+random_range(-(10+(inv_size/1.75)),10+(inv_size/1.75)),
			((cy-16)+lengthdir_y((cw/2),225+((0-bag_sel_ann)*20)))+random_range(-(10+(inv_size/1.75)),10+(inv_size/1.75)),1,1,0,(bag_sel==0)?merge_colour(c_dkgray,c_white,((inv_size-q)/inv_size)):c_ltgray,
			sqr((sqr(((bag_sel==0)?1:0.5)*inv_open_an)*sqr(1-bag_sel_an))*clamp(1-abs(0-bag_sel_ann),0,1)));
		}
		randomise();
	}
	if bag_sel_ann>0 {
		var __iiex = (((cx+cw+8))+lengthdir_x((cw/2),225+((2-bag_sel_ann)*20)));
		var __iiey = ((cy-16)+lengthdir_y((cw/2),225+((2-bag_sel_ann)*20)));
		var _DR = 0, TX=0, TY=0;
		random_set_seed(77);
		for(var KI=0; KI<7; KI++) {
			_DR = 0;
			switch(KI) {
				case 0:
					if aenox _DR=1;
					TX = -8;
					TY = -16;
				break;
				
				case 1:
					if has_telarod _DR=1;
					TX = 8;
					TY = -16;
				break;
				
				case 2:
					TX = -16;
					TY = 0;
				break;
				
				case 3:
					TX = 0;
					TY = 0;
				break;
				
				case 4:
					TX = +16;
					TY = 0;
				break;
				
				case 5:
					TX = -8;
					TY = 16;
				break;
				
				case 6:
					TX = 8;
					TY = 16;
				break;
			}
			TX *= 2.225;
			TY *= 2.0;
			if _DR draw_sprite_ext(sKey_Items,KI,__iiex+TX,__iiey+TY,1,1,0,c_white,(((bag_sel==2)?1:0.5)*inv_open_an)*clamp(1-abs(2-bag_sel_ann),0,1)) else {
				draw_polygon(__iiex+TX,__iiey+TY,7,random(360),12,c_ltgray,(1/3)*((((bag_sel==2)?1:0.5)*inv_open_an)*clamp(1-abs(2-bag_sel_ann),0,1)),1,1.5,1);
			}
		}
		randomise();
	}
	var __iiex = (((cx+cw)+16)+lengthdir_x((cw/2),225+((3-bag_sel_ann)*20)));
	var __iiey = ((cy-16)+lengthdir_y((cw/2),225+((3-bag_sel_ann)*20)));
	var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
	var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));
	__iiex = lerp(__iiex,cmx,sqrt(1-bag_sel_ob));
	__iiey = lerp(__iiey,cmy,sqrt(1-bag_sel_ob));
	
	if current_bag==1 bag_iie_an = reach(bag_iie_an,(1-bag_sel_ob)*14,0.5) else bag_iie_an*=0.9;
	page_flip_an = reach(page_flip_an,11,0.54321);
	//if page_flip_an>5 && page_flip_an<7 && page_anim>=1 page_anim=0;
	draw_set_alpha(0.5*sqr(1-bag_sel_ob)*inv_open_an);
	draw_set_colour(c_black);
	draw_rectangle(cx-1,cy+(ch*0.666),cx+cw+1,cy+ch+1,0);
	////////////////
	draw_sprite_ext((current_bag>0)?sIiedremor:sIiedremor_close,round(bag_iie_an),__iiex,__iiey,1,1,0,(bag_sel==3)?c_white:c_ltgray,(((bag_sel==3)?1:0.5)*inv_open_an)*clamp(1-abs(3-bag_sel_ann),0,1));
	////////////////
	if round(page_flip_an)<11 {
		if page_flip_d==1 {
		draw_sprite_ext(sIiedremor_turnpage,round(page_flip_an),__iiex,__iiey,1,1,0,c_white,1);
		} else {
		draw_sprite_ext(sIiedremor_turnpage,11-round(page_flip_an),__iiex,__iiey,1,1,0,c_white,1);
		}
	}
	draw_set_colour(make_colour_rgb(187,117,84));
	if sqr(sqr(sqr(bag_iie_an/14)))+0.1>=1 && page_flip_an>=8 page_anim = reach_tween(page_anim,1,6);// else page_anim*=0.5;
	if current_bag==3 {
		if bag_sel_an>0.666 && page_flip_an>6 {
			var _tsp = symbol_pos;
			if keyboard_check_pressed(vk_right) {
				symbol_pos += 1;
				page_flip_d = 1;
			}
			else
			if keyboard_check_pressed(vk_left) {
				symbol_pos -= 1;
				page_flip_d = -1;
			}
			symbol_pos = clamp(symbol_pos,0,array_height_2d(symbol)-1);
			if _tsp!= symbol_pos {page_anim=0; page_flip_an=0;};
		}
		draw_set_alpha(page_anim*sqr(sqr(sqr(bag_iie_an/14)))*inv_open_an);
		var t_surf = surface_create(28,52);
		if surface_exists(t_surf) {
			surface_set_target(t_surf);
			var i = symbol_pos;
			//for(var i=0; i<array_height_2d(symbol); i++) {
				//if i==0 || symbol[@ max(i-1,0),0]>=0.75 symbol[i,0] = reach(symbol[i,0],1,(1-symbol[i,0])/7);
				for(var j=1; j<10; j++) {
					if (symbol[collected_symbols[| i],j]!=0 || (j==5 && symbol[collected_symbols[| i],10]>0)) {
						var _temp = symbol[collected_symbols[| i],j];
						dx1 = (2+(((j-1) mod 3)*12));
						dy1 = (2+(((j-1) div 3)*24));
						dx2 = (2+(((_temp-1) mod 3)*12));
						dy2 = (2+(((_temp-1) div 3)*24));
						dx1 = lerp(14,dx1,page_anim);
						dy1 = lerp(26,dy1,page_anim);
						dx2 = lerp(dx1,dx2,page_anim);
						dy2 = lerp(dy1,dy2,page_anim);
						//draw_set_alpha((sqr(1-(max(symbol_title_an-0.90,0)*10))));
						if symbol[collected_symbols[| i],j]!=0 draw_line_width(dx1,dy1,dx2,dy2,2);
						if j==5 {
							if symbol[collected_symbols[| i],10]==1 {
								draw_polygon(dx1+1,dy1-11,39,2,12.5*page_anim,make_colour_rgb(187,117,84),draw_get_alpha(),1,2.2,1);
							}
							else
							if symbol[collected_symbols[| i],10]==2 {
								draw_polygon(dx1+1,dy1+13,39,2,12.5*page_anim,make_colour_rgb(187,117,84),draw_get_alpha(),1,2.2,1);
							}
							else
							if symbol[collected_symbols[| i],10]==3 {
								draw_polygon(dx1+1,dy1-11,39,2,12.5*page_anim,make_colour_rgb(187,117,84),draw_get_alpha(),1,2.2,1);
								draw_polygon(dx1+1,dy1+13,39,2,12.5*page_anim,make_colour_rgb(187,117,84),draw_get_alpha(),1,2.2,1);
							};
						}
						if symbol[collected_symbols[| i],j]!=0 {draw_circle(dx1,dy1,1,0);
						if symbol[collected_symbols[| i],_temp]==0 {
							draw_circle(dx2,dy2,1,0);
						}}
					}
				}
			//}
			surface_reset_target();
			draw_surface(t_surf,cmx-52,cmy-28);
			surface_free(t_surf);
			//draw_set_halign(fa_center);
			//draw_set_valign(fa_top);
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_set_alpha(page_anim*sqr(sqr(sqr(bag_iie_an/14)))*inv_open_an);
			draw_set_font(FONT_MAIN);
			draw_text(cmx+16,cmy-25,symbol[collected_symbols[| i],0]);
			//draw_set_alpha(page_anim/2);
			//draw_set_halign(fa_left);
			//draw_set_valign(fa_middle);
			draw_set_font(FONT_MAIN);
			
			draw_sprite_ext(sIiedremor_icons,0,cmx+9,cmy-7,1,1,0,make_colour_rgb(187,117,84),draw_get_alpha()/3.5);
			draw_sprite_ext(sIiedremor_icons,1,cmx+9,cmy+6,1,1,0,make_colour_rgb(187,117,84),draw_get_alpha()/3.5);
			draw_sprite_ext(sIiedremor_icons,2,cmx+9,cmy+19,1,1,0,make_colour_rgb(187,117,84),draw_get_alpha()/3.5);
			draw_sprite_ext(sIiedremor_icons,3,cmx+9,cmy-26,1,1,0,make_colour_rgb(187,117,84),draw_get_alpha()/3.5);
			//draw_set_alpha(mean(page_anim/2,page_anim));
			draw_text(cmx+16,cmy-6,symbol[collected_symbols[| i],11]);
			draw_set_alpha((draw_get_alpha()/2)*inv_open_an);
			draw_text(cmx+16,cmy+7,symbol[collected_symbols[| i],12]);
			draw_text(cmx+16,cmy+20,symbol[collected_symbols[| i],13]);
			draw_set_alpha(sqr(sqr(bag_iie_an/14))*inv_open_an);
			col_sym_sel = reach_tween(col_sym_sel,symbol_pos,5);
			//gpu_set_blendmode(bm_add);
			draw_set_colour(c_edgb);
			for(var i=max(symbol_pos-4,0); i<min(symbol_pos+5,ds_list_size(collected_symbols)); i++) {
				for(var j=1; j<10; j++) {
					if (symbol[collected_symbols[| i],j]!=0 || (j==5 && symbol[collected_symbols[| i],10]>0)) {
						draw_set_colour(merge_colour(c_black,c_edgb,0.75));
						if i==symbol_pos draw_set_colour(merge_colour(c_white,c_aqua,0.75));
						var _temp = symbol[collected_symbols[| i],j];
						dx1 = (cmx+(((j-1) mod 3)*2))+((i-col_sym_sel)*14)-3;
						dy1 = ((cy+ch-31)+(((j-1) div 3)*4))-(i==symbol_pos);
						dx2 = (cmx+(((_temp-1) mod 3)*2))+((i-col_sym_sel)*14)-3;
						dy2 = ((cy+ch-31)+(((_temp-1) div 3)*4))-(i==symbol_pos);
						//draw_set_alpha((sqr(1-(max(symbol_title_an-0.90,0)*10))));
						draw_set_alpha((1-clamp(abs(symbol_pos-i)/7,0,1))*inv_open_an);
						if symbol[collected_symbols[| i],j]!=0 draw_line_width(dx1,dy1,dx2,dy2,1);
						if j==5 {
							if symbol[collected_symbols[| i],10]==1 {
								draw_polygon(dx1+1,dy1-1,39,2,2.5,draw_get_colour(),draw_get_alpha(),1,1,1);
							}
							else
							if symbol[collected_symbols[| i],10]==2 {
								draw_polygon(dx1+1,dy1+3,39,2,2.5,draw_get_colour(),draw_get_alpha(),1,1,1);
							}
							else
							if symbol[collected_symbols[| i],10]==3 {
								draw_polygon(dx1+1,dy1-1,39,2,2.5,draw_get_colour(),draw_get_alpha(),1,1,1);
								draw_polygon(dx1+1,dy1+3,39,2,2.5,draw_get_colour(),draw_get_alpha(),1,1,1);
							};
						}
						if symbol[collected_symbols[| i],j]!=0 {draw_circle(dx1,dy1,0.5,0);
						if symbol[collected_symbols[| i],_temp]==0 {
							draw_circle(dx2,dy2,0.5,0);
						}}
					}
				}
			}
			gpu_set_blendmode(bm_add);
			//draw_set_colour(c_edgb);
			draw_set_alpha(inv_open_an);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt4);
			draw_set_colour(c_edgb);
			draw_text(cmx,(cy+ch)-10,symbol[collected_symbols[| symbol_pos],11]);
			draw_sprite_ext(sArrow,0,(cmx-16)-keyboard_check(vk_left),(cy+ch)-10,1,1,45,c_aqua,sqr(inv_open_an));
			draw_sprite_ext(sArrow,0,(cmx+16)+keyboard_check(vk_right),(cy+ch)-10,1,1,-135,c_aqua,sqr(inv_open_an));
			gpu_set_blendmode(bm_normal);
		}
	}
	draw_set_alpha(sqr(sqr(sqr(bag_iie_an/14)))*inv_open_an);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt4);
	draw_set_colour(c_edgb);
	draw_text(mean(cx+(cw/4)-2,cx)-2,circcy+4,"CLOSE");
	draw_set_alpha(inv_open_an);
	
}

if LETTERBOX!=0 {
	fade_an11 = 1;
	alarm[2] = 120;
}

if (keyboard_check(vk_up) || keyboard_check(vk_down)) && t_click_sfx!=(inv_sel+smelt_choose_n+bag_sel) play_sound(sndMenu_sel,10,0,1,1,0);
//if control==0 fade_an11=-1;


	//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//


fade_an1 = reach_tween(fade_an1,(fade_an11?10:3),9);
//fade_an1 = 3;
if !keyboard_check(vk_f9) && draw==1 {
var t_hp = (hp/hp_max);
draw_sprite_ext(sPlayer_HP,2,cmx,cy+ch+fade_an1,1,1,0,c_black,0.5);
draw_sprite_ext(sPlayer_HP,1,cmx,cy+ch+fade_an1,1,1,0,c_blackink,1);
if damage>0 {draw_sprite_ext(sPlayer_HP,1,cmx,cy+ch+fade_an1,1,1,0,c_iiem,0.5+lengthdir_x(0.5,tick*1050));
	draw_set_colour(c_iiem);
	draw_set_alpha((0.75+lengthdir_y(0.25,tick*2100))*control_fade);
	draw_rectangle(cx-1,cy-1,cx+cw-1,cy+ch-1,1);
	draw_rectangle(cx-0.95,cy-0.95,cx+cw-1.05,cy+ch-1.05,1);
	draw_rectangle(cx-0.9,cy-0.9,cx+cw-1.1,cy+ch-1.1,1);
	draw_rectangle(cx-0.85,cy-0.85,cx+cw-1.15,cy+ch-1.15,1);
	draw_rectangle(cx-0.8,cy-0.8,cx+cw-1.2,cy+ch-1.2,1);
	draw_rectangle(cx-0.75,cy-0.75,cx+cw-1.25,cy+ch-1.25,1);
}
fade_an2 = reach_tween(fade_an2,hp<(hp_max/10),16);
if  fade_an2>0 {
	draw_set_colour(c_iiem);
	draw_set_alpha(((sqr(0.5+lengthdir_y(0.5,tick*350))*fade_an2)/2)*control_fade);
	draw_rectangle(cx-1,cy-1,cx+cw-1,cy+ch-1,1);
	draw_rectangle(cx-0.95,cy-0.95,cx+cw-1.05,cy+ch-1.05,1);
	draw_rectangle(cx-0.9,cy-0.9,cx+cw-1.1,cy+ch-1.1,1);
	draw_rectangle(cx-0.85,cy-0.85,cx+cw-1.15,cy+ch-1.15,1);
	draw_rectangle(cx-0.8,cy-0.8,cx+cw-1.2,cy+ch-1.2,1);
	draw_rectangle(cx-0.75,cy-0.75,cx+cw-1.25,cy+ch-1.25,1);
	draw_sprite_stretched_ext(sScreen_Glow,0,cx-1,cy-1,cw+2,ch+2,c_iiem,draw_get_alpha()/(1.5+((instance_number(oIs_Inside)>0)*1.5)));
}

//draw_sprite_stretched_ext(sScreen_Glow,0,cx-1,cy-1,cw+2,ch+2,c_iiem,min(((1/(((hp/hp_max)*(hp_max))+1))/((instance_number(oIs_Inside)>0)*1.5))*2,1));

var tt_hp = (r_hp/hp_max);
draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-tt_hp)),0,61*tt_hp,18,(cmx-30)+(30.5*(1-tt_hp)),(cy+ch)-13+fade_an1,1,1,c_white,1);
var t_hp = (hp/hp_max);
draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-t_hp)),0,61*t_hp,18,(cmx-30)+(30.5*(1-t_hp)),(cy+ch)-13+fade_an1,1,1,c_iiem,1);
if damage>0 draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-t_hp)),0,61*t_hp,18,(cmx-30)+(30.5*(1-t_hp)),(cy+ch)-13+fade_an1,1,1,c_white,0.5+lengthdir_x(0.5,tick*1050));
draw_sprite_ext(sPlayer_HP,0,cmx,cy+ch+fade_an1,1,1,0,merge_colour(c_ink,make_colour_rgb(46,53,79),0.5),1);
if hept_charge!=0 draw_sprite_ext(sPlayer_HP,0,cmx,cy+ch,1,1,0,c_iiem,0.5+lengthdir_y(0.5,tick*1050));
t_hp = (aenox_h/aenox_hm);
/*
if hept<hept_max {
	if fade_an3+0.01>1 {
		fade_an3 = 120;
	}
	else fade_an3 = reach_tween(fade_an3,1,7);
}
else
{
	if fade_an3>1 {
		fade_an3 --;
	}
	else fade_an3 = reach_tween(fade_an3,0,11);
};* /
fade_an3 = 1;
aenox_h = reach_tween(aenox_h,(aenox_id!=noone)*aenox_hm,7);
draw_sprite_part_ext(sPlayer_HP,0,6+(35.5*(1-t_hp)),0,71*t_hp,18,(cmx-35)+(35.5*(1-t_hp)),(cy+ch)-13+fade_an1,1,1,merge_colour(c_aqua,merge_colour(merge_colour(c_white,c_aqua,0.5),merge_colour(c_edgbb,c_aqua,0.5),t_hp),0.5+lengthdir_x(0.5,tick*700)),clamp(fade_an3,0,1));
}

//GP_col = reach_tween(GP_col,(aenox_id!=noone),7);
//gamepad_set_color(4,merge_colour(c_iiem,c_aqua,GP_col));

mob_near = 0;

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));

if hp<=0 && dead==0 {
	dead = 1;
	dead_amount = 1;
	dead_offset = random(50)+random(100)+1.0;
	dead_x = x-cx;
	dead_y = y-cy;
	dead_fade = 1;
	audio_play_sound(sndDeath,10,0);
}

if dead {
	control = 0;
	UI_OPEN = 1;
	hsp = 0;
	vsp = 0;
	oCamera.follow = -2;
	//x = dead_x;
	//y = dead_y;
	var tdead_x = cx+dead_x, tdead_y = cy+dead_y;
	//oCamera.x = reach_tween(oCamera.x,tdead_x,7);
	//oCamera.y = reach_tween(oCamera.y,tdead_y,7);
	cam_shake = 0;
	cam_push = 0;
	draw_rectangle_view(c_black,1);
	draw_rectangle_view(c_iiem,dead_an);
	dead_an *= 0.9;
	SOUND_VOLUME = 0;
	if dead_an-0.001<0 dead_amount = reach(dead_amount,0,1/180);
	if dead_amount<=0 dead_fade*=0.98;
	
	draw_sprite_ext(sIinenea_sigil,0,tdead_x+iiem_shake()+iiem_shake(),tdead_y+iiem_shake()+iiem_shake(),1,1,0,c_iiem,sqr(1-dead_amount)*(dead_fade));
	
	var colour = c_iiem;
	shader_set( shDissolve );

	// Size must be 1 / dimension like so...
	shader_set_uniform_f( shd_dissolve_size, 1 / 32, 1 / 32 );

	// Values from step event, etc.
	shader_set_uniform_f( shd_dissolve_amount, dead_amount );
	shader_set_uniform_f( shd_dissolve_offset, dead_offset );

	// Color split into rgb and made to be from 0.0 to 1.0
	shader_set_uniform_f( shd_dissolve_fade_color,
		colour_get_red( colour ) / 255,
		colour_get_green( colour ) / 255,
		colour_get_blue( colour ) / 255
	);
	// * /
	// draw the sprite
	draw_sprite(sPlayer_float2,round(tick*10),tdead_x+((1-dead_amount)*random_range(-2,2)),tdead_y+((1-dead_amount)*random_range(-2,2)));
	
	/ *
	with(instance_create_depth(tdead_x+random_range(-bwh,bwh),tdead_y+random_range(-bhh,bhh),depth-1,oFx)) {
		sprite_index = sFx_3;//choose(sFx_3,sFx_3,sFx_2);
		image_blend = c_edgb;//make_colour_rgb(255,128,0);
		image_alpha = 1;//(2/3);
		image_speed = mean(random_range(0.05,0.9),0.8);
		speed = random(2)/2;
		direction = mean(point_direction(other.x,other.y,oPlayer.x,oPlayer.y),random(360));
		image_index = 0;
		glow = 1;
		fric = 0.9666;
		draw_end = 1;
	}
	with(instance_create_depth(tdead_x+random_range(-bwh,bwh),tdead_y+random_range(-bhh,bhh),depth-1,oFx)) {
		sprite_index = sFx_2;//choose(sFx_3,sFx_3,sFx_2);
		image_blend = c_edgbbb;//make_colour_rgb(255,128,0);
		image_alpha = 0.5;//(2/3);
		image_speed = mean(random_range(0.05,0.9),0.8);
		speed = random(2)/2;
		direction = mean(point_direction(other.x,other.y,oPlayer.x,oPlayer.y),random(360));
		image_index = 0;
		glow = 1;
		fric = 0.95;
		draw_end = 1;
	}
	///* ////

	shader_reset();
	
	if dead_amount==0 && dead_fade-0.001<0 {
		control = 1;
		UI_OPEN = 0;
		dead = 0;
		hp = ceil(hp_max/2);
		oCamera.follow = oPlayer;
		SOUND_VOLUME = 1;
		with(oControl) {
			save_game();
			map_load(working_directory + "/" + oPlayer.RESPAWN_RM + ".rmlvl",oPlayer.RESPAWN_RM);
		}
		if RESPAWN_RM=="rmMal_Origin" obj_setpos(id,oOrigin.x,oOrigin.y-32) else {
			obj_setpos(id,oBoltoda.x,oBoltoda.y-32);
		}
	}
}
*/

/*
draw_rectangle_view(c_blackink,1);
if keyboard_check(ord("H")) {
	hept_anim *= 0.9;
	if hept_anim<=0 hept_anim2 *= 0.9;} else {hept_anim=reach_tween(hept_anim,1,19); hept_anim2=reach_tween(hept_anim2,1,19);};
	if keyboard_check_pressed(ord("H")) {
		hept_anim = 1;
		hept_anim2 = 1;
	}
	var SZ = (mean(CH/2,CW/2)/2), CMXx=0, CMYy=0;
	for(var j=0; j<7; j++) {
		CMXx = CMX+lengthdir_x((SZ*2)*sqr(1-hept_anim2),(j*(360/7))+90+(hept_anim2*540)+(tick*-10.1));
		CMYy = (CY+CH)+lengthdir_y((SZ*2)*sqr(1-hept_anim2),(j*(360/7))+90+(hept_anim2*540)+(tick*-10.1));
	for(var i=0; i<7; i++) {
		if hept_anim<1 draw_polygon(CMXx+lengthdir_x(SZ*sqr(1-hept_anim),(i*(360/7))+90+((1-hept_anim2)*540)+(tick*21.2)),CMYy+lengthdir_y(SZ*sqr(1-hept_anim),(i*(360/7))+90+((1-hept_anim2)*540)+(tick*21.2)),7,90+(tick*-32.3),SZ/1.5,c_iiem,1,1,0.5,1);
	}
	}
//}
*/

//if (keyboard_check(vk_up) || keyboard_check(vk_down)) && t_click_sfx!=(inv_sel+smelt_choose_n+bag_sel) play_sound(sndMenu_sel,10,0,1,1,0);


//if current_bag==-1 bag_sel_an = reach(bag_sel_an,0,bag_sel_an/7) else bag_sel_an = reach(bag_sel_an,1,(1-bag_sel_an)/100);

/*
draw_set_colour(c_white);
draw_set_alpha(1);
draw_rectangle(x1,y1,x2,y2,1);
draw_text(x+16,y-8,string(vsp)+" "+string(int64(25.7489735967)));

/* //////////// PIE CHART

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var ccx = (cx+(cw/2))+(random_range(-4,4)*cam_shake), ccy = (cy+(ch/2)+(random_range(-4,4)*cam_shake));
draw_rectangle_view(c_black,2/3);

if circ_an>0.6666 circ_ann = reach(circ_ann,circ_an,abs(circ_an-circ_ann)/7);
circ_an = reach(circ_an,circ_go,abs(circ_go-circ_an)/7);

if keyboard_check_pressed(vk_enter) {circ_go = 1; cam_shake=1;};
draw_set_alpha(1);
draw_set_colour(c_white)
draw_primitive_begin(pr_trianglestrip)
//draw_vertex(ccx,ccy);
if circ_an>0 {
	random_set_seed(1234);
	var _sec=0;
	_sec[0] = random_range(5,40);
	_sec[1] = random_range(5,(100-_sec[0])/pi);
	_sec[2] = random_range(5,((100-_sec[0])-_sec[1])/pi);
	_sec[3] = random_range(5,(((100-_sec[0])-_sec[1])-_sec[2])/pi);
	_sec[4] = random_range(5,((((100-_sec[0])-_sec[1])-_sec[2])-_sec[3])/pi);
	
	var _col=0;
	_col[0] = make_colour_hsv(random(255),207,223);
	_col[1] = make_colour_hsv(random(255),207,223);
	_col[2] = make_colour_hsv(random(255),207,223);
	_col[3] = make_colour_hsv(random(255),207,223);
	_col[4] = make_colour_hsv(random(255),207,223);
	var __col = 0;
	randomize();
	for(var i=0; i<=100; i++;) {
	
		if i<=_sec[0] {__col=_col[0];}
		else if i<=(_sec[0]+_sec[1])*circ_ann {__col=_col[1];}
		else if i<=(_sec[0]+_sec[1]+_sec[2])*circ_ann {__col=_col[2];}
		else if i<=(_sec[0]+_sec[1]+_sec[2]+_sec[3])*circ_ann {__col=_col[3];}
		else if i<=(_sec[0]+_sec[1]+_sec[2]+_sec[3]+_sec[4])*circ_ann {__col=_col[4];};
		
		draw_vertex_colour(ccx+lengthdir_x((32+(random_range(-7,7)*cam_shake))*circ_an,i*(360/100)),
		ccy+lengthdir_y((32+(random_range(-7,7)*cam_shake))*circ_an,i*(360/100)),__col,1);
		draw_vertex_colour(ccx,ccy,__col,1);
	}
}
draw_primitive_end();
*/





