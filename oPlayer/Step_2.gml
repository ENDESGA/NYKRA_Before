
/*if keyboard_check_pressed(vk_rshift) {
	open_book(1);
}*/

physics = reach(physics,1,0.1);
if dead {control=0; UI_OPEN=1; };//SOUND_VOLUME = 0;};
collide_object = 1;
event_inherited();

if onsolid grab=0;
if grab==0 slide=0;

var _an = 1;
var play_land = 0;
var prev_attack_an = attack_an;

if oControl.GAME_CHAPTER[3,0]==1 {state_n = 2;} else state_n = telarod;//2;//telarod;

if hsp==0 {state = IDLE[state_n];} else state = RUN[state_n];

if jumped==1 || (vsp>0.5) {//(((vsp!=0 && (jump || onsolid==0)) || (abs(vsp)>1.01)) || jump) && 
	state = JUMP[state_n];
	_an = 0;
	if vsp<0 anim = 1;
	if vsp>0 anim = 3;
	if vsp>-1 && vsp<2 anim = 2;
	if jump && jump_t>=0 anim = 0;
}
if land>0 {land-=1; state=JUMP[state_n]; anim = 4; _an=0;};
if land==0 && (vsp==0 || onsolid) && _pos==0 {
	if _pvs>0.5 {
		repeat(round(_pvs*1.1)) {
		/*with(instance_create_depth(x+random_range(-3,3),y2+1+random_range(-0.5,0.5),oPlayer.depth-choose(1,0),oDust)) {
			speed = (random_range(0.4,oPlayer._pvs/2.5)/2);
			var _fs=choose(-1,1);
			direction = random_range(120,180);
			if _fs==1 direction = random_range(0,60);
		}*/
			create_fx(
			x+random_range(-3,3),
			y2+random_range(-0.5,0.5),
			depth-choose(1,0,-1),
			merge_colour(c_ltgray,c_gray,random_range(0.33333,1)/3),
			(random_range(0.4,oPlayer._pvs/2.5)),
			(choose(0,1))?random_range(120,180):random_range(0,60),
			0,
			0,
			0,
			0,
			0,
			sFx_3,
			choose(0,1),
			1,
			1,
			(random_range(0.2,1)/2),
			0);
		}
		hsp*=0.9;
	}
	
	play_land = 1;
	
	if _pvs>=5 {land = ceil(round(_pvs+1)*2); hsp=0;};
};

if attack>0 || attack==-1 {
	if attack>0 {
		//hsp *= 0.9;
		state = ATTACK[1];
		_an = 0;
		attack_an = ((attack_an+(pi/10)) mod 14);
		anim = round(attack_an);
		if attack==1 {
			if attack_an>=6 attack=0;
		} else
		if attack==2 {
			if attack_an>=13 attack=0;
		} else
		if attack==3 {
			if attack_an>=13 attack=1;
		};
	}
	else
	{
		state = sPlayer_telarod_attack_air;
		_an = 0;
		attack_an = (attack_an+0.3141)
		anim = round(attack_an);
		if attack_an>7 attack = 0;
	};
	
	if ((attack_an>1.5 && attack_an<2.5) || (attack_an>8.5 && attack_an<9.5)) || (attack==-1 && (attack_an>1.5 && attack_an<2.5)) {
	
		if (prev_attack_an)!=(attack_an) && floor(prev_attack_an)<floor(attack_an) && control==1 {
			play_sound_pos(choose(sndSwish_1,sndSwish_2,sndSwish_3,sndSwish_4),10,0,random_range(0.895,1.005),1,0,x,y);
		}
		if instance_number(parBreakable)>=1 {
			//var _nai = instance_nearest(x+(7*facing),y,parBreakable);
			with(parBreakable) {
			if box_inside_bound((oPlayer.x+(17*oPlayer.facing))-14,(oPlayer.y-5)-11,(oPlayer.x+(17*oPlayer.facing))+14,(oPlayer.y-5)+11,id) && attack_hit<=0 { // (point_distance(oPlayer.x+(14*oPlayer.facing),oPlayer.y,x,y)<=16)
				if ((x>oPlayer.x+1 && oPlayer.facing==1) || (x<oPlayer.x-1 && oPlayer.facing==-1)) {
					if collision_line(x,y,oPlayer.x,oPlayer.y,parBreakable,0,1)==noone {
						attack_hit = 1;
						hp -= 1.7;
						hsp += oPlayer.facing;
						sleep(40);
						cam_shake = (2/3);
						cam_push = (2/3);
						cam_p_dir = ((oPlayer.facing==1)?180:0);
					}
				}
			}
			}
		}
		if 1==0 && instance_number(parDust)>=1 {
			//var _nai = instance_nearest(x+(7*facing),y,parBreakable);
			with(parDust) {
			if (point_distance(oPlayer.x+(16*oPlayer.facing),oPlayer.y,x,mean(oPlayer.y,y))<18) {
				if ((x>oPlayer.x+1 && oPlayer.facing==1) || (x<oPlayer.x-1 && oPlayer.facing==-1)) {
					instance_destroy();
				}
			}
			}
		}
	}
}

if (_an && (holding_eo==0)) {
	anim_t = ((abs(hsp)+0.001))/(sprite_get_number(state)/1.5);
	if state==IDLE[state_n] anim_t = (mean(1+lengthdir_x(0.5,tick*20),1)*(1/(sprite_get_number(state)+1)));
	frame = ((frame+anim_t) mod sprite_get_number(state));
	if state==IDLE[state_n] && instance_number(oIs_Inside)>=1 frame=6;
	var _prev_frm = anim;
	anim = round(frame);
	
	if state==RUN[state_n] && onsolid==1 {
		if (_prev_frm!=anim) && (_prev_frm==0 || _prev_frm==4) {
			repeat(3) {
			/*with(instance_create_depth(x+random_range(-4,4),y2+1+random_range(-0.5,0.5),oPlayer.depth-choose(1,0),oDust)){
				speed = (random_range(0.4,1.4)/2);
				direction = random_range(120,180);
				if oPlayer.facing==-1 direction = random_range(0,60);
			}*/
			create_fx(
			x+random_range(-3,3),
			y2+random_range(-0.5,0.5),
			depth-choose(1,0,-1),
			merge_colour(c_ltgray,c_gray,random_range(0.33333,1)/3),
			((random_range(0.4,1.4)/2)),
			(oPlayer.facing!=-1)?random_range(120,180):random_range(0,60),
			0,
			0,
			0,
			0,
			0,
			sFx_3,
			choose(0,1),
			1,
			1,
			(random_range(0.2,1)/2),
			0);
			}
		}
		if abs(hsp)<(max_hsp/1.05) state=WALK[state_n];
		//if hop==0 && abs(hsp)>=max_hsp {vsp-=0.5; hop=1; hsp+=(sign(hsp)/2);};
	}
}

//if hop==1 && abs(hsp)<max_hsp hop = 0;



// OPEN THE INVENTORY   <<<<<<<<<

if keyboard_check_pressed(global.key_inv) && oControl.mode==3 &&
(((inv_open==1) && (inv_open_an>0.9)) || ((inv_open==0) && (inv_open_an<0.1))) && (control==1 || (inv_open==1 && inv_open_an>0.9)) && physics==1 && draw==1 {
	inv_open = !(bool(floor(real(inv_open))));
	if inv_open==1 {
		inv_sel = 0;
		inv_sel_an2 = 0;
		ui_menu = 0;
		ui_menu_an = 0;
		inv_open_book = 0;
		inv_open_tool = 0;
		inv_open_planet = 0;
		inv_open_book_an = 0;
		inv_open_tool_an = 0;
		inv_open_planet_an = 0;
		planet_info = -1;
		planet_menu = 0;
		planet_menu_an = 0;
		alarm[6] = -1;
		play_sound(choose(sndBackpack_01,sndBackpack_02,sndBackpack_03,sndBackpack_04,sndBackpack_05,sndBackpack_06,sndBackpack_07),10,0,mean((random_range(0.9,1.1)*0.9),1),2/3,1);
	} else {
		play_sound(choose(sndBackpack_Quiet_01,sndBackpack_Quiet_02,sndBackpack_Quiet_03,sndBackpack_Quiet_04,sndBackpack_Quiet_05,sndBackpack_Quiet_06,sndBackpack_Quiet_07),10,0,mean((random_range(0.9,1.1)*0.9),1),2/3,1);
		alarm[6] = 120;
		planet_menu = 0;
	};
	
	keyboard_key_release(global.key_inv);
};

/*if keyboard_check_pressed(ord("E")) && oControl.mode==3 && (!(inv_open==0 && control==0) || inv_open==1) && (UI_OPEN==0 || inv_open==1) {
	inv_open = !inv_open;
	if inv_open==1 {
		inv_sel=0;
		inv_sel_an=-12;
		inv_sel_an2=-12;
		inv_sel_an3=-12;
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
	else {UI_OPEN = 0; };
}
*/
/////////////
/*
if inv_open==1 && current_bag<2 {
	inv_sel_an = reach(inv_sel_an,inv_sel,abs(inv_sel-inv_sel_an)/3.5);
	inv_sel_an2 = reach(inv_sel_an2,inv_sel_an,abs(inv_sel_an-inv_sel_an2)/3.5);
	inv_sel_an3 = reach(inv_sel_an3,inv_sel_an2,abs(inv_sel_an2-inv_sel_an3)/3.5);
	//if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_up)) play_sound(sndMenu_sel,10,0,1,1,0);
}
else
inv_sel = 0;*/

if instance_number(PATH)>=1 && has_path==-1 && path_side==0 {
	var path = instance_nearest(x,y,PATH);
	if point_distance(path.x,path.y-16,oPlayer.x,oPlayer.y)<64 {
	
	var _c1 = (x<path.x) && x>path.x-16, _c2 = (x>path.x) && x<path.x+16;
	
	if _c1 ^ _c2 {
		
		path_side = 0;
		
		has_path = -1;

		obj_setpos(oPlayer,x + (_c1 ? -1 : 1),y);
		hsp = 0;
		vsp = 0;
		
		save_game();
		
		path_side = _c1 ? -1 : 1;
		
		has_path = path.n;
		prev_room = room;
		
		with(oControl) {
			FADE_COLOUR = c_black;
			map_load(working_directory + "level_data/" + path.rm + ".rmlvl",path.rm);
			//create_flash(c_black,0.9);
		}
	}/*
	else
	if (x>path.x && facing==-1) && x<path.x+16 {
		path_side = 1;
		has_path = path.n;
		//var __t = instance_create(x,y,oPath_goto);
		//__t.rm = path.rm;
		prev_room = room;
		//draw_clear_alpha(c_black,1);
		//create_flash(c_black,0.9);
		save_game();
		with(oControl) {
			FADE_COLOUR = c_black;
			map_load(working_directory + "level_data/" + path.rm + ".rmlvl",path.rm);
			//create_flash(c_black,0.9);
		}
	};*/
	};
};

var t_snd = 0;

if onblock_id!=-1 {
	switch(onblock_id) {
		case 1:
		t_snd = snd_step_grass();
		if t_snd==_snd t_snd = snd_step_grass();
		if t_snd==_snd t_snd = snd_step_grass();
		_snd = t_snd;
		break;
				
		case 2:
		t_snd = snd_step_grass();
		if t_snd==_snd t_snd = snd_step_grass();
		if t_snd==_snd t_snd = snd_step_grass();
		_snd = t_snd;
		break;
				
		case 4:
		t_snd = snd_step_dirt();
		if t_snd==_snd t_snd = snd_step_dirt();
		if t_snd==_snd t_snd = snd_step_dirt();
		_snd = t_snd;
		break;
				
		case 5:
		t_snd = snd_step_dirt();
		if t_snd==_snd t_snd = snd_step_dirt();
		if t_snd==_snd t_snd = snd_step_dirt();
		_snd = t_snd;
		break;
		
		case 6:
		t_snd = snd_step_wood();
		if t_snd==_snd t_snd = snd_step_wood();
		if t_snd==_snd t_snd = snd_step_wood();
		_snd = t_snd;
		break;
				
		case 7:
		t_snd = snd_step_wood();
		if t_snd==_snd t_snd = snd_step_wood();
		if t_snd==_snd t_snd = snd_step_wood();
		_snd = t_snd;
		break;
				
		case 8:
		t_snd = snd_step_stone();
		if t_snd==_snd t_snd = snd_step_stone();
		if t_snd==_snd t_snd = snd_step_stone();
		_snd = t_snd;
		break;
				
		case 9:
		t_snd = snd_step_stone();
		if t_snd==_snd t_snd = snd_step_stone();
		if t_snd==_snd t_snd = snd_step_stone();
		_snd = t_snd;
		break;
	}
}

if play_land==1 && physics==1 && control==1 {
	play_sound_pos(_snd,10,0,(0.93+random_range(-0.03,0.03))*0.76,1.2,0,x,y);
	//play_sound_pos(_snd,50,0,(0.93+random_range(-0.03,0.03))*0.76,mean(1,1,_vol),0,x+4,y);
	//play_sound_pos(choose(sndMove_leather1,sndMove_leather2,sndMove_leather3,sndMove_leather4,
	//sndMove_leather5,sndMove_leather6,sndMove_leather7,sndMove_leather8),50,0,1+random_range(-0.02,0.02),0.5,0,x,y);
}

if onsolid && hsp!=0 && onblock_id!=-1 {
	if state==RUN[state_n] || state==WALK[state_n] {
		if (floor(anim)==3 || floor(anim)==8) && step_sfx==0 && physics==1 {
			//snd_step_stone()
			play_sound_pos(_snd,10,0,0.94+random_range(-0.04,0.04),1,0,x+hsp,y+vsp);
			//audio_emitter_create()
			step_sfx = 1;
		}
		if (floor(anim)!=3 && floor(anim)!=8) && step_sfx!=0 {
			step_sfx = 0;
		};
	} else step_sfx = 0;
} else step_sfx = 0;

//var in_n = instance_nearest(x,y,parEntity);

if keyboard_check_pressed(global.kkd) && onJT==1 && control==1 && UI_OPEN=0 {
	y += 0.5;
	y1 += 0.5;
	y2 += 0.5;
	vsp+=0.5;
}

if has_aenox==0 {if (aenox==1) has_aenox = 1;};

