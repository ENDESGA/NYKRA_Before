
//var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
//var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));

CX = camera_get_view_x(cam);
CY = camera_get_view_y(cam);
CW = camera_get_view_width(cam);
CH = camera_get_view_height(cam);
CMX = CX+(CW/2);
CMY = CY+(CH/2);
CHYP = (sqrt(sqr(CW)+sqr(CH))/2);


set_controls();

//virtual_key_show(global.touch_left);
//virtual_key_show(global.touch_right);
//virtual_key_show(global.touch_up);

//virtual_key_add()

/*
for (var i = 0; i < touch_max; ++i) {
	/*if ((touch[i,0]==-1) || (touch[i,1]==-1)) {
		keyboard_key_release(global.kkl);
		keyboard_key_release(global.kkr);
		keyboard_key_release(global.kku);
		keyboard_key_release(global.kkd);
	};*
	if device_mouse_check_button(i,mb_any) {
		touch[i,0] = device_mouse_x(i);
		touch[i,1] = device_mouse_y(i);
	} else
	if ((touch[i,0]!="") || (touch[i,1]!="")) {
		touch[i,0] = "";
		touch[i,1] = "";
		if touch[i,2]!="" keyboard_key_release(touch[i,2]);
		touch[i,2] = "";
		//touch[i,3] = "";
	};
};

virtual_key_add()

var osc_x = 0, osc_y = 0;
for (var i = 0; i < touch_max; ++i) {
	osc_x = touch[i,0];
	osc_y = touch[i,1];
	
	if ((osc_x!="") && (osc_y!="")) {
		if (osc_x<CMX) {
			if (osc_x<mean(CX,CMX)) {
				if touch[i,2]!=(global.kkl) keyboard_key_release(touch[i,2]);
				touch[i,2] = (global.kkl);
				keyboard_key_press(global.kkl);
			} else {
				if touch[i,2]!=(global.kkr) keyboard_key_release(touch[i,2]);
				touch[i,2] = (global.kkr);
				keyboard_key_press(global.kkr);
			};
		} else {
			if (osc_y<CMY) {
				if touch[i,2]!=(global.kkj) keyboard_key_release(touch[i,2]);
				touch[i,2] = (global.kkj);
				keyboard_key_press(global.kkj);
			} else {
				if touch[i,2]!=(global.kku) keyboard_key_release(touch[i,2]);
				touch[i,2] = (global.kku);
				keyboard_key_press(global.kku);
			};
		};
	};
}*/



//if dragging==3 dragging = 0;


/*
if (quit==2) {
	depth = 1000;
	if !surface_exists(pause_surf) pause_surf = surface_create(CW,CH);
	draw_set_alpha(1);
	if surface_exists(pause_surf) {
		surface_set_target(pause_surf)
		draw_clear_alpha(0,1);
		surface_reset_target();
		view_surface_id[0] = pause_surf;
		quit = 1;
	};
	oPlayer.control = 0;
};*/

//effect_create_above(ef_snow,random_range(cx-4,cx+cw+4),cy-4,2,c_ltgray);

var p_CONTROL_MODE = CONTROL_MODE;
//if keyboard_check_pressed(vk_f1) CONTROL_MODE=!CONTROL_MODE;
var gp_num = gamepad_get_device_count();
if gp_num>0 {
for (var i = 0; i < gp_num; i++;) {
	
	if gamepad_is_connected(i) {
		gamepad_set_vibration(i,min(1,cam_shake),min(1,cam_shake))
		var F_l = gp_face3, F_u = gp_face4, F_d = gp_face1;
		
		/*if i<4 {
			F_l = gp_face3;
			F_u = gp_face4;
			F_d = gp_face1;
		}*/
		
		if CONTROL_MODE==1 {
			GPL=-1;GPR=-1;GPU=-1;GPD=-1;GPJ=-1;
			if gamepad_button_check(i,gp_padl) || gamepad_axis_value(i,gp_axislh)<-0.3 {keyboard_key_press(vk_left); GPL=1;}
			else if (!gamepad_button_check(i,gp_padl) && !(gamepad_axis_value(i,gp_axislh)<-0.3))  {keyboard_key_release(vk_left);}
	
			if gamepad_button_check(i,gp_padr) || gamepad_axis_value(i,gp_axislh)>0.3 {keyboard_key_press(vk_right); GPR=1;}
			else if (!gamepad_button_check(i,gp_padr) && !(gamepad_axis_value(i,gp_axislh)>0.3)) {keyboard_key_release(vk_right);}
	
			if gamepad_button_check(i,gp_padu) || gamepad_axis_value(i,gp_axislv)<-0.3 {keyboard_key_press(vk_up); GPU=1;}
			else if (!gamepad_button_check(i,gp_padu) && !(gamepad_axis_value(i,gp_axislv)<-0.3)) {keyboard_key_release(vk_up);}
	
			if gamepad_button_check(i,gp_padd) || gamepad_axis_value(i,gp_axislv)>0.3 {keyboard_key_press(vk_down); GPD=1;}
			else if (!gamepad_button_check(i,gp_padd) && !(gamepad_axis_value(i,gp_axislv)>0.3)) {keyboard_key_release(vk_down);}

			if gamepad_button_check(i,F_d)  {keyboard_key_press(vk_space); GPJ=1} else  keyboard_key_release(vk_space);
			if gamepad_button_check(i,F_u)  keyboard_key_press(global.key_inv) else  keyboard_key_release(global.key_inv);
			if gamepad_button_check(i,F_l)  keyboard_key_press(global.key_aenox) else  keyboard_key_release(global.key_aenox);
			if gamepad_button_check(i,gp_shoulderrb)  keyboard_key_press(global.key_telarod); else  {keyboard_key_release(global.key_telarod);};
			if gamepad_button_check(i,gp_start)  keyboard_key_press(vk_escape); else  {keyboard_key_release(vk_escape);};
	
			if CONTROL_MODE==1 && (GPL==-1 && GPR==-1 && GPU==-1 && GPD==-1 && GPJ==-1) && (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_space)) {
				CONTROL_MODE = 0;
			}
			//if GPL==1 keyboard_key_press(vk_left) else keyboard_key_release(vk_left);
		}
		else
		if (gamepad_button_check(i,gp_padl) || gamepad_button_check(i,gp_padr) || gamepad_button_check(i,gp_padu) || gamepad_button_check(i,gp_padd) ||
		gamepad_button_check(i,F_d) || gamepad_button_check(i,F_u) || gamepad_button_check(i,F_l) || gamepad_button_check(i,gp_shoulderrb) ||
		gamepad_axis_value(i,gp_axislh)<-0.3 || gamepad_axis_value(i,gp_axislh)>0.3 || gamepad_axis_value(i,gp_axislv)<-0.3 || gamepad_axis_value(i,gp_axislv)>0.3) && (GPL==-1 && GPR==-1 && GPU==-1 && GPD==-1 && GPJ==-1) {
			CONTROL_MODE = 1;
		}
		
		break;
		}
	}
};


/*
if p_CONTROL_MODE!=CONTROL_MODE {
	//instance_destroy(oCONTROLS_MODE);
	//instance_create_depth(x,y,-200,oCONTROLS_MODE);
	//play_sound(sndBoltoda_activate,10,0,1,1/3,0);
}*/

//SOUND_VOLUME = 1;//reach(SOUND_VOLUME,1,0.);

audio_listener_position(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),camera_get_view_y(cam)+(camera_get_view_height(cam)/2),0)
audio_listener_orientation(0,0,1000,0,-1,0);
//pre_volume = VOLUME;
//DIALOGUE_OPEN = reach_tween(DIALOGUE_OPEN,0,0.1);

if (PLAYING_MUSIC[0]==-1 || MUSIC_ID[0]!=MUSIC[0]) {
	//if PLAYING_MUSIC[0]!=-1 {
	//	audio_sound_gain(PLAYING_MUSIC[0],0,500);
	//	if audio_sound_get_gain(PLAYING_MUSIC[0])<=(0.075) PLAYING_MUSIC[0]=-1;
	//}
	//else
	//{
		//PLAYING_MUSIC[0] = play_sound(MUSIC[0],1,0,1,(1/5.1)*VOLUME,1554);
		audio_sound_gain(PLAYING_MUSIC[0],0,3000);
		PLAYING_MUSIC[0] = audio_play_sound(MUSIC[0],1,1);
		audio_sound_pitch(PLAYING_MUSIC[0],1);
		audio_sound_gain(PLAYING_MUSIC[0],0,0);
		audio_sound_gain(PLAYING_MUSIC[0],(1/4.5)*VOLUME,3000);
		music_volume = VOLUME;
		MUSIC_ID[0] = MUSIC[0];
	//};
}

if music_volume!=(VOLUME) {
	if (VOLUME>0 && audio_is_paused(PLAYING_MUSIC[0])) audio_resume_sound(PLAYING_MUSIC[0]);
	audio_sound_gain(PLAYING_MUSIC[0],(1/4.5)*VOLUME,1000);
	if (VOLUME<=0 && audio_sound_get_gain(PLAYING_MUSIC[0])<=(0.075)) audio_pause_sound(PLAYING_MUSIC[0]);
	music_volume = (VOLUME);
}

if DIALOGUE_OPEN!=0 && VOLUME==pre_volume {VOLUME = (1/3.5);} else if DIALOGUE_OPEN==0 VOLUME=reach(VOLUME,pre_volume,1/60);

if (PLAYING_MUSIC[1]==-1 || MUSIC_ID[1]!=MUSIC[1]) {
	/*if PLAYING_MUSIC[1]!=-1 {
		audio_sound_gain(PLAYING_MUSIC[1],0,500);
		if audio_sound_get_gain(PLAYING_MUSIC[1])<=(0.075) PLAYING_MUSIC[1]=-1;
	}
	else
	{*/
		//PLAYING_MUSIC[1] = play_sound(MUSIC[1],1,1,1,0.95,777);
		audio_sound_gain(PLAYING_MUSIC[1],0,3000);
		PLAYING_MUSIC[1] = audio_play_sound(MUSIC[1],1,1);
		audio_sound_pitch(PLAYING_MUSIC[1],1);
		audio_sound_gain(PLAYING_MUSIC[1],0,0);
		audio_sound_gain(PLAYING_MUSIC[1],1,3000);
		MUSIC_ID[1] = MUSIC[1];
	//};
}

if (PLAYING_MUSIC[2]==-1 || MUSIC_ID[2]!=MUSIC[2]) {
	/*if PLAYING_MUSIC[2]!=-1 {
		audio_sound_gain(PLAYING_MUSIC[2],0,500);
		if audio_sound_get_gain(PLAYING_MUSIC[2])<=(0.075) PLAYING_MUSIC[2]=-1;
	}
	else
	{*/
		audio_sound_gain(PLAYING_MUSIC[2],0,3000);
		PLAYING_MUSIC[2] = audio_play_sound(MUSIC[2],1,1);
		audio_sound_pitch(PLAYING_MUSIC[2],1);
		audio_sound_gain(PLAYING_MUSIC[2],0,0);
		audio_sound_gain(PLAYING_MUSIC[2],1,3000);
		MUSIC_ID[2] = MUSIC[2];
	//};
}


/*
var scll = 1+(round((47*GLITCH)/0.1)*0.1);
if GLITCH>0 {
	surface_resize(application_surface,round((display_get_width()/scll)+(random_range(-10,10)*GLITCH)+(GLITCH*10)),round((display_get_height()/scll)+(random_range(-10,10)*GLITCH)+(GLITCH*10)));
}
GLITCH*=0.9;
GLITCH = max(GLITCH-0.002,0);*/

if depth!=-1000 depth=-1000;

if keyboard_check(vk_control) {
	cam_scale -= (mouse_wheel_down()-mouse_wheel_up())/4;
	if keyboard_check_pressed(ord("0")) cam_scale = cam_scale_d;
	if keyboard_check_pressed(vk_backspace) event_user(4);
}
var _tcams = camera_get_view_width(cam), _tcamh = camera_get_view_height(cam);
camera_set_view_size(cam,round(display_get_width()/cam_scale),round(display_get_height()/cam_scale));
if _tcams!=camera_get_view_width(cam) {
	camera_set_view_pos(cam,camera_get_view_x(cam)-((camera_get_view_width(cam)-_tcams))/2,camera_get_view_y(cam)-((camera_get_view_height(cam)-_tcamh))/2);
}

if mode==3 && LETTERBOX!=1 {
	oControl.cam_scale = reach_tween(oControl.cam_scale,(display_get_height()/180),8);
	//oCamera.x = (camera_get_view_x(cam)+(_tcams/2));
	//oCamera.y = (camera_get_view_y(cam)+(_tcamh/2));
}

tick = tick_n+(get_timer()/1000000);
tick360 = ((tick360+1) mod 360);

var mx = floor(mouse_x/16), my = floor(mouse_y/16);
var mmm = 0;
//if file_input==1 && keyboard_check_pressed(ord("S")) {
//	map_save(map_n,map,mw,mh,working_directory + "/" + file_current + ".rmlvl","tFRONT","tBACK",asset_list_back);
//	reset_files();
//}

/*if file_input==1 && keyboard_check_pressed(ord("L")) {
	map = 0;
	mmm=map_load(working_directory + "/" + file_current + ".rmlvl","tFRONT","tBACK","aBACK");
	map = mmm[0];
	mw = mmm[1];
	mh = mmm[2];
	map_n = mmm[3];
	asset_list_back = mmm[4];
	reset_files();
}*/
//if keyboard_check(vk_escape) game_end();
if file_input==1 && keyboard_check(ord("R")) game_restart();

if mode==0 {
	if mx<mw && my<mh && mx>=0 && my>=0 {
		if mouse_check_button(mb_left) {
			map[@ mx, my] = sel;
			if map_id[sel,4]!=noone && instance_position(mx*16,my*16,map_id[sel,4])==noone {
				instance_create_depth(mx*16,my*16,map_id[sel,5],map_id[sel,4]);
			}
		}

		if mouse_check_button(mb_right) {
			map[@ mx, my] = 0;
		}
	}
	else
	{
		if mx>=mw && my<mh {
			if mouse_check_button_pressed(mb_left) {
				mw += 1;
				for (var _i = 0; _i <= mh; ++_i) {
				    //map[mw-1,_i] = 0;
					map[mw,_i] = 0;
					//map[mw+1,_i] = 0;
				};
			}
			else
			if mouse_check_button_pressed(mb_right) {
				mw -= 1;
				for (var _i = 0; _i <= mh; ++_i) {
				    //map[mw-1,_i] = 0;
					map[mw,_i] = 0;
					//map[mw+1,_i] = 0;
				};
			};
		}
		else
		if mx<mw && my>=mh {
			if mouse_check_button_pressed(mb_left) {
				mh += 1;
				for (var _i = 0; _i <= mw; ++_i) {
				    //map[_i,mh-1] = 0;
					map[_i,mh] = 0;
					//map[_i,mh+1] = 0;
				};
			}
			else
			if mouse_check_button_pressed(mb_right) {
				mh -= 1;
				for (var _i = 0; _i <= mw; ++_i) {
				    //map[_i,mh-1] = 0;
					map[_i,mh] = 0;
					//map[_i,mh+1] = 0;
				};
			};
		}
	};
}
else
if mode==1 {
	if in_mc==0 {
		if mouse_check_button(mb_left) {
			if keyboard_check(vk_alt)==0 {
				mx = (floor(mouse_x/16)*16);
				my = (floor(mouse_y/16)*16);
				var lay_idd = layer_get_id(_layer[_layer_n]);
				var map_idd = layer_tilemap_get_id(lay_idd);
				for(var i=0;i<ds_list_size(tile_sel);i++;) {
					tilemap_set(map_idd,tile_sel[| i],
					(floor(((mx-(_mw/2))+floor(((tile_sel[| i] mod 64)-min_mw)*16))/16)+1),
					(floor(((my-(_mh/2))+floor(((tile_sel[| i] div 64)-min_mh)*16))/16)+1));
				}
			}
			else
			{
				mx = floor(mouse_x/16);
				my = floor(mouse_y/16);
				var lay_idd = layer_get_id(_layer[_layer_n]);
				var map_idd = layer_tilemap_get_id(lay_idd);
				tilemap_set(map_idd,ds_list_find_value(tile_sel,irandom_range(0,ds_list_size(tile_sel)-1)),mx,my);
			};
		}

		if mouse_check_button(mb_right) {
			mx = (floor(mouse_x/16)*16);
			my = (floor(mouse_y/16)*16);
			var lay_idd = layer_get_id(_layer[_layer_n]);
			var map_idd = layer_tilemap_get_id(lay_idd);
			for(var i=0;i<ds_list_size(tile_sel);i++;) {
				tilemap_set(map_idd,0,
				(floor(((mx-(_mw/2))+floor(((tile_sel[| i] mod 64)-min_mw)*16))/16)+1),
				(floor(((my-(_mh/2))+floor(((tile_sel[| i] div 64)-min_mh)*16))/16)+1));
			}
		}
	};
	
	_layer_n += mouse_wheel_down()-mouse_wheel_up();
	if _layer_n<0 _layer_n = (array_length_1d(_layer)-1);
	if _layer_n>(array_length_1d(_layer)-1) _layer_n = 0;
}
else
if mode==2 {
	if mouse_check_button_pressed(mb_left) {
		var lay_idd = layer_get_id(asset_layer[asset_layern]);
		ds_list_add(asset_list[asset_layern],layer_sprite_create(lay_idd,mouse_x,mouse_y,_sp))
	}
}
else
if mode==4 {
	if keyboard_check(vk_alt) && mouse_check_button_pressed(mb_left) {
		var px = mouse_x, py = mouse_y;
		if keyboard_check(vk_control) {px = floor(mouse_x/8)*8; py = floor(mouse_y/8)*8;};
		var ob = (instance_create_depth(px,py,_ob_depth,_ob));
		ds_list_add(obj_list,ob);
		
		if _ob.object_index==PATH {
			(instance_create_depth(x,y,-100,PATH_input)).obj = ob;
		}
		else
		if object_is_ancestor(_ob,parLootable) {
			(instance_create_depth(x,y,-100,LOOT_input)).obj = ob;
		}
		else
		if object_is_ancestor(_ob,parDoor_out) {
			(instance_create_depth(x,y,-100,DOOR_input)).obj = ob;
		}
		else
		if object_is_ancestor(_ob,parDoor_Flat) {
			(instance_create_depth(x,y,-100,DOOR_flat_input)).obj = ob;
		}
		else
		if _ob.object_index=oRoof_angle {
			(instance_create_depth(x,y,-100,ROOF_input)).obj = ob;
		}
		else
		if object_is_ancestor(_ob,parNote) {
			(instance_create_depth(x,y,-100,NOTE_input)).obj = ob;
		}
		else
		if object_is_ancestor(_ob,oBook) || _ob.object_index=oBook {
			(instance_create_depth(x,y,-100,BOOK_input)).obj = ob;
		};
	}
};

if mode!=3 {
	/*
	files += file_find_first(working_directory+"/Rooms/*",0);
	file
	repeat(7) {
		files+="\n";
		files+=file_find_next();
		file_find_close()
	}*/
};

//if (floor(tick) mod 2)==0 {
	obj_list_size = ds_list_size(obj_list);
//}