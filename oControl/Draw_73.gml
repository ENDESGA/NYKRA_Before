
//draw_text(mouse_x,mouse_y,string(file_find_first(working_directory +"*.SAVE",0)));
var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);

// DRAW EVENT
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_set_colour($4400ff);
draw_set_alpha(1);
for (var i = 0; i < touch_max; ++i) {
	if (touch[i,0]!="" && touch[i,1]!="") {
		draw_circle(touch[i,0],touch[i,1],32,1);
	};
	draw_text(CX+4,CY+4+(i*16),string(touch[i,0])+" "+string(touch[i,1])+" "+string(touch[i,2]));
}

if keyboard_check(vk_f1) {
	if keyboard_check_pressed(vk_f1) {
		FPS = 0;
		FPS_N = 0;
	}
	FPS += fps_real;
	FPS_N += 1;
	// RESET THE FONT
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_text(CMX+1,CMY,string(fps)+" / "+string(FPS/FPS_N));
	draw_text(CMX,CMY+1,string(fps)+" / "+string(FPS/FPS_N));
	draw_text(CMX+1,CMY+1,string(fps)+" / "+string(FPS/FPS_N));
	draw_set_colour(FPS_N<30?c_dkgray:c_white);
	draw_text(CMX,CMY,string(fps)+" / "+string(FPS/FPS_N));
} else FPS=0;


anim1 = reach(anim1,LETTERBOX>0,abs(LETTERBOX-anim1)/9);
//if LETTERBOX {
	if anim1>0 {
		draw_set_colour(c_black);
		draw_set_alpha(1);
		draw_rectangle(cx-1,cy-1,cx+cw+1,(cy-1)+((ch/11)*anim1),0);
		draw_rectangle(cx-1,(cy+ch+1)-((ch/11)*anim1),cx+cw+1,cy+ch+1,0);
		LETTERBOX -= (1/(ceil(fps)/4));
	};
	LETTERBOX = clamp(LETTERBOX,0,1);
//};

draw_set_alpha(1);
draw_set_font(FONT_MAIN);

if mode!=-1 {
if mode==0 {
	draw_rectangle_view(c_black,0.5);
}
if mode!=3 {
	draw_set_alpha(1);
	draw_set_colour(merge_colour(c_white,c_blue,0.5));
	draw_rectangle(-2,-2,1.5 + (mw*16),1.5 + (mh*16),1);
	draw_rectangle(-1,-1,0.5 + (mw*16),0.5 + (mh*16),1);
	draw_set_colour(c_blue);
	draw_rectangle(-1.5,-1.5,1 + (mw*16),1 + (mh*16),1);
	var _bl, _x1, _y1;
	for(var i=0;i<array_height_2d(map);i++;) {
		if array_length_2d(map,i)!=mh {
			for(var _j=array_length_2d(map,i)-1; _j<=mh; _j++;) {
				map[@ i,_j] = 0;
			};
		};
		if array_height_2d(map)!=mw {
			for(var _j=array_height_2d(map)-1; _j<=mw; _j++;) {
				map[@ i,_j] = 0;
			};
		};
		for(var j=0;j<array_length_2d(map,i);j++;) {
			_bl = map[@ i, j];
			if (_bl!=0) {
				draw_set_colour(map_id[@ _bl,2]);
				_x1 = (i*16);
				_y1 = (j*16);
				if mode==1 draw_set_alpha(0.2);
				draw_rectangle(_x1,_y1,_x1+15,_y1+map_id[@ _bl,3] - 1,1);
				//draw_set_alpha(1/pi);
				//draw_rectangle(_x1,_y1,_x1+16,_y1+16,1);
				draw_set_alpha(1);
			}
		}
	}
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_font(FONT_MAIN);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text((cx+cw)-4,(cy+ch)-4,"( "+string(mouse_x)+" , "+string(mouse_y)+" )"+"\n"+"( "+string(mouse_x/16)+" , "+string(mouse_y/16)+" )");
};
var _tm = mode;

if START_GAME==0 && game_start==0 && file_input==0 && instance_number(parObj_Input)<=0 {
	if keyboard_check_pressed(ord("1")) mode=0 else if keyboard_check_pressed(ord("2")) mode=1
	else if keyboard_check_pressed(ord("3")) mode=2 else if keyboard_check_pressed(ord("4")) mode=3
	else if keyboard_check_pressed(ord("5")) mode=4;
}
if START_GAME==1 || game_start==1 mode = 3;

if _tm!=mode {
	event_user(0);
	if mode==3 event_user(1);
	if mode==2 event_user(3);
	asset_sel = -1;
}
if mode==0 {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	for(var i=1;i<array_height_2d(map_id);i++;) {
		draw_set_alpha(1);
		draw_set_colour(c_black);
		draw_rectangle(mouse_x+19,mouse_y+((i-sel)*20),mouse_x+25+string_width(map_id[@ i,0]),mouse_y+16+((i-sel)*20),0);
		draw_set_colour(c_white);
		draw_set_alpha(2/3);
		if sel==i draw_set_alpha(1);
		draw_text(mouse_x+22,mouse_y+((i-sel)*20)+7,map_id[i,0]);
	}
	draw_set_alpha(1);

	draw_set_colour(c_red);
	var mx = (floor(mouse_x/16)*16), my = (floor(mouse_y/16)*16);
	draw_rectangle(mx-1,my-1,mx+17,my+17,1);
	//if map[@ floor(mouse_x/16), floor(mouse_y/16)]==1 {draw_set_colour(c_green); draw_circle(mx+8,my+8,20,1);};
	draw_rectangle(mouse_x+19,mouse_y,mouse_x+25+string_width(map_id[@ sel,0]),mouse_y+16,1);

	sel -= mouse_wheel_up()-mouse_wheel_down();
	sel = clamp(sel,1,array_height_2d(map_id)-1);
}
else
if mode==1 {
	draw_set_alpha(0.15);
	draw_set_colour(c_white);
	draw_rectangle(camera_get_view_x(cam)+camera_get_view_width(cam)-160,camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam)+1,camera_get_view_y(cam)+320,0);
	//draw_set_colour(c_white);
	draw_rectangle(camera_get_view_x(cam)+camera_get_view_width(cam)-160,camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam)+1,camera_get_view_y(cam)+320,1);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)+0.5,camera_get_view_y(cam),1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)-0.5,camera_get_view_y(cam),1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160),camera_get_view_y(cam)+0.5,1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160),camera_get_view_y(cam)-0.5,1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)+0.5,camera_get_view_y(cam)+0.5,1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)+0.5,camera_get_view_y(cam)-0.5,1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)-0.5,camera_get_view_y(cam)+0.5,1,1,c_dkgray,0.25);
	draw_sprite_part_ext(sTiles,0,mc_difx,mc_dify,160,320,(camera_get_view_x(cam)+camera_get_view_width(cam)-160)-0.5,camera_get_view_y(cam)-0.5,1,1,c_dkgray,0.25);
	draw_set_alpha(1);
	draw_sprite_part(sTiles,0,mc_difx,mc_dify,160,320,camera_get_view_x(cam)+camera_get_view_width(cam)-160,camera_get_view_y(cam));
	in_mc = 0;
	
	max_mw=-1;
	min_mw=100000;
	max_mh=-1;
	min_mh=100000;
	for(var i=0;i<ds_list_size(tile_sel);i++;) {
		max_mw = max(max_mw,tile_sel[| i] mod 64);
		min_mw = min(min_mw,tile_sel[| i] mod 64);
		max_mh = max(max_mh,tile_sel[| i] div 64);
		min_mh = min(min_mh,tile_sel[| i] div 64);
	}
	
	if mouse_x>camera_get_view_x(cam)+camera_get_view_width(cam)-160 && mouse_y<camera_get_view_y(cam)+320 {
		in_mc = 1;
		if mouse_check_button(mb_middle) {
			if mid_click==0 {
				mid_click=1;
				mid_clickx=mouse_x;
				mid_clicky=mouse_y;
				mc_x = mc_difx;
				mc_y = mc_dify;
			}
			mc_difx = mc_x+((mid_clickx-mouse_x)*1.5);
			mc_dify = mc_y+((mid_clicky-mouse_y)*1.5);
		} else {mid_click=0;};
		draw_set_colour(c_fuchsia);
		var xx = camera_get_view_x(cam)+camera_get_view_width(cam)-160, yy = camera_get_view_y(cam);
		//xx = camera_get_view_x(cam); yy = camera_get_view_y(cam);
		var xxx = (floor((mc_difx+mouse_x-xx)/16)*16)-mc_difx, yyy = (floor((mc_dify+mouse_y-yy)/16)*16)-mc_dify;
		draw_rectangle(xx+xxx,yy+yyy,xx+xxx+16,yy+yyy+16,1);
		var mxd=0, myd=0;
		mxd = floor((mc_difx+mouse_x-xx)/16);
		myd = floor((mc_dify+mouse_y-yy)/16);
		
		if keyboard_check(vk_control) {
			if mouse_check_button(mb_left) {
				var _tile = (mxd+(myd*64)), _g = 1;
				for(var i=0;i<ds_list_size(tile_sel);i++;) {
					if _tile==tile_sel[| i] _g=0;
				}
				if _g==1 ds_list_add(tile_sel,(mxd+(myd*64)));
				ds_list_sort(tile_sel,1);
			}
			else
			if mouse_check_button(mb_right) {
				var _tile = (mxd+(myd*64)), _g = -1;
				for(var i=0;i<ds_list_size(tile_sel);i++;) {
					if _tile==tile_sel[| i] {_g=i; break;};
				}
				if _g!=-1 ds_list_delete(tile_sel,_g);
				ds_list_sort(tile_sel,1);
			}
		}
		else
		if mouse_check_button_pressed(mb_left) {
			tile_selx = mxd;
			tile_sely = myd;
			ds_list_clear(tile_sel);
			ds_list_add(tile_sel,(mxd+(myd*64)));
		}
		if mouse_check_button(mb_left) {
			if tile_selx!=-1 || tile_sely!=-1 {
				if tile_selx-mxd!=0 || tile_sely-myd!=0 {
					ds_list_clear(tile_sel);
					for(var i=min(tile_selx,mxd); i<=max(tile_selx,mxd); i+=1;) {
						for(var j=min(tile_sely,myd); j<=max(tile_sely,myd); j+=1;) {
							ds_list_add(tile_sel,(i+(j*64)));
						}
					}
				}
				ds_list_sort(tile_sel,1);
				tile_dx1 = tile_selx;
				tile_dy1 = tile_sely;
				tile_dx2 = mxd;
				tile_dy2 = myd;
			}
		}
		else
		{
			ds_list_sort(tile_sel,1);
			if tile_selx!=-1 {
				tile_selx = -1;
				tile_sely = -1;
			}
		};
	}
	else
	if ds_list_size(tile_sel)>0 {
		draw_set_colour(c_red);
		var mx = (floor(mouse_x/16)*16), my = (floor(mouse_y/16)*16);
		_mw = 16;
		_mh = 16;
		if ds_list_size(tile_sel)>1 {
			_mw = ((max_mw-min_mw)*16)+16;
			_mh = ((max_mh-min_mh)*16)+16;
		}
		draw_rectangle((floor((mx-(_mw/2))/16)+1)*16,(floor((my-(_mh/2))/16)+1)*16,(floor((mx+(_mw/2))/16)+1)*16,(floor((my+(_mh/2))/16)+1)*16,1);
		//var _tltx = (tile_sel[| 0] mod 64);//, _tlty = (tile_sel[| 0] div 64);
		for(var i=0;i<ds_list_size(tile_sel);i++;) {
			draw_sprite_part_ext(sTiles,0,(tile_sel[| i] mod 64)*16,(tile_sel[| i] div 64)*16,16,16,
			(floor(((mx-(_mw/2))+(((tile_sel[| i] mod 64)-min_mw)*16))/16)+1)*16,
			(floor(((my-(_mh/2))+(((tile_sel[| i] div 64)-min_mh)*16))/16)+1)*16,1,1,c_white,0.5);
		}
	};
	
	if tile_dx1!=-1 {
		draw_set_colour(c_white);
		draw_set_alpha(1);
		var xx = ((camera_get_view_x(cam)+camera_get_view_width(cam)-160)-mc_difx);
		var yy = (camera_get_view_y(cam)-mc_dify);
		draw_rectangle(xx+(min_mw*16),yy+(min_mh*16),xx+(max_mw*16)+16,yy+(max_mh*16)+16,1);
	};

	if keyboard_check(vk_anykey) {
		var tkl = keyboard_check_pressed(vk_left), tkr = keyboard_check_pressed(vk_right), tku = keyboard_check_pressed(vk_up), tkd = keyboard_check_pressed(vk_down);
		if ((tkl+tkr+tku+tkd)>0) {
			for(var i=0;i<ds_list_size(tile_sel);i++;) {
				tile_sel[| i] += ((tkl*-1)+(tkr)+(tku*-64)+(tkd*64));
			}
		}
	}
}
else
if mode==2 {
	draw_sprite_ext(_sp,0,mouse_x,mouse_y,1,1,0,c_white,1/3);
	if keyboard_check(vk_shift) {
		_sp += round(mouse_wheel_down()-mouse_wheel_up());
		if !sprite_exists(_sp) _sp -= round(mouse_wheel_down()-mouse_wheel_up());
	}
	else
	{
		asset_layern += round(mouse_wheel_down()-mouse_wheel_up());
		if asset_layern>1 asset_layern=1 else if asset_layern<0 asset_layern=0;
	};
	draw_set_colour(c_orange);
	draw_set_alpha(1);
	draw_text(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),camera_get_view_y(cam)+8,asset_layer[asset_layern]);
}
else
if mode==4 {
	draw_set_alpha(1);
	draw_set_colour(c_yellow);
	var _in = noone;
	var _spr = -1, _scl = 1;
	if keyboard_check(vk_shift) {
		if keyboard_check(vk_alt) {
			_ob_depth += round(mouse_wheel_down()-mouse_wheel_up());
		}
		else _ob_depth += round(mouse_wheel_down()-mouse_wheel_up())*10;
	}
	else
	{
		_ob_an = reach(_ob_an,_ob,abs(_ob-_ob_an)/2);
		_ob += (round(mouse_wheel_down()-mouse_wheel_up())*((16*mouse_check_button(mb_right))+1));
		_ob = clamp(_ob,0,max_obj);
	};
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	
	for(var i=max(_ob-8,0); i<=min(_ob+8,max_obj); i++;) {
		_spr = object_get_sprite(i);
		if _spr==-1 {_scl=1/5; _spr=sCirc;} else _scl = 16/max(sprite_get_width(_spr),sprite_get_height(_spr));
		draw_sprite_ext(_spr,0,mouse_x+32,(mouse_y+((i-_ob_an)*17)),_scl,_scl,0,c_white,(0.75+((i==_ob)/4))*(!keyboard_check(vk_alt)));
		draw_set_alpha((0.75+((i==_ob)/4))*(!keyboard_check(vk_alt)));
		draw_set_colour(c_gray);
		if (i==_ob) draw_set_colour(c_yellow);
		draw_text(mouse_x-20-(i==_ob),(mouse_y+((i-_ob_an)*17)),object_get_name(i));
	}
	for(var i=min(_ob+9,max_obj); i<=min(_ob+25,max_obj); i++;) {
		_spr = object_get_sprite(i);
		if _spr==-1 {_scl=1/5; _spr=sCirc;} else _scl = 16/max(sprite_get_width(_spr),sprite_get_height(_spr));
		draw_sprite_ext(_spr,0,mouse_x+54,(mouse_y+(((_ob_an+17)-i)*17)),_scl,_scl,0,c_ltgray,(0.75+((i==_ob)/4))*(!keyboard_check(vk_alt)));
		//draw_set_alpha(0.75+((i==_ob)/4));
		//draw_set_colour(c_gray);
		//if (i==_ob) draw_set_colour(c_yellow);
		//draw_text(mouse_x-20-(i==_ob),(mouse_y-((i-_ob_an)*17)),object_get_name(i));
	}
	for(var i=min(_ob+26,max_obj); i<=min(_ob+42,max_obj); i++;) {
		_spr = object_get_sprite(i);
		if _spr==-1 {_scl=1/7; _spr=sCirc;} else _scl = 16/max(sprite_get_width(_spr),sprite_get_height(_spr));
		draw_sprite_ext(_spr,0,mouse_x+70,(mouse_y+((i-(_ob_an+34))*17)),_scl,_scl,0,c_ltgray,(0.75+((i==_ob)/4))*(!keyboard_check(vk_alt)));
		//draw_set_alpha(0.75+((i==_ob)/4));
		//draw_set_colour(c_gray);
		//if (i==_ob) draw_set_colour(c_yellow);
		//draw_text(mouse_x-20-(i==_ob),(mouse_y-((i-_ob_an)*17)),object_get_name(i));
	}
	draw_set_colour(merge_colour(c_aqua,c_edgb,0.5));
	draw_set_alpha(0.85+lengthdir_x(0.15,tick*777));
	draw_set_halign(fa_center);
	draw_set_font(fnt4);
	draw_text(mouse_x,(mouse_y)-8,"Depth: "+string(_ob_depth));
	draw_set_font(FONT_MAIN);
	draw_set_alpha(1);
	draw_set_colour(c_yellow);
	
	if keyboard_check(vk_alt) {
		if object_get_sprite(_ob)!=-1 {
			if keyboard_check(vk_control) {
				draw_sprite_ext(object_get_sprite(_ob),0,floor(mouse_x/8)*8,floor(mouse_y/8)*8,1,1,0,c_ltgray,0.5);
			}
			else
			{
				draw_sprite_ext(object_get_sprite(_ob),0,mouse_x,mouse_y,1,1,0,c_ltgray,0.5);
			};
		}
	}
	else
	if object_get_sprite(_ob)!=-1 {
		draw_sprite_ext(object_get_sprite(_ob),0,mouse_x,mouse_y,1,1,0,c_gray,0.1);
	};
	/*
	if _inover!=noone {
		if instance_exists(_inover) {
			draw_rectangle(_inover.bbox_left,_inover.bbox_top,_inover.bbox_right,_inover.bbox_bottom,1);
			if keyboard_check_pressed(vk_delete) {
				instance_destroy(_inover);
				ds_list_delete(obj_list,_inovern);
				_inover = noone;
			};
			if !keyboard_check(vk_alt) && mouse_check_button(mb_left) {
				_inover.xstart = mouse_x;
				_inover.x = mouse_x;
				_inover.ystart = mouse_y;
				_inover.y = mouse_y;
			}
			else
			if mouse_check_button_pressed(mb_right)==0 {
				//_inover = noone;
			}
			else
			if mouse_check_button_pressed(mb_right) {
				if _inover.object_index==PATH {
					(instance_create_depth(x,y,-100,PATH_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parLootable) {
					with(_inover) {inv_create();};
					(instance_create_depth(x,y,-100,LOOT_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parDoor_out) {
					(instance_create_depth(x,y,-100,DOOR_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parDoor_Flat) {
					(instance_create_depth(x,y,-100,DOOR_flat_input)).obj = _inover;
				};
			}
			if _inover==noone _inovern = -1;
		}
		_inover = noone;
	}*/
//	else
	//{
		var ___T = 0;
		for(var i=0; i<ds_list_size(obj_list); i++;) {
			_in = obj_list[| i];
			if instance_exists(_in) {
				if (mouse_x>=(_in.bbox_left-2) && mouse_x<=(_in.bbox_right+2) && mouse_y>=(_in.bbox_top-2) && mouse_y<=(_in.bbox_bottom+2)) {
					if (_in.depth==_ob_depth) || (keyboard_check(vk_shift) && keyboard_check(vk_control)) {
						draw_set_alpha(1);
						draw_set_colour(c_yellow);
						draw_rectangle(_in.bbox_left-1,_in.bbox_top-1,_in.bbox_right+1,_in.bbox_bottom+1,1);
						draw_set_font(FONT_MAIN);
						draw_set_halign(fa_right);
						draw_set_valign(fa_top);
						draw_text(CMX,CY+4,string(object_get_name(_in.object_index)));
						_inover = _in;
						_inovern = i;
						___T = 1;
						break;
					}
					else
					{
						draw_set_alpha(1/3);
						draw_set_colour(c_red);
						draw_rectangle(_in.bbox_left-1,_in.bbox_top-1,_in.bbox_right+1,_in.bbox_bottom+1,1);
						draw_set_alpha(1);
						draw_set_colour(c_yellow);
						draw_set_valign(fa_middle);
						draw_set_halign(fa_center);
						draw_set_font(FONT_MAIN);
						draw_text(mean(_in.bbox_left,_in.bbox_right),mean(_in.bbox_top,_in.bbox_bottom),string(_in.depth));
					};
				}
			}
		}
		if ___T==0 _inover=noone;
		
		if _inover!=noone && instance_exists(_inover) {
			draw_rectangle(_inover.bbox_left,_inover.bbox_top,_inover.bbox_right,_inover.bbox_bottom,1);
			if keyboard_check_pressed(vk_delete) {
				instance_destroy(_inover);
				ds_list_delete(obj_list,_inovern);
				_inover = noone;
			};
			if !keyboard_check(vk_alt) && mouse_check_button(mb_left) {
				_inover.xstart = mouse_x;
				_inover.x = mouse_x;
				_inover.ystart = mouse_y;
				_inover.y = mouse_y;
			}
			else
			if mouse_check_button_pressed(mb_right)==0 {
				//_inover = noone;
			}
			else
			if mouse_check_button_pressed(mb_right) {
				if _inover.object_index==PATH {
					(instance_create_depth(x,y,-100,PATH_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parLootable) {
					with(_inover) {inv_create();};
					//(instance_create_depth(x,y,-100,LOOT_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parDoor_out) {
					(instance_create_depth(x,y,-100,DOOR_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parDoor_Flat) {
					(instance_create_depth(x,y,-100,DOOR_flat_input)).obj = _inover;
				}
				else
				if _inover.object_index=oRoof_angle {
					(instance_create_depth(x,y,-100,ROOF_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,parNote) {
					(instance_create_depth(x,y,-100,NOTE_input)).obj = _inover;
				}
				else
				if object_is_ancestor(_inover.object_index,oBook) || _inover.object_index==oBook {
					(instance_create_depth(x,y,-100,BOOK_input)).obj = _inover;
				};
			}
			if _inover==noone _inovern = -1;
		}
	//};
};

if mode!=3 {
draw_set_colour(c_white);
draw_circle(mouse_x,mouse_y,3,1);
draw_line(mouse_x,mouse_y,mouse_x+9,mouse_y+9);
draw_line(mouse_x+9,mouse_y+9,mouse_x+14,mouse_y+9);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(camera_get_view_x(cam)+8,camera_get_view_y(cam)+camera_get_view_height(cam)-16,string(fps)+" / "+string(fps_n_tt)+"  "+string(array_height_2d(map))+" x "+string(array_length_2d(map,mw-1)));

}//var lay_idd = layer_get_id("tFRONT");
//var map_idd = layer_tilemap_get_id(lay_idd);
//draw_tilemap(map_idd,0,0);
//layer_set_visible
draw_set_alpha(1);
draw_set_colour(c_orange);
var title = "ARRAY MODE", mxd="",myd="",ttd="";
if mode==1 {
	title = "TILE MODE";
	//var lay_idd = layer_get_id("tFRONT");
	//var map_idd = layer_tilemap_get_id(lay_idd);
	var xx = camera_get_view_x(cam)+camera_get_view_width(cam)-160, yy = camera_get_view_y(cam);
	mxd = floor((mc_difx+mouse_x-xx)/16);//tilemap_get_cell_x_at_pixel(map_idd, mouse_x, mouse_y);
	myd = floor((mc_dify+mouse_y-yy)/16);//tilemap_get_cell_y_at_pixel(map_idd, mouse_x, mouse_y);
	ttd = (mxd+(myd*64));
}
else
if mode==2 {
	title = "ASSET MODE";
}
else
if mode==3 {
	title = "GAME MODE";
}
else
if mode==4 {
	title = "OBJECT MODE";
	//if ds_list_size(obj_list)>0 title = string(object_get_name(obj_list[| 0].object_index));
};

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if mode!=3 draw_text(camera_get_view_x(cam)+8,camera_get_view_y(cam)+8,title + "  "+string(mxd)+" "+string(myd)+" "+string(ttd)+" "+string(DEBUG)+"\n"+string(planet_name[CURRENT_PLANET])+"\n"+string(planet));



draw_set_alpha(1);
draw_set_colour($ffff00);
if mode==1 {
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	draw_set_colour($ffff00);
	draw_text(CMX,camera_get_view_y(cam)+8,_layer[_layer_n]+"\n"+string(layer_get_depth(layer_get_id(_layer[_layer_n]))));
	var _trx = 0, _try = 0, _trr = 0;
	//draw_set_alpha(mean(1/array_length_1d(_layer),1));
	for (var i = array_length_1d(_layer)-1; i >=0; --i) {
	    _trx = (CMX+(i*8)+2)-(array_length_1d(_layer)*4);
		_try = (camera_get_view_y(cam)+42)-i;
		_trr = ((array_length_1d(_layer)+1)-i)/2;
		if i==_layer_n draw_set_colour($ffff00) else draw_set_colour($0080ff);
		draw_set_alpha(1/1.333);
		draw_rectangle((_trx-(5+_trr))-1,(_try-(4+_trr))-1,(_trx+(5+_trr)),(_try+(4+_trr)),1);
		draw_set_alpha(mean(1-((i+1)/array_length_1d(_layer)),0.5)/1.333);
		if _layer_n<=i draw_rectangle(_trx-(5+_trr),_try-(4+_trr),_trx+(5+_trr),_try+(4+_trr),0);
	}
};

draw_set_colour(c_orange);

//var lay_idd = layer_get_id("aBACK");
//var spr_idd = layer_sprite_get_id(lay_idd,string(asset_list_back[| 0]));
if (mode==2) {
if (ds_list_size(asset_list[asset_layern])>0) {
	var __assel = 0;
	var _selan = (2-((abs(round(tick*600)) mod 300)/300));
	if !mouse_check_button(mb_right) asset_hold = 0;
	for(var i=ds_list_size(asset_list[asset_layern])-1; i>=0; i--;) {
		var spelid = ds_list_find_value(asset_list[asset_layern],i);// asset_list[| asset_layern, i];
		var asx = layer_sprite_get_x(spelid), asy = layer_sprite_get_y(spelid);
		var assp = layer_sprite_get_sprite(spelid);
		var asbbl = layer_sprite_get_x(spelid)-sprite_get_xoffset(assp);
		var asbbr = layer_sprite_get_x(spelid)+(sprite_get_width(assp)-sprite_get_xoffset(assp));
		var asbbt = layer_sprite_get_y(spelid)-sprite_get_yoffset(assp);
		var asbbb = layer_sprite_get_y(spelid)+(sprite_get_height(assp)-sprite_get_yoffset(assp));
		
		if spelid==asset_sel {
			draw_set_alpha(1);
			draw_set_colour(c_aqua);
			draw_rectangle(asbbl-_selan,asbbt-_selan,asbbr+_selan,asbbb+_selan,1);
		}
		
		if (mouse_x>asbbl && mouse_x<asbbr && mouse_y>asbbt && mouse_y<asbbb) {
			if __assel==0 {
				draw_set_alpha(1);
				draw_set_colour(c_yellow);
				draw_rectangle(asbbl,asbbt,asbbr,asbbb,1);
				__assel=1;
				if mouse_check_button_pressed(mb_right) {
					asset_sel=spelid;
					asset_sel_dx = mouse_x-asx;
					asset_sel_dy = mouse_y-asy;
					asset_hold = 1;
				}
			}
		}
	}
	
	if asset_hold==1 {
		layer_sprite_x(asset_sel,mouse_x-asset_sel_dx);
		layer_sprite_y(asset_sel,mouse_y-asset_sel_dy);
	}
	
	if __assel==0 && mouse_check_button_pressed(mb_right) {
		asset_sel = -1;
	};
	
	if asset_sel>0 {
		if keyboard_check_pressed(vk_left) layer_sprite_x(asset_sel,layer_sprite_get_x(asset_sel)-1);
		if keyboard_check_pressed(vk_right) layer_sprite_x(asset_sel,layer_sprite_get_x(asset_sel)+1);
		if keyboard_check_pressed(vk_up) layer_sprite_y(asset_sel,layer_sprite_get_y(asset_sel)-1);
		if keyboard_check_pressed(vk_down) layer_sprite_y(asset_sel,layer_sprite_get_y(asset_sel)+1);
		
		if keyboard_check_pressed(vk_delete) {layer_sprite_destroy(asset_sel); asset_sel=-1;};
	}
}
}

if keyboard_check_direct(ord("M")) {
	if mode==1 {
		if keyboard_check_pressed(vk_left) layer_move_tilemap(_layer[_layer_n],-1,0);
		if keyboard_check_pressed(vk_right) layer_move_tilemap(_layer[_layer_n],1,0);
		if keyboard_check_pressed(vk_up) layer_move_tilemap(_layer[_layer_n],0,-1);
		if keyboard_check_pressed(vk_down) layer_move_tilemap(_layer[_layer_n],0,1);
	}
	else
	if mode==2 {
		if keyboard_check_pressed(vk_left) {
		for(var i=0; i<ds_list_size(asset_list_back); i++;) {
			layer_sprite_x(ds_list_find_value(asset_list[asset_layern],i),layer_sprite_get_x(ds_list_find_value(asset_list[asset_layern],i))-16);
		}};
		if keyboard_check_pressed(vk_right) {
		for(var i=0; i<ds_list_size(asset_list_back); i++;) {
			layer_sprite_x(ds_list_find_value(asset_list[asset_layern],i),layer_sprite_get_x(ds_list_find_value(asset_list[asset_layern],i))+16);
		}};
		if keyboard_check_pressed(vk_up) {
		for(var i=0; i<ds_list_size(asset_list_back); i++;) {
			layer_sprite_y(ds_list_find_value(asset_list[asset_layern],i),layer_sprite_get_y(ds_list_find_value(asset_list[asset_layern],i))-16);
		}};
		if keyboard_check_pressed(vk_down) {
		for(var i=0; i<ds_list_size(asset_list_back); i++;) {
			layer_sprite_y(ds_list_find_value(asset_list[asset_layern],i),layer_sprite_get_y(ds_list_find_value(asset_list[asset_layern],i))+16);
		}};
	};
}



gpu_set_blendmode(bm_add);

if mode==4 {
	draw_set_alpha(1);
	draw_set_colour($204080);
	
	with(all) {
		draw_set_colour($204080);
		if instance_number(oControl._ob)>=1 {
			if (object_get_name(id.object_index)==object_get_name(oControl._ob)) ||
			(object_get_parent(id.object_index)>=0 && (object_get_parent(id.object_index)==object_get_parent(oControl._ob) ||
			(object_get_parent(id.object_index)==oControl._ob) ||
			(id.object_index==object_get_parent(oControl._ob)))) {
				draw_set_colour($ffff00);
			};
		};
		draw_circle(x,y,2.5,1);
		//draw_rectangle(x1,y1,x2,y2,1);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	}
}
gpu_set_blendmode(bm_normal);


if mode!=3 {
	if file_input==0 && keyboard_check_pressed(vk_escape) {
		file_input = 1;
		keyboard_string = file_current;
		file_inputn = -1;
	}
	else
	if file_input==1 && keyboard_check_pressed(ord("Q")) {
		file_input = 4;
	}
	else
	if file_input==4 && keyboard_check_pressed(ord("Y")) {
		game_end();
	}
	else
	if file_input==4 && keyboard_check_pressed(ord("N")) {
		file_input = 0;
	}
	else
	if file_input==1 && keyboard_check_pressed(ord("S")) {
		file_input = 2;
		keyboard_string = file_current;
		file_inputn = -1;
	}
	else
	if file_input==1 && keyboard_check_pressed(ord("L")) {
		file_input = 3;
		keyboard_string = file_current;
		file_inputn = 0;
	}
	else
	if file_input==1 && keyboard_check_pressed(vk_escape) {
		file_input = 0;
	};
	
	if file_input>0 {
		draw_rectangle_view(c_black,0.8);
	};
	
	//draw_text(cx+(cw/2),cy+(ch/2),string(real(keyboard_key))+" "+string(keyboard_key));
	
	if file_input==1 {
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text((camera_get_view_x(cam)+(camera_get_view_width(cam)/2)),(camera_get_view_y(cam)+(camera_get_view_height(cam)/2)),"S - Save   L - Load   Q - Quit");
		if keyboard_check_pressed(ord("0")) {planet = 0; CURRENT_PLANET = 0;};
		if keyboard_check_pressed(ord("1")) {planet = 1; CURRENT_PLANET = 1;};
		if keyboard_check_pressed(ord("2")) {planet = 2; CURRENT_PLANET = 2;};
		if keyboard_check_pressed(ord("3")) {planet = 3; CURRENT_PLANET = 3;};
		if keyboard_check_pressed(ord("4")) {planet = 4; CURRENT_PLANET = 4;};
		if keyboard_check_pressed(ord("5")) {planet = 5; CURRENT_PLANET = 5;};
		if keyboard_check_pressed(ord("6")) {planet = 6; CURRENT_PLANET = 6;};
		if keyboard_check_pressed(ord("7")) {planet = 7; CURRENT_PLANET = 7;};
		if keyboard_check_pressed(ord("8")) {planet = 8; CURRENT_PLANET = 8;};
		if keyboard_check_pressed(ord("9")) {planet = 9; CURRENT_PLANET = 9;};
	}
	else
	if file_input==4 {
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text((camera_get_view_x(cam)+(camera_get_view_width(cam)/2)),(camera_get_view_y(cam)+(camera_get_view_height(cam)/2)),"ARE YOU SURE YOU WANT TO QUIT?\n\nY / N ?");
	}
	else
	if file_input==2 {
		if keyboard_check(vk_anykey) {if (keyboard_check(vk_down)==0 && keyboard_check(vk_up)==0) file_inputn = -1;};
		//if keyboard_check(vk_anykey) file_inputn = -1;
		file_current = keyboard_string;
		var _tsw = (string_width(file_current)/2)+4, _tsh = (string_height(file_current)/2)+4;
		//draw_rectangle_view(c_black,0.5);
		draw_set_alpha(0.5);
		draw_set_colour(c_black);
		draw_rectangle((camera_get_view_x(cam)+(camera_get_view_width(cam)/2))-_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))-_tsh,
		(camera_get_view_x(cam)+(camera_get_view_width(cam)/2))+_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+_tsh,0);
		draw_set_colour(c_green);
		draw_set_alpha(1);
		draw_rectangle((camera_get_view_x(cam)+(camera_get_view_width(cam)/2))-_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))-_tsh,
		(camera_get_view_x(cam)+(camera_get_view_width(cam)/2))+_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+_tsh,1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text((camera_get_view_x(cam)+(camera_get_view_width(cam)/2)),(camera_get_view_y(cam)+(camera_get_view_height(cam)/2)),file_current);
		
		if keyboard_check_pressed(vk_enter) {
			map_save(working_directory + "level_data/" + file_current + ".rmlvl");
			reset_files();
			file_input = 0;
		}
		else
		if keyboard_check_pressed(vk_escape) {
			file_input = 1;
		};
		
		if keyboard_check_pressed(vk_down) {file_inputn+=1; if file_inputn==ds_list_size(file) file_inputn=0; keyboard_string = file[| file_inputn];};
		if keyboard_check_pressed(vk_up) {file_inputn-=1; if file_inputn<0 file_inputn=(ds_list_size(file)-1); keyboard_string = file[| file_inputn];};
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_alpha(1);
		draw_text(camera_get_view_x(cam)+4,camera_get_view_y(cam)+32,file_current);
		draw_set_colour(c_orange);
		draw_set_alpha(0.5);
		for(var i=0; i<ds_list_size(file); i++;) {
/////////////////////////////////////////////////////			if i==file_inputn {draw_sprite_ext(sEo_pointer,1,camera_get_view_x(cam)-1,camera_get_view_y(cam)+68+(i*11),1,1,0,c_orange,1); draw_set_alpha(1);};
			draw_text(camera_get_view_x(cam)+7+(i==file_inputn),camera_get_view_y(cam)+64+(i*11),ds_list_find_value(file,i));
			draw_set_alpha(0.5);
		};
	}
	else
	if file_input==3 {
		//if keyboard_check(vk_anykey) {if (keyboard_check(vk_down)==0 && keyboard_check(vk_up)==0) file_inputn = -1;};
		//if keyboard_check(vk_anykey) file_inputn = -1;
		//file_current = keyboard_string;
		var _tsw = (string_width(file_current)/2)+4, _tsh = (string_height(file_current)/2)+4;
		//draw_rectangle_view(c_black,0.5);
		/*draw_set_alpha(0.5);
		draw_set_colour(c_black);
		draw_rectangle((camera_get_view_x(cam)+(camera_get_view_width(cam)/2))-_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))-_tsh,
		(camera_get_view_x(cam)+(camera_get_view_width(cam)/2))+_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+_tsh,0);
		draw_set_colour(c_green);
		draw_set_alpha(1);
		draw_rectangle((camera_get_view_x(cam)+(camera_get_view_width(cam)/2))-_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))-_tsh,
		(camera_get_view_x(cam)+(camera_get_view_width(cam)/2))+_tsw,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+_tsh,1);*/
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_text((camera_get_view_x(cam)+(camera_get_view_width(cam)/2))-16,(camera_get_view_y(cam)+(camera_get_view_height(cam)/2)),file_current);
		
		if keyboard_check_pressed(vk_enter) {
			file_current = file[| file_inputn];
			//keyboard_string = file_current;
			map_load(working_directory + "level_data/" + file_current + ".rmlvl",file_current);
			//reset_files();
			file_input = 0;
		}
		else
		if keyboard_check_pressed(vk_escape) {
			file_input = 1;
		};
		
		if keyboard_check_pressed(vk_down) {file_inputn+=1+(keyboard_check(vk_shift)*3); if file_inputn==ds_list_size(file) file_inputn=0; keyboard_string = file[| file_inputn];};
		if keyboard_check_pressed(vk_up) {file_inputn-=1+(keyboard_check(vk_shift)*3); if file_inputn<0 file_inputn=(ds_list_size(file)-1); keyboard_string = file[| file_inputn];};
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_alpha(1);
		draw_text(camera_get_view_x(cam)+4,camera_get_view_y(cam)+32,file_current);
		draw_set_colour(c_orange);
		draw_set_alpha(1);
		for(var i=0; i<ds_list_size(file); i++;) {
			draw_set_colour((i==file_inputn)?c_aqua:c_orange);
			draw_set_alpha((i==file_inputn)?0.75:0.5);
///////////////////////////////////////			if i==file_inputn {draw_sprite_ext(sEo_pointer,1,(camera_get_view_x(cam)+(camera_get_view_width(cam)/2)-6)+(i==file_inputn),
/////////////////////////////////			((-2+camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+(i*11))-(file_inputn*11),1,1,0,c_orange,1); draw_set_alpha(1);};
			draw_text((camera_get_view_x(cam)+(camera_get_view_width(cam)/2)+4)+(i==file_inputn),
			((camera_get_view_y(cam)+(camera_get_view_height(cam)/2))+(i*13))-(file_inputnan*13),ds_list_find_value(file,i));
			//draw_set_alpha(0.5);
		};
	}
	file_inputnan = reach_tween(file_inputnan,file_inputn,pi);
};



/*if mode==3 {
	//draw_rectangle_view(c_black,1);
	if symbol_go==1 {
	oPlayer.control = 0;
	oPlayer.UI_OPEN = 1;
	//symbol_an = reach(symbol_an,1,(1-symbol_an)/11);
	draw_rectangle_view(c_black,(sqrt(mean(symbol_title_an,symbol_title_an2,symbol_title_an2))*min(symbol_fade,1))/2);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	var _temp = 0;
	var cxm = (cx+(cw/2)), cym = (cy+(ch/2));
	var dx1, dy1, dx2, dy2;
	
	symbol_an = 0;
	for(var k=0; k<symbols; k++) {
		symbol_an+=symbol[k,0];
	}
	
	draw_set_font(FONT_MAIN);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var str_wdth = string_width("Chapter "+string(CHAPTER));
	var t_strwdth = str_wdth/symbols;
	
	for(var i=0; i<symbols; i++) {
		if i==0 || symbol[@ max(i-1,0),0]>=0.85 symbol[i,0] = reach(symbol[i,0],1,(1-symbol[i,0])/7.333);
		for(var j=1; j<10; j++) {
			if (symbol[i,j]!=0 || (j==5 && symbol[i,10]>0)) && symbol[i,0]>0 {
				_temp = symbol[i,j];
				dx1 = (lerp(cxm+8,(cxm+(((j-1) mod 3)*8))-(((symbol[i,0]*12)-(i*24))+(3.5*16)),symbol[i,0])-12);//-(((symbol_an-symbol[i,0])*12)-(i*24));
				dy1 = lerp(cym+16,(cym+(((j-1) div 3)*16)),symbol[i,0])-16;
				dx2 = (lerp(dx1,(cxm+(((_temp-1) mod 3)*8))-(((symbol[i,0]*12)-(i*24))+(3.5*16)),symbol[i,0])-12);//-(((symbol_an-symbol[i,0])*12)-(i*24));
				dy2 = lerp(dy1,(cym+(((_temp-1) div 3)*16)),symbol[i,0])-16;
				
				dx1 = lerp(dx1,(((cxm+(((j-1) mod 3)*2))-(str_wdth/2))+(i*t_strwdth))-1,sqrt(symbol_title_an));
				dy1 = lerp(dy1,((cym+((j-1) div 3)*3))-4,sqrt(symbol_title_an));
				dx2 = lerp(dx2,(((cxm+(((_temp-1) mod 3)*2))-(str_wdth/2))+(i*t_strwdth))-1,sqrt(symbol_title_an));
				dy2 = lerp(dy2,((cym+((_temp-1) div 3)*3))-4,sqrt(symbol_title_an));
				draw_set_alpha((sqr(1-(max(symbol_title_an-0.90,0)*10))));
				if symbol[i,j]!=0 draw_line_width(dx1,dy1,dx2,dy2,1);
				if j==5 {
					if symbol[i,10]==1 {
						draw_polygon(dx1+1,dy1-(7*(1-sqrt(symbol_title_an))),31,2,8.5*(1-sqrt(symbol_title_an)),c_white,draw_get_alpha(),1,1,1);
					}
					else
					if symbol[i,10]==2 {
						draw_polygon(dx1+1,dy1+(9*(1-sqrt(symbol_title_an))),31,2,8.5*(1-sqrt(symbol_title_an)),c_white,draw_get_alpha(),1,1,1);
					};
				}
				draw_circle(dx1,dy1,0.5,0);
				if symbol[i,_temp]==0 {
					draw_circle(dx2,dy2,0.5,0);
				}
			}
		}
	}
	
	if symbol[symbols-1,0]>=1 && symbol_title_go==0 {
		symbol_title_go = 1;
		symbol_title_an = 0;
		symbol_title_an2 = 0;
	}
	else
	if symbol_title_go==1 {
		 symbol_title_an = reach(symbol_title_an,1,(1-symbol_title_an)/6.2);
		 symbol_title_an2 = min(symbol_title_an2+0.022,1);
	};
	
	draw_set_alpha(sqrt(mean(symbol_title_an,symbol_title_an2,symbol_title_an2))*min(symbol_fade,1));
	draw_text(cxm,cym-(sqr(sqr(sqr(symbol_title_an2)))*7),string_n_glitch("Chapter 1",sqr(symbol_title_an2)*min(symbol_fade,1)));
	draw_text(cxm,cym+3+(sqr(sqr(sqr(symbol_title_an2)))*9),string_n_glitch("ORIGIN",sqr(symbol_title_an2)*min(symbol_fade,1)));
	if symbol_title_an>=1 && symbol_title_an2>=1 {
		symbol_fade = max(symbol_fade-0.1,0);
		if symbol_fade<=0 {
			symbol_go = 0;
			oPlayer.UI_OPEN = 0;
			oPlayer.control = 1;
		}
	}
	
	//draw_set_colour(c_red);
	//draw_set_alpha(1);
	//draw_line(cxm,cy,cxm,cy+ch);
	
	}
	if 1==0 && keyboard_check_pressed(vk_enter) {
		symbol_go=1;
		symbol_title_an = 0;
		symbol_title_an2 = 0;
		symbol_title_go = 0;
		randomise();
		for(var i=0; i<symbols; i++) {
			symbol[i,0] = 0; // ANIM
			symbol[i,10] = choose(0,choose(1,2,choose(0,1,2,0,0,0,1,2,1,0),0)); // CIRCLE
			
			symbol[i,1] = 0; // tl
			symbol[i,2] = 0; // tc
			symbol[i,3] = 0; // tr
			symbol[i,4] = 0; // ml
			symbol[i,5] = 0; // mc
			symbol[i,6] = 0; // mr
			symbol[i,7] = 0; // bl
			symbol[i,8] = 0; // bc
			symbol[i,9] = 0; // br
			
			if symbol[i,10]>0 {
				if symbol[i,10]==1 {
					var ___d = choose(0,1,2,2,3,3);
					switch(___d) {
						case 0:
						symbol[i,2] = 8;
						break;
						case 1:
						symbol[i,2] = 5;
						break;
						case 2:
						symbol[i,5] = 8;
						break;
						default: break;
					}
					if choose(0,1,0,1,1)==1 || ___d==3 {
						if choose(0,1,1,1)==1 {
							symbol[i,7] = 5;
							symbol[i,9] = 5;
						}
					}
				};
				else
				{
					var ___d = choose(0,2,1,1,3,3);
					switch(___d) {
						case 0:
						symbol[i,2] = 8;
						break;
						case 1:
						symbol[i,2] = 5;
						break;
						case 2:
						symbol[i,5] = 8;
						break;
						default: break;
					}
					if choose(0,1,0,1,1)==1 || ___d==3 {
						if choose(0,0,1)==1 {
							symbol[i,1] = 5;
							symbol[i,3] = 5;
						}
						else
						{
							if choose(0,1)==1 {
								symbol[i,1] = choose(2,3);
								if symbol[i,2]==0 symbol[i,1]=3;
							}
							else {
								symbol[i,3] = choose(1,2);
								if symbol[i,2]==0 symbol[i,3]=1;
							};
						};
					}
				};
			}
			else
			{
				repeat(choose(1,1,1,1,3,2)) {
				switch(choose(0,2,1,3,1,1,3)) {
					case 0:
					symbol[i,2] = 8;
					break;
					case 1:
					symbol[i,2] = 5;
					break;
					case 2:
					symbol[i,8] = 5;
					break;
					default: break;
				}
				if choose(0,1)==1 {
					if choose(0,0,0,1)==1 {
						if choose(0,1)==1 {
						symbol[i,1] = 5;
						symbol[i,3] = 5;
						if irandom(1) symbol[i,2]=0;
						if irandom(1) symbol[i,2]=0;
						}
						else
						if choose(0,1)==1 {
						symbol[i,7] = 5;
						symbol[i,9] = 5;
						if irandom(1) symbol[i,8]=0;
						if irandom(1) symbol[i,8]=0;
						}
					}
					else
					{
						if choose(0,1)==1 {
							symbol[i,1] = choose(2,3);
							if symbol[i,2]==0 symbol[i,1]=3;
						}
						else {
							symbol[i,3] = choose(1,2);
							if symbol[i,2]==0 symbol[i,3]=1;
						};
					};
				}
				if irandom(1) {
					if choose(0,1)==1 {
						symbol[i,4] = choose(5,6);
						if symbol[i,5]==0 symbol[i,4]=6;
					}
					else {
						symbol[i,6] = choose(5,4);
						if symbol[i,5]==0 symbol[i,6]=4;
					};
				}
				if symbol[i,8]==0 {
					if choose(0,1)==1 {
						symbol[i,7] = choose(4,1);
						if symbol[i,4]==0 symbol[i,7]=1;
					}
					else {
						symbol[i,9] = choose(3,6);
						if symbol[i,6]==0 symbol[i,9]=3;
					};
				}
				if irandom(2)==1 symbol[i,4] = choose(0,3,9);
				if irandom(2)==1 symbol[i,6] = choose(0,1,7);
				
				if irandom(1) {
					if symbol[i,1]==3 {
						symbol[i,7]=0;
						symbol[i,8]=0;
						symbol[i,9]=0;
						symbol[i,3]=choose(7,8,9);
					}
				} else {
					if symbol[i,1]==3 {
						symbol[i,1]=choose(7,8,9,0);
						symbol[i,3] = 1;
					};
				};
				}
			};
		}
	}
}*/
}

draw_set_colour(c_white);
draw_set_alpha(1);

//if START_GAME==1 && instance_number(oPlayer)>=1 && oPlayer.control==1 && oPlayer.UI_OPEN==0 && oPlayer.physics==1 && keyboard_check_pressed(vk_escape) {
if (START_GAME==1 && keyboard_check_pressed(vk_escape)) {
	//quit = !(bool(floor(real(quit))));
	if (quit<=0) {
		quit = 1;
		var t_player_control = 0;
		if instance_number(oPlayer)>=1 {
			if START_GAME==1 {
				t_player_control = 1;
			};
		};
		(instance_create_depth(0,0,1000,oControl_Pause)).player_control = t_player_control;
		//oPlayer.control
	};
}
if (quit>=2 || instance_number(oControl_Pause)<=0) quit = 0;

/*if (quit==3) {
	depth = 1000;
	quit = 2;
};*/

/*

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
	var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));
	if instance_number(oPlayer)>=1 {
		oPlayer.control = 0;
		oPlayer.UI_OPEN = 1;
	}
	
	screen_save()
	
	gpu_set_blendmode(bm_normal);
	draw_rectangle_view(c_blackink,0.9);
	draw_rectangle_view(c_black,1/3);
	draw_rectangle_color(cx-2,cy-2,cx+cw+2,lerp(cy-2,cy+ch+2,quit_dt),c_aqua,c_aqua,c_aqua,c_aqua,0);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(FONT_MAIN);
	draw_set_colour(c_aqua);
	draw_text(cmx,cmy,"cancel\n\n\n\n\n\nquit");
	gpu_set_blendmode(bm_add);
	draw_ui_arrow(0,cmx,mean(cmy,cy,cy)-keyboard_check(vk_up),0,c_edgbb);
	draw_ui_arrow(0,cmx,mean(cmy,cy+ch,cy+ch)+keyboard_check(vk_down),2,c_aqua);
	
	if keyboard_check_pressed(vk_up) {quit=0;};
	if keyboard_check_pressed(ord("R")) {game_restart();};
	if keyboard_check(vk_down) game_end();//quit_dt=reach(quit_dt,1,1/45) else quit_dt*=0.75;
	//if quit_dt>=1 game_end();
	gpu_set_blendmode(bm_normal);
	
	if keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("E")) || keyboard_check(ord("D")) || keyboard_check(ord("F")) || keyboard_check(vk_space) {
		quit = 0;
	}

*/
/*
shader_set(shOmwarn);
shader_set_uniform_f(shader_get_uniform(shOmwarn,"iTime"),tick);
var surf = surface_create(320,180);
var tex = surface_get_texture(surf);
surface_free(surf);
shader_set_uniform_f(shader_get_uniform(shOmwarn,"iResolution"),texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_rectangle_view(0,1);
shader_reset();
*/
/*
var _n=noone;
draw_set_colour($4400ff);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
for(var i=0; i<array_length_1d(collision_list); i++;) {
	_n = collision_list[i];
	if instance_exists(_n) {
		draw_set_colour($4400ff);
		draw_circle(_n.x,_n.y,8,0);
		draw_set_colour($ffffff);
		draw_text_transformed(_n.x,_n.y,string(i+1)+"/"+string(array_length_1d(collision_list)),0.5,0.5,0);
	};
};*/

//draw_text(cx+64,cy+64,string(DIALOGUE_OPEN));

//draw_line_colour(cxm)

/*draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_triangle(cx+cw,cy-1,(cx+cw)-16,cy-1,cx+cw,cy+16,0)
gpu_set_blendmode(bm_add);
draw_polygon((cx+cw)-8,cy+8,14,0,4.94658,c_red,1,1,2,1);
gpu_set_blendmode(bm_normal);

