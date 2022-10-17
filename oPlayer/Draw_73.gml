
if holding_eo==1 && 1==0 {
	gpu_set_blendmode(bm_add);
	
	var eoLx, eoLy;
	eoLx = oPlayer.x+(facing*5);
	eoLy = oPlayer.y-2;
	draw_circle_colour(eoLx+random_range(-1,1),eoLy+random_range(-1,1),(80+random(1)),$200400,$000000,0);
	draw_circle_colour(eoLx+random_range(-1,1),eoLy+random_range(-1,1),(256+random(1)),$201006,$000000,0);
	draw_circle_colour(eoLx+random_range(-1,1),eoLy+random_range(-1,1),(132+random(1)),$200000,$000000,0);
	
	gpu_set_blendmode(bm_normal);
};

if (respawn==1) {
	control = 0;
	physics = 0;
	draw = 0;
	UI_OPEN = 1;
	vsp = 0;
	hsp = 0;
	gpu_set_blendmode(bm_add)
	draw_sprite_glitch(sPlayer_float,tick*10,x,y-1,1,1,0,make_color_hsv(random(255),128,255),1,random(2));
	gpu_set_blendmode(bm_normal);
	
	create_spark(x,y-1,-123,random(360),
	sqr(random(3.000))*choose(-1,1),sqr(random(1)*7)*choose(-1,1),
	make_colour_hsv(random(255),255,255),make_colour_hsv(random(255),255,255),
	mean(mean(random_range(0.85,0.999)*0.99,1,1),1),sqr((random(1)+0.5)*2)/2);
	
	cam_shake = mean(1,random(2));
	
	death_t = ceil(60*0.333);
	death_ta = death_t;
	death_tA = ceil(((60*0.77777777)-death_t)/3);
	death_t1 = death_tA;
	death_t2 = death_tA;
	death_t3 = death_tA*2;
	death_an = 0;
	
	if (death_final == 1) {
		instance_create_one(x,y,-10,oDlg_Pod7);
		instance_create_one(x,y,-10,oPod7_KS);
		death_final = 2;
	}
};

if CURRENTROOM!=tSAVE_curr_rm {
	SAVE_prev_rm = tSAVE_curr_rm;
	SAVE_prev_x = tSAVE_curr_x;
	SAVE_prev_y = tSAVE_curr_y;
};

if death_an==2 {
	sleep(600);
	
	play_sound(sndBSOD_tone,100,0,1,0.7777777,0);
	
	if (SAVE_prev_rm==-1 || SAVE_prev_rm=="") {
		SAVE_prev_rm = "rmMal_Origin";
		SAVE_prev_x = 360;
		SAVE_prev_y = 134;
	}
	
	if (death_final) {
		SAVE_prev_rm = "rmPod7";
		SAVE_prev_x = 64;
		SAVE_prev_y = 64;
	}
	
	goto_map(SAVE_prev_rm,(death_final==0));
	obj_setpos(oPlayer,SAVE_prev_x,SAVE_prev_y);
	
	tSAVE_curr_rm = SAVE_prev_rm;
	tSAVE_curr_x = SAVE_prev_x;
	tSAVE_curr_y = SAVE_prev_y;
	
	SAVE_curr_rm = SAVE_prev_rm;
	SAVE_curr_x = SAVE_prev_x;
	SAVE_curr_y = SAVE_prev_y;
	
	hp = hp_max;
	vsp = 0;
	hsp = 0;
	damage = 0;
	
	with(parDoor_Flat) {
		open = 0;
		topen = 0;
		anim = 0;
	};
	death_an = 1;
};

if floor(hp)<=1 {
	gpu_set_blendmode_ext(bm_dest_color,bm_zero);
	draw_rectangle_view(merge_color(c_white,$4400ff,mean(0.5+lengthdir_x(0.5,tick*77.7777777),0.5)/2),1);
	//draw_sprite_stretched_ext(sScreen_Glow,0,CX-1,CY-1,CW+2,CH+2,merge_color(c_white,$4400ff,mean(0.5+lengthdir_x(0.5,tick*77.7777777),0.5)),1)
	gpu_set_blendmode(bm_add)
};

if hp<=0 && death_an==0 {
	death_an = 2;
	gpu_set_blendmode_ext(bm_dest_color,bm_zero);
	draw_rectangle_view($4400ff,1);
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sSigil_Fear,0,CMX,CMY,5,5,0,$4400ff,1);
	gpu_set_blendmode(bm_normal)
	
	play_sound(sndDeath,100,0,1,0.2,6000);
	//play_sound(sndDeath_burst,100,0,1,1,0);
	play_sound(sndNea_glitch2,100,0,1,1,0);
};

var aenox_in = 0, aenox_obj=noone;

if ((has_aenox==1) && (control==1 || (aenox_re_time!=-1 && keyboard_check(global.key_aenox) && aenox_re_tick!=-1)) && (UI_OPEN==0)) {
	if (aenox) {
		if instance_number(parAENOX)>0 {
			aenox_obj = instance_nearest(x,y,parAENOX);
			if aenox_obj!=noone {
				if aenox_obj.anim7==1 && point_distance(x,y,aenox_obj.x,aenox_obj.y)<=20 {
					aenox_t *= 0.9;
					aenox_in = 1;
					if keyboard_check_pressed(global.key_aenox) {
						aenox_use = 1;
						aenox_x = aenox_obj.x;
						aenox_y = aenox_obj.y;
						play_sound_pos((aenox_has_power && (aenox_obj.object_index==oAenox_Cell || aenox_obj.object_index==oAenox_Cell_Off))?sndAenox_Make:sndAenox_Take,10,0,mean(1,random_range(0.9,1.1)),random_range(0.7,0.8),irandom(2),x+random_range(-1,1),y+random_range(-1,1));
						with(aenox_obj) {event_user(0);};
					};
				};
			};
		};
	} else
	if (aenox==0) {
		if keyboard_check(global.key_aenox) || aenox_re_tick>=6 {
			hsp *= 0.95;
			control = 0;
			LETTERBOX = 1;
			if (keyboard_check_pressed(global.key_aenox) && (aenox_re_anim == -1) && (aenox_re_tick == -1) && (aenox_re_time == -1)) {
				aenox_re_anim = 0;
				aenox_re_tick = 0;
				aenox_re_getan = 20;
				aenox_re_time = current_time;
				aenox_re_snd = play_sound(sndAenox_build,100,0,1,0.95,0);
			};
			
			if ((current_time)>=(aenox_re_time+500)) {
				aenox_re_time = current_time;
				aenox_re_tick += 1;
			};
			
			if (aenox_re_tick_an!=aenox_re_tick) {
				switch(aenox_re_tick) {
				
					case 0:
					// PLAYER ANIM
					break;
					
					case 1:
					cam_shake += 0.5;
					create_flashline(x+(facing*8),y-10,90,-100,$802008,0,7.7777777/2);
					create_flashline(x+(facing*8),y-10,90,-1,$802008,0,7.7777777);
					create_fx(x+(facing*8),y-9.5,-100,$ff4000,0,0,1,1,1,0,1,sFx_3,0,1,0.95,1/3,0);
					
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 0;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip1,10,0,1,0.9,1);
					break;
				
					case 2:
					cam_p_dir = 90;
					cam_push = 7.7777777;
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,0,77.7777777,77,0,0.7777777,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,0,77.7777777,7,0,0.97777777,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,77.7777777,1,0,0.97777777,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),77.7777777,77,0,0.97777777,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,0,77.7777777,7,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,77.7777777,1,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),77.7777777,77,0,0.9,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					play_sound(sndAenox_boom1,100,0,1,0.9,1);
					break;
					
					case 3:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 1;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip2,10,0,1,0.9,1);
					break;
					
					case 4:
					cam_shake += 1.5;
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					create_poly(x+(facing*8), y-10,-100,7,$ff4010,0,77.7777777,7,0,0.7777777,90,0.7777777,1);
					play_sound(sndAenox_boom2,100,0,1,0.9,1);
					break;
					
					case 5:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 2;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip3,10,0,1,0.9,1);
					break;
					
					case 6:
					cam_p_dir = 90;
					cam_push = 7.7777777/2;
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					create_poly(x+(facing*8), y-10,-100,7,$ff4010,0,77.7777777,7,0,0.7777777,90,0.7777777,1);
					//play_sound(sndAenox_boom3,100,0,1,0.9,1);
					play_sound(sndAenox_collect,100,0,1,0.95,1);
					play_sound(sndAenox_finding,100,0,1,0.95,1);
					aenox_re_finding = 1;
					break;
					
					case 7:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 3;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip4,10,0,1,0.9,1);
					break;
					
					case 8:
					cam_shake += 2;
					
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,0,1,0,0.95,90,-0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),0,77,0,0.95,90,-0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,0,1,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),0,77,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,0,1,0,0.85,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),0,77,0,0.85,90,0.7777777,1);
					play_sound(sndAenox_boom4,100,0,1,0.9,1);
					break;
					
					case 9:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 4;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip5,10,0,1,0.9,1);
					break;
					
					case 10:
					cam_p_dir = 90;
					cam_push = 7.7777777;
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					create_poly(x+(facing*8), y-10,-100,7,$ff4010,0,77.7777777,7,0,0.7777777,90,0.7777777,1);
					play_sound(sndAenox_boom5,100,0,1,0.9,1);
					aenox_re_finding = 2;
					break;
					
					case 11:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 5;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip6,10,0,1,0.9,1);
					break;
					
					case 12:
					cam_shake += 1;
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					create_poly(x+(facing*8), y-10,-100,7,$ff4010,0,77.7777777,7,0,0.7777777,90,0.7777777,1);
					play_sound(sndAenox_boom6,100,0,1,0.9,1);
					break;
					
					case 13:
					create_poly(x+(facing*8), y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					var _b = instance_create_depth(CMX,CMY,-100,oFx_OBSERVER);
					_b.n = 6;
					_b.alpha = 1;
					_b.fade = 0.9;
					_b.image_blend = $ff5002;
					play_sound(sndOBSERVER_blip7,10,0,1,0.9,1);
					break;
					
					case 14:
					play_sound(sndAenox_boom7,100,0,1,0.9,1);
					cam_shake += 3;
					cam_p_dir = 90;
					cam_push = 7.7777777;
					create_poly(x+(facing*8),y-10,-100,7,$0260ff,0,77.7777777,77,0,0.7777777,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,0,77.7777777,7,0,0.97777777,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$0260ff,CHYP+1,77.7777777,1,0,0.97777777,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,power(CHYP+1,2),77.7777777,77,0,0.97777777,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$0260ff,0,77.7777777,7,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$ff4010,CHYP+1,77.7777777,1,0,0.9,90,0.7777777,1);
					create_poly(x+(facing*8),y-10,-100,7,$0260ff,power(CHYP+1,2),77.7777777,77,0,0.9,90,0.7777777,1);
					
					create_poly(x+(facing*8),y-10,-100,7,$802008,7.77777,0,1,0,0.7777777,90,-0.7777777,1);
					
					create_flashline(x+(facing*8),y-10,90,-100,$802008,0,7.7777777/2);
					create_flashline(x+(facing*8),y-10,90,-1,$802008,0,7.7777777);
					create_flashline(x+(facing*8),y-10,90,-1,$802008,0,7.7777777*2);
					
					create_flash($770000,0.9);
					create_lighting_flash($ffff00,0.95);
					play_sound(sndAenox_form,10,0,1,0.9,1);
					repeat(40) {
						create_spark(x+(facing*8),y-10,-100,random(360),random_range(1,7.7777777)*choose(-1,1),random_range(1,77.7777777)*choose(-1,1),$ff7700,$803c00,mean(mean(random_range(0.7777777,1),0.88888885),1),random_range(3,7.7777777)*0.7777777);
					};
					repeat(40) {
						create_spark(x+(facing*8),y-10,-100,random(360),random_range(1,7.7777777)*choose(-1,1),random_range(1,77.7777777)*choose(-1,1),$0260ff,$0000ff,mean(mean(random_range(0.7777777,1),0.88888885),1),random_range(3,7.7777777)*0.7777777);
					};
					break;
					
					case 15:
					//sleep(250);
					/*aenox = 1;
					has_aenox = 1;
					aenox_re_anim = -1;
					aenox_re_tick = -1;
					aenox_re_time = -1;*/
					break;
					
					case 19:
					aenox = 1;
					has_aenox = 1;
					aenox_re_anim = -1;
					aenox_re_tick = -1;
					aenox_re_time = -1;
					break;
				};
				aenox_re_tick_an = aenox_re_tick;
			};
			
			if aenox_re_tick>=6 && aenox_re_tick<16 {
				create_spark(x+(facing*8),y-10,-100,random(360),random_range(1,7.7777777)*choose(-1,1),random_range(1,77.7777777)*choose(-1,1),$ff2000,$770000,mean(random_range(0.7777777,1),0.88888885),random_range(3,7.7777777)*0.5);
			};
			
			if aenox_re_tick>=10 && aenox_re_tick<17 {
				var spx = (random_range(-0.5,0.5)+(x+(facing*8))+lengthdir_x(CHYP,random(360)));
				var spy = (random_range(-0.5,0.5)+(y-10)+lengthdir_x(CHYP,random(360)));
				create_spark(spx,spy,
				-100,point_direction(spx,spy,x+(facing*8),y-10),sqrt(point_distance(spx,spy,x+(facing*8),y-10)/2),
				0,$ff7707,$770700,mean(random_range(0.7777777,1),0.88888885),
				random_range(3,7.7777777)*0.5);
			};
			
			if aenox_re_tick>=12 && aenox_re_tick<16 {
				if choose(0,0,0,0,1) create_flashline(x+(facing*8),y-10,choose(0,180)-90,-100,$501004,0,random_range(0.1,2));
				
				var spx = (random_range(-0.5,0.5)+(x+(facing*8))+lengthdir_x(48,random(360)));
				var spy = (random_range(-0.5,0.5)+(y-10)+lengthdir_x(48,random(360)));
				create_fx(spx,spy,
				-100,$ff4001,random_range(1,7.7777777)/2,point_direction(spx,spy,x+(facing*8),y-10),
				1,1,1,0,0.95,sFx_3r,0,1,0.95,1,0);
			};
			
			if aenox_re_finding==1 {
				draw_set_colour($ff7700);
				draw_set_font(fnt3);
				draw_set_alpha(1);
				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				
				gpu_set_blendmode(bm_add);
				draw_text(mean(CMX,CX,CX,CX,CX),CY+48,string_n_glitch("> locating aenox _",aenox_re_finding_an));
				gpu_set_blendmode(bm_normal);
				aenox_re_finding_an = reach(aenox_re_finding_an,1,1/60);
			};
			/*if aenox_re_tick>=4 && aenox_re_tick<14 {
				set_cam_scale(0.5,7);
			} else*/
			if aenox_re_tick>=14 {
				//set_cam_scale(2,7);
			};
			
		} else {
			//aenox_re_anim_an *= 0.9;
			//aenox_re_tick_an *= 0.9;
			//aenox_re_tick_an = floor(aenox_re_tick_an);
			aenox_re_anim = -1;
			aenox_re_tick = -1;
			aenox_re_time = -1;
			aenox_re_finding = 0;
			aenox_re_finding_an = 0;
			audio_sound_gain(aenox_re_snd,0,1000);
		};
	};
};
if aenox_in==0 aenox_t = 1;

if aenox_obj!=noone && playerhascontrol() {
	
	gpu_set_blendmode(bm_add);
	
	draw_set_font(FONT_MAIN);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text_color(((CX+CW)-(CW/14))-5,(CY+CH-10)+lengthdir_y(0.777,tick*777.777),
	string_n_glitch(oControl.CONTROL_MODE?chr(700):"A",round(1-aenox_t)),
	merge_colour($441111,$ffff44,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*220*2)))))),
	merge_colour($441111,$ffff44,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*100*2)+90))))),
	merge_colour($441111,$ffff44,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*140*2)+270))))),
	merge_colour($441111,$ffff44,sqr(sqr(sqr(0.5+lengthdir_x(0.5,(tick*180*2)+180))))),1-aenox_t);
	
	draw_text_color(((CX+CW)-(CW/14))-5,(CY+CH-10)+lengthdir_y(0.777,tick*777.777),
	string_n_glitch(oControl.CONTROL_MODE?chr(700):"A",round(1-aenox_t)),
	merge_colour(c_black,$ff8811,sqr(0.5+lengthdir_x(0.5,(tick*77.77777*2)))),
	merge_colour(c_black,$ff8811,sqr(0.5+lengthdir_x(0.5,(tick*77.77777*2)+90))),
	merge_colour(c_black,$ff8811,sqr(0.5+lengthdir_x(0.5,(tick*77.77777*2)+270))),
	merge_colour(c_black,$ff8811,sqr(0.5+lengthdir_x(0.5,(tick*77.77777*2)+180))),1-aenox_t);
	
	//draw_polygon(aenox_obj.x,aenox_obj.y,7,90,24+(8*aenox_t),$ff8000,1,1,sqr(1*(1-aenox_t)),1);
	//draw_polygon(aenox_obj.x+1,aenox_obj.y+1,27,-90,21+aenox_t
	//,$ff0000,1,1,sqr(1*(1-aenox_t))*2,1-aenox_t);
	//draw_set_color($ff0000);
	//draw_line_width(aenox_obj.x,aenox_obj.y+20,aenox_obj.x,lerp(CY+CH+1,aenox_obj.y,aenox_t),sqr(1*(1-aenox_t))*2);
	gpu_set_blendmode(bm_normal);
};
/*
//draw_clear_alpha(make_color_hsv(mean(127,flash_col),128,255),1);
//draw_clear_alpha(0,1);
draw_clear_alpha($ffff00,1)
gpu_set_blendmode(bm_add);
draw_circle_color(CMX+random_range(-8,8),CMY+random_range(-8,8),mean(64,random(32)),make_color_hsv(random(255),255,127),c_black,0);
draw_circle_color(CMX+random_range(-8,8),CMY+random_range(-8,8),mean(64,random(32)),make_color_hsv(random(255),255,127),c_black,0);
draw_circle_color(CMX+random_range(-8,8),CMY+random_range(-8,8),mean(64,random(32)),make_color_hsv(random(255),255,127),c_black,0);
draw_circle_color(CMX+random_range(-8,8),CMY+random_range(-8,8),mean(64,random(32)),make_color_hsv(random(255),255,127),c_black,0);
gpu_set_blendmode(bm_normal);
//flash_col = (flash_col*.9) + (mean(127,random(255))*.1);//reach_tween(flash_col,random(255),7);

var _H = sqr(((tick*100) mod 100)/100);
draw_polygon(CMX+random_range(-1,1),CMY+random_range(-1,1),7,(tick*120),(387*(_H))-10,$000000,1,1,4,1);
var _H = sqr((((tick*100)+50) mod 100)/100);
draw_polygon(CMX+random_range(-1,1),CMY+random_range(-1,1),7,((tick*-120)+180),(387*(_H))-10,$000000,1,1,4,1);

draw_sprite_ext(sPlayer_float,floor(tick*10),CMX+random_range(-1,1),CMY+random_range(-1,1),1,1,0,c_black,1);
*/
if (aenox_has_power_an+(1-aenox_t))>0 && !surface_exists(aenox_surf) aenox_surf = surface_create(38,130);//surface_create(25*2,48*2);
if surface_exists(aenox_surf) && playerhascontrol() {
	surface_set_target(aenox_surf)
	draw_clear_alpha(0,0);
	
	mask_set(-1,-1,39,131);
	draw_sprite(sUI_aenox,0,0,0);
	mask_draw()
	draw_set_color($ff0000);
	draw_set_alpha(1);
	draw_circle(0,49,55.5*(1-sqr(aenox_t)),0);
	if aenox_has_power_an>0 {
	var _H = sqr(((tick*100) mod 100)/100);
	draw_polygon(17,8,7,(tick*120),(65*(_H))-9,$ff6000,aenox_has_power_an,1,9*aenox_has_power_an,1);
	draw_polygon(17,8,7,(tick*120),(65*(_H)),$ffff00,aenox_has_power_an,1,9*aenox_has_power_an,1);
	var _H = sqr((((tick*100)+50) mod 100)/100);
	draw_polygon(17,8,7,((tick*-120)+180),(65*(_H))-9,$ff6000,aenox_has_power_an,1,9*aenox_has_power_an,1);
	draw_polygon(17,8,7,((tick*-120)+180),(65*(_H)),$ffff00,aenox_has_power_an,1,9*aenox_has_power_an,1);
	}
	mask_reset();
	surface_reset_target();
	draw_set_alpha(1);
	gpu_set_blendmode(bm_add);
	draw_surface(aenox_surf,((CX+CW)-(CW/7))-25,(CY+CH)-48);
	gpu_set_blendmode(bm_normal);
	
	if aenox_obj!=noone {
	surface_set_target(aenox_surf)
	draw_clear_alpha(0,0);
	draw_set_color($ff0000);
	draw_set_alpha(1);
	
	draw_polygon(19,19,27,-90,18+aenox_t
	,$ff0000,1,1,sqr(1*(1-aenox_t))*2,1-aenox_t);
	
	//draw_line_width(18,18+17,
	//18,lerp(132,18,1-sqr(1-aenox_t)),(1-aenox_t)*2);
	surface_reset_target();
	draw_set_alpha(1);
	gpu_set_blendmode(bm_add);
	draw_surface(aenox_surf,aenox_obj.x-19,aenox_obj.y-19);
	gpu_set_blendmode(bm_normal);
	}
	if (aenox_has_power_an+(1-aenox_t))<=0 surface_free(aenox_surf);
};

inv_open_an = reach_tween(inv_open_an,inv_open,6);
ui_menu_an = reach_tween(ui_menu_an,ui_menu,6);

aenox_has_power_an = reach_tween(aenox_has_power_an,aenox_has_power,7);

inv_open_book_an = reach_tween(inv_open_book_an,inv_open_book*inv_open,7);
inv_open_tool_an = reach_tween(inv_open_tool_an,inv_open_tool*inv_open,7);
inv_open_planet_an = reach_tween(inv_open_planet_an,inv_open_planet*inv_open,7);

inv_sel_an = reach_tween(inv_sel_an,inv_sel,3.5);

planet_menu_an = reach_tween(planet_menu_an,planet_menu,7);
planet_menu_sel_an = reach_tween(planet_menu_sel_an,planet_menu_sel,7);

/*tool_on_an = reach_tween(tool_on_an,tool_on,5.5);
inv_choose_an = reach_tween(inv_choose_an,inv_choose,5.5);
inv_choose_on_an = reach_tween(inv_choose_on_an,inv_choose_on,5.5);
bag_sel_an = reach_tween(bag_sel_an,(current_bag!=-1),5.5);
bag_sel_ann = reach_tween(bag_sel_ann,bag_sel,5.5);*/

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

var HAS_BOOKS = 0;
if ds_exists(books,ds_type_list) HAS_BOOKS = (ds_list_size(books)>=1); else books = ds_list_create();
/*
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
	
	hxp = reach_tween(hxp,mean(CMX,xprevious),pi);
	hyp = reach_tween(hyp,mean(mean(y,CY+CH),yprevious+23.5),pi);
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
	// *
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
*/
if inv_open_an>0 {
	draw_rectangle_view(c_black,inv_open_an*0.77777777);
	/*if !surface_exists(pause_surf) pause_surf = surface_create(CW,CH);
		
	surface_set_target(pause_surf);
	draw_clear_alpha(0,1);
	camera_apply(cam);
	surface_reset_target();
	*/
	//if surface_exists(pause_surf) draw_surface(pause_surf,CX,CY);
	
	//draw_rectangle_view(c_black,inv_open_an*0.77777777);
	var MAIN_AN = (inv_open_an*(1-ui_menu_an));
	draw_sprite_stretched_ext(sScreen_Glow,0,CX-3,CY-3,CW+6,CH+6,c_black,inv_open_an);
	if MAIN_AN>0 {
		var _bagY = mean((CMY+(40*(1-MAIN_AN))+12),CY+CH), sqrtioa = 1;//mean(inv_open_an,1,sqrt(inv_open_an));
	
		gpu_set_blendmode(bm_add);
	
		draw_sprite_ext(sUI_bag,MAIN_AN>0.9666,CMX,_bagY,1,1,0,$ffff00,sqr(sqr(MAIN_AN)));
	
		/*if ds_list_size(PLANET_FOUND)>0 {
			draw_ui_arrow(0,CMX-(40*MAIN_AN),_bagY-16,3,merge_color(c_black,$ffff00,sqr(sqr(MAIN_AN))));
			draw_sprite_ext(sBag_UI,0,mean(mean(CMX-(40*MAIN_AN),CX),CMX-74)+16,_bagY-32,sqrtioa,sqrtioa,0,$0080ff,sqr(power(MAIN_AN,7)));
		};*/
		
		if instance_exists(oEo) {
			draw_ui_arrow(0,CMX-(40*MAIN_AN),_bagY-16,3,merge_color(c_black,$ffff00,sqr(sqr(MAIN_AN))));
			draw_sprite_ext(sBag_UI,0,mean(mean(CMX-(40*MAIN_AN),CX),CMX-74)+8,_bagY-32,sqrtioa,sqrtioa,0,$0080ff,sqr(power(MAIN_AN,7)));
		}
		
		if oPlayer.has_telarod>=1 {
			//draw_ui_arrow(0,CMX+(40*MAIN_AN),_bagY-16,1,merge_color(c_black,$ffff00,sqr(sqr(MAIN_AN))));
			draw_sprite_ext(sBag_UI,2,mean(mean(CMX+(40*MAIN_AN),CX+CW),CMX+74)-16,_bagY-32,sqrtioa,sqrtioa,0,$0080ff,sqr(power(MAIN_AN,7)));
		};
		
		if oPlayer.aenox>=1 draw_sprite_ext(sBag_UI,3,mean(mean(CMX+(40*MAIN_AN),CX+CW),CMX+74)-16,_bagY-32,sqrtioa,sqrtioa,0,$0080ff,sqr(power(MAIN_AN,7)));
		
		if HAS_BOOKS {
			draw_ui_arrow(0,CMX,_bagY-(54*MAIN_AN),0,merge_color(c_black,$ffff00,sqr(sqr(MAIN_AN))));
			draw_sprite_ext(sBag_UI,1,CMX,mean(CY+1,_bagY-(54*MAIN_AN)),sqrtioa,sqrtioa,0,$0080ff,sqr(power(MAIN_AN,7)));
		};
		
		if MAIN_AN>0.95 && ui_menu==0 {
			if HAS_BOOKS && keyboard_check_pressed(vk_up) {
				inv_open_book = 1;
				ui_menu = 1;
				inv_open_book_an = 0;
				inv_sel_an2 = 0;
				inv_sel = 0;
				inv_sel_an = 0;
				play_sound(choose(sndBackpack_01,sndBackpack_02,sndBackpack_03,sndBackpack_04,sndBackpack_05,sndBackpack_06,sndBackpack_07),10,0,mean((random_range(0.9,1.1)*0.9),1),0.5,1);
			} else
			if keyboard_check_pressed(vk_left) && instance_exists(oEo) {
				/*inv_open_planet = 1;
				ui_menu = 1;
				inv_open_planet_an = 0;
				inv_sel_an2 = 0;
				inv_sel = 0;
				inv_sel_an = 0;
				//play_sound(choose(sndBackpack_01,sndBackpack_02,sndBackpack_03,sndBackpack_04,sndBackpack_05,sndBackpack_06,sndBackpack_07),10,0,mean((random_range(0.9,1.1)*0.9),1),0.5,1);
				load_planet_info();*/
				
				keyboard_key_press(global.key_inv);
				control = 1;
				oEo.control = 1;
				oEo.force_ui = 1;
				//oEo.ui_open = 1;
				//play_sound(sndEO_ui_open,10,0,mean(1,random_range(0.9,1.1)),.7777777,0);
				//keyboard_key_press(global.key_eo);
			} else
			if keyboard_check_pressed(vk_right) && 1==0 {
				inv_open_tool = 1;
				ui_menu = 1;
			} else
			if keyboard_check_pressed(vk_down) {
				keyboard_key_press(global.key_inv);
			};
		};
	};
	
	if inv_open_book_an>0 && ds_list_size(books)>0 && is_array(book_desc) {
		gpu_set_blendmode(bm_subtract);
		draw_rectangle_color(CX-1,CY-1,CX+CW+1,CY+CH+1,0,0,merge_colour(0,$dfdfdf,inv_open_book_an),merge_colour(0,$dfdfdf,inv_open_book_an),0);
		gpu_set_blendmode(bm_normal);
		var _tinv_sel = inv_sel;
		if inv_open_book==1 && inv_open_book_an>0.95 inv_sel += (keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left));
		inv_sel = clamp(inv_sel,0,ds_list_size(books)-1);
		if _tinv_sel!=inv_sel inv_sel_an2 = 0;
		draw_set_colour(c_ink);
		var _COL = c_ink;
		draw_set_font(fnt4);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var _tempx, _tempy;
		for (var i = 0; i < ds_list_size(books); ++i) {
			_tempx = CMX+((i-inv_sel_an)*21);
			_tempy = (lerp(CY+CH+76,mean(((CY+CH)+160)+lengthdir_y(80,90+((i-inv_sel_an)*10))+lengthdir_y(80,90+((i-inv_sel_an)*30)),
			(CY+CH),(CY+CH)),sqr(inv_open_book_an))-16)-(sqr(sqr(inv_sel_an2*(inv_sel==i)))*2);
		
			if (inv_sel==i) {
				gpu_set_blendmode(bm_add);
				draw_sprite_ext(sBook_spine,0,_tempx,_tempy,1,1,0,$ffff00,sqr(sqr(inv_sel_an2)));
				gpu_set_blendmode(bm_normal);
			}
		
		    draw_sprite_ext(sBook_spine,2+(book_desc[@ (books[| i]),3]),_tempx,_tempy,1,1,0,c_white,inv_open_book_an);
			draw_sprite_ext(sBook_spine,1,_tempx,_tempy,1,1,0,c_white,inv_open_book_an);
		
			draw_text_transformed_color(_tempx,_tempy-43,string_upper(book_desc[@ (books[| i]),0]),1,1,-90,_COL,_COL,_COL,_COL,(2/3)*inv_open_book_an);
		}
		/*
		draw_sprite_stretched_ext(sScreen_Glow,0,CX-2,CY-2,CW+4,CH+4,c_black,inv_open_book_an);
	
		gpu_set_blendmode(bm_subtract);
		draw_rectangle_color(CX-1,(CY+CH)-16,CX+CW+1,CY+CH+1,0,0,merge_colour(0,$a9a9a9,inv_open_book_an),merge_colour(0,$a9a9a9,inv_open_book_an),0);
		gpu_set_blendmode(bm_add);
		*/
		gpu_set_blendmode(bm_add);
		//for (var i = 0; i < ds_list_size(books); ++i) {
		//	draw_sprite_ext(sPixel,((inv_sel==i)?8:7),CMX+((i-inv_sel_an)*6),((CY)+10)+sqr(sqr(inv_sel_an2*(inv_sel==i))),1,1,0,((inv_sel==i)?$ffff00:$0080ff),sqr(sqr(inv_open_book_an)));
		//}
	
		draw_set_colour(merge_color(0,$ffff00,sqr(inv_open_book_an*inv_sel_an2)));
		draw_set_font(fnt3);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		//gpu_set_blendmode(bm_add);
		draw_text(CMX,mean(CY,CMY)-8,string_lower(string_n_glitch(book_desc[@ (books[| inv_sel]),0],inv_sel_an2)));
		draw_set_font(FONT_MAIN);
		draw_set_colour(merge_color(0,$0080ff,sqr(inv_open_book_an)*inv_sel_an2*inv_sel_an2));
		draw_text(CMX,mean(CY,CMY)+8,book_desc[@ (books[| inv_sel]),1]);
		draw_text(CMX,mean(CY,CMY)-24,book_desc[@ (books[| inv_sel]),2]);
		
		draw_ui_arrow(0,CMX,mean(mean(CY,CMY)+8,(CY+CH)-50)+((1-(inv_open_book_an))*4),0,merge_color(0,$ffff00,inv_open_book_an*sqr(inv_open_book_an*inv_sel_an2)));
		
		draw_ui_arrow(0,CMX,(CY+CH+32)-(48*inv_open_book_an),2,$0080ff);
		
		gpu_set_blendmode(bm_normal);
		inv_sel_an2 = reach(inv_sel_an2,1,1/20);
	
		if inv_open_book_an>0.95 && inv_open_book==1 {
			if keyboard_check_pressed(vk_up) {
				open_book(books[| inv_sel],1);
				inv_open_book = 0;
				control = 0;
				play_sound(choose(sndBook_slide_01,sndBook_slide_02,sndBook_slide_03,sndBook_slide_03),10,0,(random_range(0.9,1.1)*0.9),2/3,1);
			} else
			if keyboard_check_pressed(vk_down) {
				inv_open_book = 0;
				ui_menu = 0;
				play_sound(choose(sndBackpack_Quiet_01,sndBackpack_Quiet_02,sndBackpack_Quiet_03,sndBackpack_Quiet_04,sndBackpack_Quiet_05,sndBackpack_Quiet_06,sndBackpack_Quiet_07),10,0,mean((random_range(0.9,1.1)*0.9),1),2/3,1);
			};
		};
	};
	
	if inv_open_planet_an>0 && ds_list_size(PLANET_FOUND)>0 {
		
		var _AN = sqr(inv_open_planet_an*(1-planet_menu_an));
		
		gpu_set_blendmode(bm_subtract);
		draw_rectangle_color(CX-1,CY-1,CX+CW+1,CY+CH+1,0,merge_colour(0,$dfdfdf,inv_open_planet_an),merge_colour(0,$dfdfdf,inv_open_planet_an),0,0);
		gpu_set_blendmode(bm_add);
		
		draw_set_alpha(inv_open_planet_an);
		
		if _AN>0 {
		var _tinv_sel = inv_sel;
		if planet_menu==0 && inv_open_planet==1 && inv_open_planet_an>0.95 inv_sel += (keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up));
		inv_sel = clamp(inv_sel,0,ds_list_size(PLANET_FOUND)-1);
		if _tinv_sel!=inv_sel inv_sel_an2 = 0;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		mask_set(CX-1,CY-1,CX+CW+1,CY+CH+1);
		var _cmx, _cmy;//, a4=0;
		for (var i = 0; i < ds_list_size(PLANET_FOUND); ++i) {
			
			_cmx = (CMX+((1-_AN)*16)+(abs(inv_sel_an-i)*32));
			_cmy = CMY-((inv_sel_an-i)*96);
			
			draw_set_alpha(sqr(_AN));
			draw_sprite_ext(sDiscover,PLANET_FOUND[| i],_cmx,_cmy,1,1,0,((inv_sel==i)?$ffff00:$0080ff),sqr(_AN));
			draw_set_alpha(0);
			
			_cmx = (CMX+((1-_AN)*16)+(abs(inv_sel_an-i)*32))-(16*sqr(inv_sel_an2)*(inv_sel==i));
			_cmy = CMY-((inv_sel_an-i)*140);
			
			draw_rectangle(CX,hrnd(_cmy-14),CX+CW,hrnd(_cmy+14),0);
			draw_rectangle(CX,hrnd(_cmy+12),CX+CW,hrnd(_cmy+25),0);
			
			draw_set_alpha(sqr(_AN));
			draw_set_font(fntTHICC);
			draw_text(_cmx,_cmy,planet_info[@ PLANET_FOUND[| i],0]);
			draw_set_font(FONT_MAIN);
			draw_text(_cmx,_cmy+19,planet_info[@ PLANET_FOUND[| i],1]);
		}
		
		mask_draw();
		draw_set_alpha(sqr(sqr(_AN)));
		draw_set_color($0080ff);
		draw_circle(CMX,CMY,CHYP*_AN,0);
		draw_set_color(merge_color($0080ff,$ffff00,power(inv_sel_an2,12)));
		draw_set_alpha(power(inv_sel_an2,12));
		draw_rectangle(CX,CMY-12,CX+CW,CMY+24,0);
		mask_reset();
		};
		gpu_set_blendmode(bm_add);
		/*
		draw_set_font(fnt3);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_colour(merge_color(0,$ffff00,sqr(inv_open_planet_an*inv_sel_an2)));
		draw_text(CMX,mean(CY,CMY),string_lower(string_n_glitch(planet_info[@ inv_sel,0],inv_sel_an2)));
		
		draw_set_font(FONT_MAIN);
		draw_set_colour(merge_color(0,$0080ff,sqr(inv_open_planet_an)*inv_sel_an2*inv_sel_an2));
		draw_text(CMX,mean(CY,CMY)+16,planet_info[@ inv_sel,1]);
		draw_text(CMX,CMY,planet_info[@ inv_sel,2]);
		*/
		
		if planet_menu_an>0 {
			var _tinv_sel = planet_menu_sel;
			if planet_menu_an>0.5 && planet_menu==1 && inv_open_planet==1 && inv_open_planet_an>0.5 planet_menu_sel += (keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up));
			planet_menu_sel = clamp(planet_menu_sel,0,1);
			if _tinv_sel!=planet_menu_sel inv_sel_an2 = 0;
			
			var _AN = sqr(inv_open_planet_an*(planet_menu_an)), WW = ceil((ceil(CH+0.5)+8)/2);
			var WWH = WW*0.77777777777, WWSR = sqrt(WW*2), WER;
			
			draw_set_alpha(_AN);
			
			draw_sprite_ext(sDiscover,PLANET_FOUND[| inv_sel],(CX+CW+32)-(32*planet_menu_an),CMY,1,1,0,$002a54,_AN);
			
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
			for (var i = 0; i < 2; ++i) {
				WWH = string_height(planet_info[@ inv_sel,planet_menu_sel+2])+8;
				
				WER = mean(((planet_menu_sel_an-i)*WW*0.5),(sqr((planet_menu_sel_an-i)*WWSR)*sign((planet_menu_sel_an-i))));
				
				gpu_set_blendmode(bm_normal);
				draw_set_alpha(_AN/2);
				draw_set_color(c_black);
				draw_rectangle(CMX-WW,(CMY-WWH)-WER,CMX+WW,(CMY+WWH)-WER,0);
				gpu_set_blendmode(bm_add);
				draw_set_alpha(_AN);
				draw_set_color($0080ff);
			    draw_text_transformed(CMX,CMY-WER,planet_info[@ inv_sel,i+2],1,1,0);
				
				draw_rectangle((CMX-WW)-1,((CMY-WWH)-WER)-1,CMX+WW,(CMY+WWH)-WER,1);
			}
			draw_line((CMX-WW)-1,CY-1,(CMX-WW)-1,CY+CH+1);
			
			
		};
		
		draw_set_alpha(inv_open_planet_an);
		
		draw_ui_arrow(0,(CX+CW+32)-(48*inv_open_planet_an),CMY,1,$0080ff);
		
		if sqr(inv_sel_an2)>0.5 && planet_menu==0 {
			draw_ui_arrow(0,(CX-32)+(48*_AN*sqr(inv_sel_an2)),CMY,3,$ffff00);
			
			if keyboard_check_pressed(vk_left) {
				planet_menu = 1;
				planet_menu_sel = 0;
				planet_menu_sel_an = 0;
				inv_sel_an2 = 0;
			};
		};
		
		gpu_set_blendmode(bm_normal);
		
		inv_sel_an2 = reach_tween(inv_sel_an2,1,11);
		
		if inv_open_planet_an>0.95 && inv_open_planet==1 {
			if keyboard_check_pressed(vk_right) {
				if planet_menu==0 && planet_menu_an<0.5 {
					inv_sel_an2 = 0;
					inv_open_planet = 0;
					ui_menu = 0;
					play_sound(choose(sndBackpack_Quiet_01,sndBackpack_Quiet_02,sndBackpack_Quiet_03,sndBackpack_Quiet_04,sndBackpack_Quiet_05,sndBackpack_Quiet_06,sndBackpack_Quiet_07),10,0,mean((random_range(0.9,1.1)*0.9),1),2/3,1);
				} else
				if planet_menu==1 && planet_menu_an>=0.5 {
					planet_menu = 0;
					inv_sel_an2 = 0;
				};
			};
		};
	};
	gpu_set_blendmode(bm_normal);
};

#region INVENTORY  :(
/*
// HEPTAMENU
var col_inside = c_black;//(instance_number(LIGHTING)>=1)?merge_colour(c_dkgray,c_black,0.5):c_black;
if inv_choose_an>0 {
	var inchan = inv_choose_an;
	draw_sprite_ext(state,anim,x,y,facing,1,0,c_white,alpha*inchan);
	gpu_set_blendmode(bm_add);
	draw_polygon(lerp(CMX,mean(CMX,x),inchan),lerp(CMY,mean(y,CY+CH),inchan),7,(inv_choose_on_an*(360/7))-90,lerp(0,mean(y,CY+CH)-(y-32),inchan),make_colour_rgb(255,64,0),sqr(sqr(inchan)),1,1,1);
	draw_set_alpha(sqr(sqr(sqr(sqr(inchan)))));
	draw_set_colour(c_orange);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(FONT_MAIN);
	var length = (lerp(0,mean(y,CY+CH)-(y-35),inchan)), dire = 0, ix = 0, iy = 0;
	for(var i=0; i<3; i++) {
		dire = (inv_choose_on_an*(360/7))-(i*(360/7))+90;
		ix = lerp(CMX,mean(CMX,x),inchan);
		iy = lerp(CMY,mean(y,CY+CH),inchan);
		draw_text_transformed(ix+lengthdir_x((length-3),dire),iy+lengthdir_y(length-3,dire),INV_CHOOSE[i],1,1,dire-90);
		if i==2 {
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(sUtilities,2,mean(CMX,x)+((i-inv_choose_on_an)*64),mean(y,CY+CH),1,1,0,c_white,sqr(sqr(sqr(inchan))*max(1-abs(i-inv_choose_on_an),0)));
			gpu_set_blendmode(bm_add);
		}
		else
		if i==1 {
			gpu_set_blendmode(bm_normal);
			draw_sprite_ext(sUtilities,1,mean(CMX,x)+((i-inv_choose_on_an)*64),mean(y,CY+CH),1,1,0,c_white,sqr(sqr(sqr(inchan))*max(1-abs(i-inv_choose_on_an),0)));
			gpu_set_blendmode(bm_add);
		}
	}
	gpu_set_blendmode(bm_normal);
}

if oControl.mode==3 && ((control==1 && UI_OPEN==0) || (inv_choose==1 || inv_open_an>0 || craft_open==1)) {
	var c_gloworange = make_colour_rgb(255,111,1);
	if craft_open==1 {
		if keyboard_check_pressed(ord("E")) {
			craft_open = 0;
		}
	}
	else
	if inv_open==1 {
		if keyboard_check_pressed(ord("E")) {
			inv_open = 0;
		}
		else
		{
			if inv_open_an>0 {
				var inv_size = ds_list_size(INV), item_id = -1, med_inv_size = ds_list_size(MED_INV);
				//draw_rectangle_view(c_black,inv_open_an*0.5);
				if inv_open_an>0.8 {
					if current_bag==-1 { // CHOOSE BAG POCKET
						bag_sel += (keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up));
						bag_sel = clamp(bag_sel,0,array_length_1d(bag_n)-1);
						if keyboard_check_pressed(vk_right) {
							current_bag = bag_sel;
							current_bag_prev = bag_sel;
							inv_sel=0;
							inv_sel_an=-3;
							inv_sel_an2=-3;
							inv_sel_an3=-3;
						}
					}
					else
					if current_bag!=-1 && current_bag_prev!=-1 && bag_sel_an>0.8 {
						if keyboard_check_pressed(vk_left) current_bag=-1;
						if current_bag!=-1 {
							inv_sel += (keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up));
							if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_up)) {med_use=0; med_use_click=0;};
							if current_bag==0 inv_sel = clamp(inv_sel,0,ds_list_size(INV)-1) else if current_bag==1 inv_sel = clamp(inv_sel,0,ds_list_size(MED_INV)-1);
						}
					}
				}
				draw_set_color(col_inside);
				draw_set_alpha(sqr(sqr(inv_open_an*0.841)));
				draw_set_circle_precision(52);
				draw_circle(CX,CMY,lerp((CW/8)+138.5,(point_distance(CX,CMY,CX+CW,CY))+1,bag_sel_an)*inv_open_an,0);
				draw_set_alpha(sqr(sqr(inv_open_an*0.841*bag_sel_an)));
				draw_circle(CX,CMY,((CW/8)+138.5)*bag_sel_an,0);
				draw_set_circle_precision(24);
				
				draw_set_alpha(1);
				
				draw_sprite_ext(sArrow,0,CMX+(6.5*sqr(inv_open_an)),CMY,1+(1-bag_sel_an),1+(1-bag_sel_an),225+(180*bag_sel_an),c_aqua,sqr(sqr(inv_open_an)));
				
				draw_set_valign(fa_middle);
				
				if ((1-bag_sel_an)*inv_open_an)>0 {
					control = 0;
					draw_set_alpha(((1-bag_sel_an)*inv_open_an));
					draw_set_font(fntBIG);
					gpu_set_blendmode(bm_add);
					
					draw_sprite_ext(sBag_UIImages,0,mean(CX+CW,CX+(CW/8)+120)+((CW/5)*bag_sel_an)+((CW/5)*(1-inv_open_an)),CMY-(abs(0-bag_sel_ann)*(CH/4)),1,1,0,c_gloworange,sqr(sqr((clamp(1-abs(0-bag_sel_ann),0,1)*inv_open_an))*sqr(1-bag_sel_an)));
					
					for(var i=0; i<array_length_1d(bag_n); i++) {
						sprota = 10;//+(abs(i-bag_sel_ann)*4);
						draw_set_colour((bag_sel==i)?c_aqua:c_gloworange);
						draw_set_halign(fa_right);
						draw_text(CX+lengthdir_x((((CW/8)+117)+((CW/2)*bag_sel_an)),sprota*(i-bag_sel_ann)),
						CMY-lengthdir_y((((CW/8)+117)+((CW/2)*bag_sel_an)),sprota*(i-bag_sel_ann)),string_n_glitch(bag_n[i],sqr(min(sqr(sqr(sqr(inv_open_an)))+0.05,1))));
					}
					gpu_set_blendmode(bm_normal);
					
					//draw_sprite_ext(sBag_UIImages,0,mean(CX+CW,CX+(CW/8)+120)+((CW/5)*bag_sel_an)+((CW/5)*(1-inv_open_an)),CMY-(abs(0-bag_sel_ann)*(CH/4)),1,1,0,c_gloworange,sqr((clamp(1-abs(0-bag_sel_ann),0,1)*inv_open_an))*0.5*(1-bag_sel_an));
				}
				
				if bag_sel_an>0 {
					draw_set_font(FONT_MAIN);
					draw_set_alpha(1);
					var item_id = 0, sprota = 0;
					for(var i=max(inv_sel-6,0); i<min(inv_sel+6,inv_size); i++) {
						item_id = (INV[| i]);
						sprota = 18+abs(i-inv_sel_an);
						draw_set_alpha(sqr(sqr(((1-sqr(sqr((abs(i-inv_sel_an))/5)))*inv_open_an)*bag_sel_an)));
						//draw_set_alpha(inv_open_an*bag_sel_an);
						
						if inv_sel==i {
							gpu_set_blendmode(bm_add);
							gpu_set_fog(1,c_aqua,1,1);
							draw_sprite(sItems,item_id,
							(CX+lengthdir_x(((CW/8)+24),sprota*(i-inv_sel_an2)))+1,
							(CMY-lengthdir_y(((CW/8)+24),sprota*(i-inv_sel_an2))));
							draw_sprite(sItems,item_id,
							(CX+lengthdir_x(((CW/8)+24),sprota*(i-inv_sel_an2)))-1,
							(CMY-lengthdir_y(((CW/8)+24),sprota*(i-inv_sel_an2))));
							draw_sprite(sItems,item_id,
							(CX+lengthdir_x(((CW/8)+24),sprota*(i-inv_sel_an2))),
							(CMY-lengthdir_y(((CW/8)+24),sprota*(i-inv_sel_an2)))-1);
							draw_sprite(sItems,item_id,
							(CX+lengthdir_x(((CW/8)+24),sprota*(i-inv_sel_an2))),
							(CMY-lengthdir_y(((CW/8)+24),sprota*(i-inv_sel_an2)))+1);
							gpu_set_fog(0,0,0,0);
							gpu_set_blendmode(bm_normal);
						}
						
						if i>=(inv_sel-1) && i<=(inv_sel+1) {
							random_set_seed(i)
							for(var j=0; j<INV_N[| i]; j++) {
								draw_sprite_ext(sItems,item_id,
								(mean(CX+CW,CX+(CW/8)+120))+(((random_range(-80,80)/3)>>1)<<1)+irandom_range(-2,2)+irandom_range(-2,2),
								(CMY-((i-inv_sel_an)*(CH/6)))+(((random_range(-80,80)/3)>>1)<<1)+irandom_range(-2,2)+irandom_range(-2,2),
								1,1,0,merge_colour(c_ltgray,c_gray,0.5),sqr(sqr(bag_sel_an)*draw_get_alpha()*clamp(1-abs(i-inv_sel_an),0,1))/2);
							}
							randomize();
							draw_set_font(fnt4);
							draw_set_halign(fa_center);
							draw_text_color(mean(CX+CW,CX+(CW/8)+120),CMY,string_upper(ITEM[item_id,2]),c_black,c_black,c_black,c_black,sqr(sqr(bag_sel_an)*draw_get_alpha()*(1-abs(i-inv_sel_an)))/2);
							gpu_set_blendmode(bm_add);
							draw_text_color(mean(CX+CW,CX+(CW/8)+120),CMY,string_upper(ITEM[item_id,2]),c_gloworange,c_gloworange,c_gloworange,c_gloworange,sqr(sqr(bag_sel_an)*draw_get_alpha()*(1-abs(i-inv_sel_an))));
							gpu_set_blendmode(bm_normal);
							draw_set_font(FONT_MAIN);
						}
						
						draw_sprite_ext(sItems,item_id,
						CX+lengthdir_x(((CW/8)+24),sprota*(i-inv_sel_an2)),
						CMY-lengthdir_y(((CW/8)+24),sprota*(i-inv_sel_an2)),
						1,1,0,c_white,sqr(bag_sel_an)*draw_get_alpha());
						
						
						draw_set_colour((inv_sel==i)?c_aqua:c_gloworange);
						
						gpu_set_blendmode(bm_add);
						
						draw_set_halign(fa_right);
						draw_text(CX+lengthdir_x(((CW/8))+9,sprota*(i-inv_sel_an3)),
						CMY-lengthdir_y(((CW/8))+9,sprota*(i-inv_sel_an3)),string_n_glitch(string(INV_N[| i]),bag_sel_an+0.05));
						draw_set_halign(fa_left);
						draw_text(CX+lengthdir_x(((CW/8)+39)+abs(i-inv_sel_an),sprota*(i-inv_sel_an)),
						CMY-lengthdir_y(((CW/8)+39)+abs(i-inv_sel_an),sprota*(i-inv_sel_an)),string_n_glitch(string(ITEM[item_id,(INV_N[| i]>1)]),sqr(min(sqr(sqr(sqr(bag_sel_an)))+0.05,1))));
						gpu_set_blendmode(bm_normal);
					}
				}
			}
		};
	} else {
		if (keyboard_check_pressed(ord("E")) || (keyboard_check(ord("E")) && inv_choose==1)) {
			if inv_choose==0 {
				inv_choose_on = 1;
				inv_choose_on_an = 1;
			}
			inv_choose = 1;
			if keyboard_check_pressed(vk_left) inv_choose_on-=1;
			if keyboard_check_pressed(vk_right) inv_choose_on+=1;
			inv_choose_on = clamp(inv_choose_on,0,2);
		} else if inv_choose==1 {
			if inv_choose_on==0 { // CRAFTING
				tool = 1;
			}
			else
			if inv_choose_on==1 { // BAG
				inv_open = 1;
				inv_sel=0;
				inv_sel_an=-3;
				inv_sel_an2=-3;
				inv_sel_an3=-3;
				bag_sel = 0;
				current_bag = -1;
				bag_sel_an = 0;
				bag_sel_ann = 0;
				symbol_pos = 0;
				bag_sel_ob = 1;
				bag_iie_an = 0;
				symbol_pos = 0;
				page_anim = 0;
				page_flip_an = 11;
				page_flip_d = 1;
				UI_SMELT = 0; UI_CRAFT = 0; UI_SMELT_ID = noone;
				UI_OPEN = 1;
				telarod = 0;
				telarod_an = 0;
				telarod_ant = 0;
				telarod = 0;
			}
			else
			{tool = 1;}; // UTILITIES
			inv_choose = 0;
			inv_choose_on = 1;
			inv_choose_on_an = 1;
		} else {
			if keyboard_check_pressed(ord("A")) {
				tool_on = !tool_on;
			};
		};
		if inv_choose==1 {
			control = 0;
			UI_OPEN = 1;
		}
	}
}
*/
#endregion



if LETTERBOX!=0 {
	fade_an11 = 1;
	alarm[2] = 120;
}

fade_an1 = reach_tween(fade_an1,(fade_an11?5:0),12);
hascontrol_an = reach_tween(hascontrol_an,1-control,12);
//fade_an1 = 3;
if draw==1 {
//var t_hp = (hp/hp_max);
//draw_sprite_ext(sPlayer_HP,2,CMX,CY+CH+fade_an1,1,1,0,c_black,0.5);
//draw_sprite_ext(sPlayer_HP,1,CMX,CY+CH+fade_an1,1,1,0,c_blackink,1);
if damage>0 {//draw_sprite_ext(sPlayer_HP,1,CMX,CY+CH+fade_an1,1,1,0,c_iiem,0.5+lengthdir_x(0.5,tick*1050));
	draw_set_colour(c_iiem);
	draw_set_alpha((0.75+lengthdir_y(0.25,tick*2100))*control_fade);
	draw_rectangle(CX-1,CY-1,CX+CW-1,CY+CH-1,1);
	draw_rectangle(CX-0.95,CY-0.95,CX+CW-1.05,CY+CH-1.05,1);
	draw_rectangle(CX-0.9,CY-0.9,CX+CW-1.1,CY+CH-1.1,1);
	draw_rectangle(CX-0.85,CY-0.85,CX+CW-1.15,CY+CH-1.15,1);
	draw_rectangle(CX-0.8,CY-0.8,CX+CW-1.2,CY+CH-1.2,1);
	draw_rectangle(CX-0.75,CY-0.75,CX+CW-1.25,CY+CH-1.25,1);
	draw_rectangle(CX-0.7,CY-0.7,CX+CW-1.3,CY+CH-1.3,1);
	draw_rectangle(CX-0.65,CY-0.65,CX+CW-1.35,CY+CH-1.35,1);
}

fade_an2 = reach_tween(fade_an2,hp<(hp_max/10),16);
if  fade_an2>0 {
	draw_set_colour(c_iiem);
	draw_set_alpha(((sqr(0.5+lengthdir_y(0.5,tick*350))*fade_an2)/2)*control_fade);
	draw_rectangle(CX-1,CY-1,CX+CW-1,CY+CH-1,1);
	draw_rectangle(CX-0.95,CY-0.95,CX+CW-1.05,CY+CH-1.05,1);
	draw_rectangle(CX-0.9,CY-0.9,CX+CW-1.1,CY+CH-1.1,1);
	draw_rectangle(CX-0.85,CY-0.85,CX+CW-1.15,CY+CH-1.15,1);
	draw_rectangle(CX-0.8,CY-0.8,CX+CW-1.2,CY+CH-1.2,1);
	draw_rectangle(CX-0.75,CY-0.75,CX+CW-1.25,CY+CH-1.25,1);
	draw_rectangle(CX-0.7,CY-0.7,CX+CW-1.3,CY+CH-1.3,1);
	draw_rectangle(CX-0.65,CY-0.65,CX+CW-1.35,CY+CH-1.35,1);
	draw_sprite_stretched_ext(sScreen_Glow,0,CX-1,CY-1,CW+2,CH+2,c_iiem,draw_get_alpha()/(1.5+((instance_number(oIs_Inside)>0)*1.5)));
}

if hp<=1 && hp>0 {
	if hp_regen>0 {
		hp_regen -= 1;
	} else {
		hp_regen = 60*7;
		hp = 2;
	};
};

//draw_sprite_stretched_ext(sScreen_Glow,0,CX-1,CY-1,CW+2,CH+2,c_iiem,min(((1/(((hp/hp_max)*(hp_max))+1))/((instance_number(oIs_Inside)>0)*1.5))*2,1));
/*
var tt_hp = (r_hp/hp_max);
//draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-tt_hp)),0,61*tt_hp,18,(CMX-30)+(30.5*(1-tt_hp)),(CY+CH)-13+fade_an1,1,1,c_white,1);
var t_hp = (hp/hp_max);
//draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-t_hp)),0,61*t_hp,18,(CMX-30)+(30.5*(1-t_hp)),(CY+CH)-13+fade_an1,1,1,c_iiem,1);
var HP_w = (CH/4)+(5*hascontrol_an), HP_h = 1-(hascontrol_an);
var HP_cx = CMX, HP_cy = (((CY+CH)-((HP_h*2)+2))+fade_an1);
draw_set_alpha(1);
draw_set_color(make_colour_rgb(31,31,54));
draw_rectangle(HP_cx-HP_w,HP_cy-HP_h,HP_cx+HP_w,HP_cy+HP_h,0);
if damage>0 {
	draw_set_color(c_iiem);
	draw_set_alpha(sqr(0.5+lengthdir_y(0.5,tick*1050)));
	draw_rectangle(HP_cx-HP_w,HP_cy-HP_h,HP_cx+HP_w,HP_cy+HP_h,0);
	draw_set_alpha(1);
}
draw_set_color(c_white);
if tt_hp!=t_hp draw_rectangle(HP_cx-(HP_w*(tt_hp)),HP_cy-HP_h,HP_cx+(HP_w*(tt_hp)),HP_cy+HP_h,0);
draw_set_color(c_iiem);
draw_rectangle(HP_cx-(HP_w*(t_hp)),HP_cy-HP_h,HP_cx+(HP_w*(t_hp)),HP_cy+HP_h,0);
if damage>0 {
	draw_set_color(c_white);
	draw_set_alpha(sqr(0.5+lengthdir_x(0.5,tick*1050)));
	draw_rectangle(HP_cx-(HP_w*(t_hp)),HP_cy-HP_h,HP_cx+(HP_w*(t_hp)),HP_cy+HP_h,0);
	draw_set_alpha(1);
}
*/

hp = clamp(hp,0,14);

gpu_set_blendmode(bm_normal);

//draw_set_font((keyboard_check(vk_lshift))?((keyboard_check(vk_lcontrol))?(fnt4):(fnt1)):(fnt3));
draw_set_font(fnt3);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var h_chr = "";//, th_chr = hp;
/*repeat(round(hp)) {
	/*if th_chr>0 {
	th_chr -= 2;
	if th_chr==1 {
		h_chr += chr(708)+chr(709);//chr(708);
	} else if th_chr>=0 h_chr += chr(708);//chr(709);
	} else break;
	if round(hp)<=1 h_chr = chr(709);*
	h_chr += chr(708);
}*/
//h_chr = floor(hp)*chr(708);
repeat(floor(hp)) {
	h_chr += chr(708);
};


//draw_set_alpha(1);
//draw_text(CX+4,CY+4,"["+h_chr+"]\n"+chr(710)+"\n"+chr(710)+" "+string(hp));
//draw_text(CX+8,CY+8,string(vsp)+" "+string(onsolid)+" "+string(col_b));

//aenox_h = reach_tween(aenox_h,(aenox_id!=noone)*aenox_hm,7);
draw_set_font(fnt3);
//draw_sprite_ext(sAenox_Spin,tick*24,(CX+CW)-24,(CY+CH)-24,1,1,0,c_white,aenox_h);
draw_set_alpha(0.5*(1-oControl.anim1));
draw_set_color($131313);
var _T = (chr(711)+string(toka));
if toka<=0 _T="";
if oControl.game_dialogue==1 {
draw_text(CX+4,CY+4,h_chr+"\n"+_T);
draw_set_alpha(0.7777777*(1-oControl.anim1));
draw_set_color($4400ff);
gpu_set_blendmode(bm_add);
draw_text(CX+4,CY+4,h_chr+"\n"+_T);//">"+h_chr+"_\n"+chr(710)+"\n"+chr(710));
}
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
//if damage>0 //draw_sprite_part_ext(sPlayer_HP,1,11+(30.5*(1-t_hp)),0,61*t_hp,18,(CMX-30)+(30.5*(1-t_hp)),(CY+CH)-13+fade_an1,1,1,c_white,0.5+lengthdir_x(0.5,tick*1050));
//draw_sprite_ext(sPlayer_HP,0,CMX,CY+CH+fade_an1,1,1,0,merge_colour(c_ink,make_colour_rgb(46,53,79),0.5),1);
//if hept_charge!=0 draw_sprite_ext(sPlayer_HP,0,CMX,CY+CH,1,1,0,c_iiem,0.5+lengthdir_y(0.5,tick*1050));
//t_hp = (aenox_h/aenox_hm);
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
};*/
//fade_an3 = 1;
//aenox_h = reach_tween(aenox_h,(aenox_id!=noone)*aenox_hm,7);
//draw_sprite_part_ext(sPlayer_HP,0,6+(35.5*(1-t_hp)),0,71*t_hp,18,(CMX-35)+(35.5*(1-t_hp)),(CY+CH)-13+fade_an1,1,1,merge_colour(c_aqua,merge_colour(merge_colour(c_white,c_aqua,0.5),merge_colour(c_edgbb,c_aqua,0.5),t_hp),0.5+lengthdir_x(0.5,tick*700)),clamp(fade_an3,0,1));



}


//draw_set_alpha(1);
//draw_set_colour(c_iiem);
//draw_text(CMX,CMY,string(p_onsolid)+"\n"+string(onsolid));