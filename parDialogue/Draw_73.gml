
//trigger = 0;
//load_dialogue();
draw_set_font(fnt7);

if sound_playing>0 {sound_playing-=1;} else instance_following = noone;
if instance_number(oPlayer)>=1 {
	if dlg_t>=0 && (dlg[dlg_t,6]==noone || instance_number(dlg[dlg_t,6])<=0 || instance_exists(dlg[dlg_t,6])==0) {
		dlg[dlg_t,6] = oPlayer;
	}
var sfx = 0;
if oControl.game_dialogue {
//var t_on = on;
if depth!=-1002 depth=-1002;
if round(DIALOGUE_OPEN+0.1)<=0 {
if end_exit==0 {
	if trigger>1 {
		if trigger==2 { // DISTANCE
			if point_distance(x,y,oPlayer.x,oPlayer.y)<=trigger_distance {
				on = 1;
			}
		}
		else
		if trigger==3 { // ACTIVATE
			if point_distance(x,y,oPlayer.x,oPlayer.y)<=trigger_distance {
				interact_arrow(x,y-interact_arrow_h,trigger_distance,interact_colour);
				if player_interact(x,y-interact_arrow_h,trigger_distance,1,1) {
					on = 1;
					if (pick_random) {
						for(var i=0; i<1000; i++) {
							var tname = pick_list[| round((sqr(random_range(0.000,1.000)) * 7.0))];
							if (tname != dlg_name) {
								dlg_name = tname;
								break;
							}
						}
						load_dialogue();
					}
				};
			}
		}
		else
		if trigger==4 { // DISTANCE & CONTROL
			if point_distance(x,y,oPlayer.x,oPlayer.y)<=trigger_distance && oPlayer.control>=1 {
				on = 1;
			}
		}
	}
	else
	if trigger==1 on=1;

	if t_on!=on && on==1 {
		dlg_t = 0;
		sound_once = 0;
		dlg_done = 0;
	}
}
else
if end_exit==1 && anim-0.01<0 {DIALOGUE_OPEN=0; instance_destroy();} // event_user(0);
}

anim = reach_tween(anim,on,7);
if on {LETTERBOX=1; oPlayer.telarod = 0;}

var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var cmx = (cx+(cw/2))+1, cmy = (cy+(ch/2))-4;
var _fH = floor((string_height("Mjqu0'.|?! ")+2)/2)-1;

if (_ins != 0) {
	dlg[dlg_t,1] = string_delete(dlg[dlg_t,1],_ins,1);
	dlg[dlg_t,1] = string_insert(" " + _ins_text,dlg[dlg_t,1],_ins);
	_ins = 0;
}

//DIALOGUE_OPEN = 0;
if dlg_t!=-1 && dlg_t!=-2 && (anim)>0 {
	
	if instance_exists(oEo) {
		if (dialogue_eo_move == 0) {
			oEo.dialogue_move = 10;
		};
	};
	
	if stop_player==1 && on!=0 {oPlayer.control = 0; oPlayer.UI_OPEN = 1;};
	var px = -1, py = -1;
	if dlg[dlg_t,6]==-2 {
		px = dlg[dlg_t,4];
		py = dlg[dlg_t,5];
		if round(abs(px))==0 || round(px)==-1 {
			px = x;
			py = y;
		};
		DIALOGUE_OPEN = 1;
	}
	else
	{
		var __IN = dlg[dlg_t,6];
		if __IN!=noone && instance_number(__IN)>=1 __IN=instance_nearest(mean(x,oPlayer.x),mean(y,oPlayer.y),__IN);
		if dlg[dlg_t,6]==self.id __IN=self.id;
		if instance_exists(__IN) {
			px = ((dlg[dlg_t,6]!=noone)?(__IN.x):(dlg[dlg_t,4]));
			py = ((dlg[dlg_t,6]!=noone)?(__IN.y):(dlg[dlg_t,5]))-12;
			if on!=0 {
			DIALOGUE_OPEN = 1;
			DIALOGUE_ID = __IN;
			DIALOGUE_X = px;
			DIALOGUE_Y = py+5;
			}
		}
	};

	//if (dlg[dlg_t,6]!=noone) {
		cmx = mean(cmx,px,px);
		cmy = mean(cmy,py,py)+4;
	//}
	if on==1 {
		oCamera.follow = -2;
		oCamera.x = reach_tween(oCamera.x,px,8);
		oCamera.y = reach_tween(oCamera.y,py,8);
		oCamera.xx = oCamera.x;
		oCamera.yy = oCamera.y;
	}

	var _h = ceil(ch/4)*anim;
	var _w = min(_h*3,mean(string_width(dlg[dlg_t,1])/2,_h*3,string_width(dlg[dlg_t,1]+"m")/2))*anim;
	
	var _x1 = cmx-(_w/2), _y1 = hrnd(lerp(cmy,mean(cmy,cy+ch)-(_h/2),min(anim+0.2,1))), _x2 = cmx+(_w/2);//mean(cmy,cy+ch)+(_h/2);
	
	if dlg[dlg_t,2]==0 {
		_y1 = hrnd(mean(cmy,(cy+ch),_y1,(cy+ch),_y1));
	}
	
	is_choice_n = 0;
	if dlg[@ dlg_t,8]!=0 && dlg[@ dlg_t,8]!="" && (dlg[@ dlg_t,8])!=-1 && (dlg[@ dlg_t,8])!="-1" && is_undefined(dlg[@ dlg_t,8])==0 {
		var _R_an = (((dlg[@ dlg_t,9]!=0) && (dlg[@ dlg_t,9]!=-1) && (dlg[@ dlg_t,9]!="") && (dlg[@ dlg_t,9]!="-1"))+
		((dlg[@ dlg_t,10]!=0) && (dlg[@ dlg_t,10]!=-1) && (dlg[@ dlg_t,10]!="") && (dlg[@ dlg_t,10]!="-1"))+
		((dlg[@ dlg_t,11]!=0) && (dlg[@ dlg_t,11]!=-1) && (dlg[@ dlg_t,11]!="") && (dlg[@ dlg_t,11]!="-1"))+1);
		choice_n += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
		if choice_n<0 {
			choice_n = _R_an-1;
			choice_an = _R_an;
		}
		else
		if choice_n>_R_an-1 {
			choice_n = 0;
			choice_an = -1;
		};
		choice_an = reach_tween(choice_an,choice_n,5);
		is_choice_n = 1;
		if t>=ceil(string_length(dlg[dlg_t,1])-1) is_choice = reach_tween(is_choice,1,6);
		is_choice_an = reach_tween(is_choice_an,is_choice,6)
		_y1 = hrnd(lerp(_y1,mean(cmy,_y1)+2,is_choice));
		draw_set_font(fnt7);
		if is_choice>0 {
			var _R_t = "", _R_tw = 0, _R_ym = 0, _R_xm = 0;
			for(var R=0; R<_R_an; R++) {
				_R_t = dlg[@ dlg_t,8+R];
				_R_tw = string_width(_R_t)/2;
				_R_ym = lerp((cy+ch)+16,mean(_y1+8,cy+ch),is_choice)-1;
				_R_xm = cmx-((choice_an-R)*((cw/2)-(_R_tw/2)));
				draw_set_colour(make_colour_rgb(18,18,18));
				draw_set_alpha(sqrt((anim)*is_choice)*(choice_n==R?1:(2/3)));
				draw_roundrect_ext((_R_xm-((_R_tw/2)+8)),_R_ym-10.5,(_R_xm+((_R_tw/2)+8)),_R_ym+9,4,4,0);
				draw_set_colour(((choice_n==R)?(c_white):(c_ltgray)));
				//draw_set_alpha(sqrt(is_choice));
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_text_transformed(_R_xm,_R_ym,_R_t,0.5,0.5,0);
				
				draw_circle(cmx-((choice_an-R)*4),mean(_R_ym+10.5,cy+ch)+1,1,choice_n!=R);
				if R==choice_n {
					if choice_n!=0 draw_ui_arrow(0,mean((_R_xm-(_R_tw/2))-16,mean(cmx,cx,(_R_xm-(_R_tw/2)))),_R_ym,3,c_ltgray);
					if choice_n!=(_R_an-1) draw_ui_arrow(0,mean((_R_xm+(_R_tw/2))+16,mean(cmx,cx+cw,(_R_xm+(_R_tw/2)))),_R_ym,1,c_ltgray);
				}
			};
		}
	} else if is_choice!=0 is_choice = 0;//reach_tween(is_choice,0,7);
	
	/*
	if is_choice>0 {
		//if (dlg[@ dlg_t-1,8]!=-1 && dlg[@ dlg_t-1,8]!="") || (dlg[@ dlg_t,8]!=-1 && dlg[@ dlg_t,8]!="") {
		var _R_an = ((dlg[@ dlg_t,9]!=-1)+(dlg[@ dlg_t,10]!=-1)+(dlg[@ dlg_t,11]!=-1)+1);
		for(var r=0; r<_R_an; r++) {
			
		};
		//}
	}*/
	
	var _y2 = hrnd(_y1+(((11+line)*anim)*anim));
	
	draw_set_colour(make_colour_rgb(18,18,18));
	draw_set_alpha(sqr(sqr(anim)));
	if dlg[dlg_t,1]!="" {
	if dlg[dlg_t,2]!=0 {
		if dlg[dlg_t,2]==1 {
			draw_set_colour(make_colour_rgb(29,29,29));
			draw_triangle(cmx-12,_y1-2,(cmx-8)+lengthdir_x(4,point_direction(cmx-13,cmy+8,(((dlg[dlg_t,6]!=-2) && instance_exists(dlg[dlg_t,6]))?(dlg[dlg_t,6].x):(x)),(((dlg[dlg_t,6]!=-2) && instance_exists(dlg[dlg_t,6]))?(dlg[dlg_t,6].y):(y)))),((_y1-(4*sqr(sqr(anim))))-2.5),cmx-4,_y1-2,0);
			draw_roundrect_ext((_x1-2),(_y1-2.5),(_x2+2),(_y2+1.5),4,4,0);
			draw_set_colour(make_colour_rgb(18,18,18));
			draw_triangle(cmx-12,_y1-2,(cmx-8)+lengthdir_x(4,point_direction(cmx-13,cmy+8,(((dlg[dlg_t,6]!=-2) && instance_exists(dlg[dlg_t,6]))?(dlg[dlg_t,6].x):(x)),(((dlg[dlg_t,6]!=-2) && instance_exists(dlg[dlg_t,6]))?(dlg[dlg_t,6].y):(y)))),((_y1-(4*sqr(sqr(anim))))-2),cmx-4,_y1-2,0);
			draw_roundrect_ext((_x1-2),(_y1-2),(_x2+2),(_y2+2),4,4,0);
		}
		else
		{
			draw_set_alpha(sqr(sqr(anim)));
			draw_set_colour(make_colour_rgb(29,29,29));
			draw_circle(cmx-8,(_y1-2.5)-(4*sqr(sqr(anim)))+lengthdir_y(0.25,tick*233.333),3,0);
			draw_circle(cmx-6.5,(_y1-2.5)-(9.5*sqr(sqr(anim)))+lengthdir_x(0.25,tick*233.333),1.5,0);
			draw_roundrect_ext((_x1-2)+lengthdir_y(0.25,tick*233.333),(_y1-2.5)+lengthdir_x(0.25,tick*233.333),(_x2+2)+lengthdir_x(0.25,tick*233.333),(_y2+1.5)+lengthdir_y(0.25,tick*233.333),11,11,0);
			draw_set_colour(make_colour_rgb(18,18,18));
			draw_circle(cmx-8,(_y1-2)-(4*sqr(sqr(anim)))+lengthdir_y(0.25,tick*233.333),3,0);
			draw_circle(cmx-6.5,(_y1-2)-(9.5*sqr(sqr(anim)))+lengthdir_x(0.25,tick*233.333),1.5,0);
			draw_roundrect_ext((_x1-2)+lengthdir_y(0.25,tick*233.333),(_y1-2)+lengthdir_x(0.25,tick*233.333),(_x2+2)+lengthdir_x(0.25,tick*233.333),(_y2+2)+lengthdir_y(0.25,tick*233.333),11,11,0);
		};
	}
	else {
		draw_set_colour(make_colour_rgb(29,29,29));
		draw_roundrect_ext((_x1-2),(_y1-2.5),(_x2+2),(_y2+1.5),4,4,0);
		draw_set_colour(make_colour_rgb(18,18,18));
		draw_roundrect_ext((_x1-2),(_y1-2),(_x2+2),(_y2+2),4,4,0);
	}
	};
	
	draw_set_alpha(sqr(sqr(anim)));
	
	//draw_set_colour(make_colour_rgb(25,25,25));
	draw_set_alpha(1);
	draw_set_font(fnt7);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	if anim+0.01>0.9 {
		t_tick -= 1;
		if t_tick<0 {
			t_tick=0;
			t+=1;
			if string_char_at(dlg[dlg_t,1],t)=="." ||
			string_char_at(dlg[dlg_t,1],t)=="!" ||
			string_char_at(dlg[dlg_t,1],t)=="?" ||
			string_char_at(dlg[dlg_t,1],t)=="," ||
			string_char_at(dlg[dlg_t,1],t)=="-" t_tick = ceil((ceil((ceil(fps/5)+1)/1.5)+1.5)/1.5);
		};
	}
	var __t = "", n_line = 0, p_chr = "", _chr = "";
	var _tvar = "", _tx = 0, _ty = 0;
	var _shake = 0, _waveh = 0, _wavev = 0, _colour = -1, _scramble = 0, _glitch = 0;
	
	for(var i=1; i<=min(t,string_length(dlg[dlg_t,1]+" ")); i++) {
		_chr = string_char_at(dlg[dlg_t,1],i);
		if _chr=="|" {
			switch(string_char_at(dlg[dlg_t,1],i+1)) {
				case "s":
					_shake = !(bool(floor(real(_shake))));
				break;
				
				case "h":
					_waveh = !(bool(floor(real(_waveh))));
				break;
				
				case "v":
					_wavev = !(bool(floor(real(_wavev))));
				break;
				
				case "x":
					_scramble = !(bool(floor(real(_scramble))));
				break;
				
				case "z":
					_glitch = !(bool(floor(real(_glitch))));
				break;
				
				case "d":
					_ins = i+1;
					_ins_text = string(global.D_NUMBER);
					/*string_insert("TEST",dlg[dlg_t,1],i+2);
					string_delete(dlg[dlg_t,1],i+1,1);
					string_insert(string(global.D_NUMBER),dlg[dlg_t,1],i+1);*/
				break;
				
				case "c":
					if _colour!=-1 _colour=-1 else {
						i+=1;
						switch(string_char_at(dlg[dlg_t,1],i+1)) {
							case "e":
							_colour = merge_colour(c_white,c_edgb,0.85);
							break;
							
							case "i":
							_colour = merge_colour(c_white,c_iiem,0.85);
							break;
							
							case "a":
							_colour = merge_colour(c_white,c_aqua,0.85);
							break;
							
							case "b":
							_colour = merge_colour(c_white,c_edgbbb,0.85);
							break;
							
							case "o":
							_colour = merge_colour(c_white,make_colour_rgb(255,128,0),0.85);
							break;
							
							case "p":
							_colour = merge_colour(c_white,make_colour_rgb(255,0,255),0.85);
							break;
							
							case "g":
							_colour = merge_colour(c_white,c_gray,0.85);
							break;
							
							case "m":
							_colour = merge_colour(c_white,make_colour_rgb(0,255,192),0.85);
							break;
							
							case "v":
							_colour = merge_colour(c_aqua,make_color_hsv(floor((tick*155.5555554)+random(32)+random(32)) mod 255,255,255),0.5);
							break;
						}
					}
				break;
			}
			_chr="";
			i+=1;
		}
		else
		{
		if p_chr==" " && (string_width(__t+"MMMMMMMM")/2)>=(_w-8) {
			for(var j=1; j<12; j++) {
				if (string_width(__t+_tvar)/2)>=(_w-8) {
					n_line += 1;
					__t = "";
					_tvar = "";
					break;
				}
				else
				{
					_tvar += string_char_at(dlg[dlg_t,1],i+j);
					if string_char_at(dlg[dlg_t,1],i+j)==" " {
						_tvar = "";
						break;
					};
				};
			}
		};
		if t>=i {
			if _waveh {
				_tx = lengthdir_x(0.41666,(tick*-350)+(i*11.25));
			}
			if _wavev {
				_ty = lengthdir_y(0.41666,(tick*-350)+(i*11.25));
			}
			if _shake {
				_tx += random_range(-0.27,0.27)/sqr((30+((t-i)/2))/40);
				_ty += random_range(-0.27,0.27)/sqr((30+((t-i)/2))/40);
			}
			if _glitch {
				random_set_seed(i);
				random_set_seed(floor(i+floor(tick*random_range(0.75,3.5))));
				_tx += random_range(-0.5,0.5);
				_ty += random_range(-0.5,0.5);
				randomise();
			}
			if _scramble {
				//_chr = chr(ord(_chr)+choose(-1,1)+irandom_range(1,4))
				var ___QWE = choose(-4,-3,-2,-1,1,2,3,4), ___QWEE = choose(-1,1);
				repeat(100) {
					if floor(string_width(chr(ord(_chr)+(___QWE*___QWEE)))/2)!=floor(string_width(_chr)/2) || ((___QWE) == 0) {
						if (___QWEE==1) {___QWEE*=-1;} else {___QWE+=1; ___QWEE*=-1;}
					} else {
						_chr = chr(ord(_chr)+(___QWE*___QWEE));
						break;
					};
				}
			}
			draw_set_colour(make_colour_rgb(9,9,9));
			draw_text_transformed(_x1+4+(string_width(__t)/2)+_tx,_y1+4.5+(n_line*_fH)+_ty,_chr,0.5,0.5,0);
			draw_text_transformed(_x1+4.5+(string_width(__t)/2)+_tx,_y1+4.5+(n_line*_fH)+_ty,_chr,0.5,0.5,0);
			draw_text_transformed(_x1+4.5+(string_width(__t)/2)+_tx,_y1+4+(n_line*_fH)+_ty,_chr,0.5,0.5,0);
			draw_set_colour(c_white);
			if _colour!=-1 draw_set_colour(_colour);
			if dlg[dlg_t,2]==2 draw_set_colour(merge_colour(c_black,draw_get_color(),0.75));
			draw_text_transformed((_x1+4+(string_width(__t)/2)+_tx),(_y1+4+(n_line*_fH)+_ty),_chr,0.5,0.5,0);
			if dlg[@ dlg_t,16]!=-1 && dlg[@ dlg_t,16]!="" && dlg[@ dlg_t,16]!="-1" && t_tick==0 && sfx==0 {
				if (string_char_at(dlg[dlg_t,1],t)!=" " && string_char_at(dlg[dlg_t,1],t)!="." && string_char_at(dlg[dlg_t,1],t)!="-" && 
				((t<=1 || (t==i && string_length(__t)<=0)) || (string_char_at(dlg[dlg_t,1],t-1)==" "))) && sound_once==0 {
					if is_string(dlg[dlg_t,16]) {
					randomize();
					if asset_get_type(dlg[dlg_t,16])==asset_sound { // if string_copy(dlg[dlg_t,16],1,3)=="snd" {
						_SND = asset_get_index(dlg[dlg_t,16]);
						sound_once = 1;
					} else {
					var _SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
					if _SND==prev_snd {
						_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
						if _SND==prev_snd {
							_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
							if _SND==prev_snd {
								_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
								if _SND==prev_snd {
									_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
									if _SND==prev_snd {
										_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
										if _SND==prev_snd {
											_SND = (script_execute(asset_get_index(dlg[dlg_t,16])));
										}
									}
								}
							}
						}
					}
					}
					}
					else {_SND = dlg[dlg_t,16]; sound_once=1;}
					//if sound_once==1 || (sound_once==0 && (choose(1,1,0))) 
					if instance_exists(dlg[@ dlg_t,17]) && dlg[@ dlg_t,17]!=noone && dlg[@ dlg_t,17]!="-1" && dlg[@ dlg_t,17]!=-1 && dlg[@ dlg_t,17]!="-2" && dlg[@ dlg_t,17]!=-2 {
						if dlg[dlg_t,2]==1 {
							play_sound_pos(_SND,10,0,mean(1,random_range(0.9,1)),0.9,0,dlg[@ dlg_t,17].x,dlg[@ dlg_t,17].y);
							sound_playing = 30;
							instance_following = (dlg[@ dlg_t,17].object_index);
						} else
						{
							play_sound_pos(_SND,10,0,1.001,0.9/5,5,dlg[@ dlg_t,17].x-100,dlg[@ dlg_t,17].y);
							play_sound_pos(_SND,10,0,0.999,0.9/5,5,dlg[@ dlg_t,17].x+100,dlg[@ dlg_t,17].y);
						};
					}
					else
					{
						play_sound(_SND,10,0,mean(1,random_range(0.9,1)),0.9,0);
					};
					prev_snd = _SND;
					sfx = 1;
				}
			}
		}
		__t += _chr;
		p_chr = _chr;
		
		_tx = 0;
		_ty = 0;
		}
	};
	line = reach_tween(line,n_line*_fH,7);
	
	if dlg[dlg_t,0]!="" && dlg[dlg_t,1]!="" {
		draw_set_alpha(sqr(anim)*(!end_exit));
		draw_set_colour(make_colour_rgb(29,29,29));
		draw_roundrect_ext(_x1-2,_y1-8.5,_x1+(string_width(dlg[dlg_t,0])/2)+5.5,_y1+1,5.5,5.5,0);
		draw_set_colour(make_colour_rgb(18,18,18));
		draw_roundrect_ext(_x1-2,_y1-8,_x1+(string_width(dlg[dlg_t,0])/2)+5.5,_y1+1.5,5.5,5.5,0);
		draw_set_colour(make_colour_rgb(229,229,229));
		draw_set_valign(fa_middle);
		draw_text_transformed(_x1+3,_y1-2,dlg[dlg_t,0],0.5,0.5,0);
		
		//draw_sprite_ext(sHeads,12,_x1-28,_y1-2,0.5,0.5,0,c_white,1);
	}
	
	if (t>=string_length(dlg[dlg_t,1]) || round(real(alarm[0]))==1) && is_choice_n==0 {
		
		draw_set_alpha(sqrt(anim));
		if alarm[0]==-1 && dlg[dlg_t,1]!="" {
		draw_set_colour(make_colour_rgb(29,29,29));
		draw_circle(_x2-1,_y2+2,4.75,0);
		//draw_sprite_ext(sArrow,0,_x2,_y2+3.25+lengthdir_y(0.5,tick*700),0.5,0.5,-45,make_colour_rgb(230,230,230),1);
		draw_set_colour(make_colour_rgb(18,18,18));
		draw_circle(_x2-1,_y2+2.5,4.75,0);
		draw_sprite_ext(sArrow,0,_x2,_y2+3.75+lengthdir_y(0.5,tick*700),0.5,0.5,-45,make_colour_rgb(230,230,230),1);
		//gpu_set_blendmode(bm_normal);
		}
		if (keyboard_check_pressed(global.kku) && alarm[0]==-1) || round(real(alarm[0]))==1 {
			
		//if dlg_anim_id!=noone {dlg_anim_id.dlg_anim=0; dlg_anim_id=noone;};
		/*if dlg[dlg_t,3]!="" {
			var __c = "";
			for(var k=1; k<=string_length(dlg[dlg_t,3]); k++) {
				__c = string_char_at(dlg[dlg_t,3],k);
				//if __c=="s" {cam_shake=real(string_char_at(dlg[dlg_t,3],k+1));}
				//if __c=="a" {(dlg[dlg_t,6]).dlg_anim=real(string_char_at(dlg[dlg_t,3],k+1)); dlg_anim_id=dlg[dlg_t,6];}
				// GIVE ITEM
			}
		}*/
		if dlg[dlg_t,7]==-1 {
			dlg_t += 1;
			t = 0;
			t_tick = 10;
			line = 0;
			anim = 0.5;
			sound_once = 0;
			choice_n = 0;
		}
		else
		if dlg[dlg_t,7]==-2 && dlg_done==0 {
			t = 0;
			t_tick = 10;
			line = 0;
			on = 0;
			oCamera.follow = oPlayer;
			oCamera.x = oPlayer.x;
			oCamera.y = oPlayer.y-12;
			oCamera.xx = oPlayer.x;
			oCamera.yy = oPlayer.y-12;
			//oPlayer.control = 1;
			if one_off==1 end_exit=1;// else event_user(0);//instance_destroy();
			event_user(0);
			dlg_done = 1;
			DIALOGUE_OPEN = 0;
			if instance_number(oEo)>=1 oEo.look_id = noone;
			choice_n = 0;
			exit;
		}
		else
		{
			dlg_t = dlg[dlg_t,7];
			t = 0;
			t_tick = 10;
			line = 0;
			anim = 0.5;
			sound_once = 0;
		};
		alarm[0] = -1;
		};
	}
	else
	if is_choice>0.99 && is_choice_n==1 && is_choice_an>0.99 {
		if abs(choice_an-choice_n)-0.05<=0 {
			if keyboard_check_pressed(global.kku) {
				//if dlg_anim_id!=noone {dlg_anim_id.dlg_anim=0; dlg_anim_id=noone;};
				if dlg[dlg_t,7]==-1 {
					sound_once = 0;
					t = 0;
					t_tick = 10;
					line = 0;
					anim = 0.5;
					if dlg[@ dlg_t,12+choice_n]==-2 {
						t = 0;
						t_tick = 10;
						line = 0;
						on = 0;
						oCamera.follow = oPlayer;
						oCamera.x = oPlayer.x;
						oCamera.y = oPlayer.y-12;
						oCamera.xx = oPlayer.x;
						oCamera.yy = oPlayer.y-12;
						//oPlayer.control = 1;
						if one_off==1 end_exit=1;// else event_user(0);//instance_destroy();
						event_user(0);
						dlg_done = 1;
						DIALOGUE_OPEN = 0;
						if instance_number(oEo)>=1 oEo.look_id = noone;
						exit;
					} else dlg_t = dlg[@ dlg_t,12+choice_n];
					choice_n = 0;
				}
			}
				
			draw_set_colour(make_colour_rgb(20,20,20));
			draw_set_alpha(anim*is_choice);
			draw_circle(cmx-1,mean(_y1+8,cy+ch)+11,5.5,0);
			//draw_circle(_x2-1,_y2+2,5.5,0);
		
			//gpu_set_blendmode(bm_add);
			draw_sprite_ext(sArrow,0,cmx,(mean(_y1+8,cy+ch)+12.25)+lengthdir_y(0.5,tick*700),0.5,0.5,-45,make_colour_rgb(230,230,230),1);
		}
	};
	draw_set_alpha(1);
//};

if t_dlg_t!=dlg_t && dlg_t!=-1 && sign(dlg_t)>=0 && dlg_t!=undefined && dlg_t!=noone {
	//alarm[0] = -1;
	if dlg[dlg_t,3]!="" {
		var __c = "";
		for(var k=1; k<=string_length(dlg[dlg_t,3]); k++) {
			__c = string_char_at(dlg[dlg_t,3],k);
			if __c=="s" {cam_shake=real_string(string_char_at(dlg[dlg_t,3],k+1));}
			if __c=="a" {
				var ___ttt = floor(real_string(string_char_at(dlg[dlg_t,3],k+1)));
				if (___ttt==1) {
					if string(floor(real_string(string_char_at(dlg[dlg_t,3],k+2))))!="" {
						___ttt = floor(real_string(string_copy(dlg[dlg_t,3],k+1,2)));
					};
				};
				(dlg[dlg_t,6]).dlg_anim=___ttt;//real(string_char_at(dlg[dlg_t,3],k+1));
				dlg_anim_id=dlg[dlg_t,6];
			}
			if __c=="f" {
				if instance_number(oEo)>=1 && string_char_at(dlg[dlg_t,3],k+1)=="e" {oPlayer.facing=1; if oEo.x<x oPlayer.facing=-1; oEo.look_id=oPlayer;}
				if string_char_at(dlg[dlg_t,3],k+1)=="d" {dlg[dlg_t,6].facing=1; if dlg[dlg_t,6].x>x dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="p" {dlg[dlg_t,6].facing=1; if dlg[dlg_t,6].x>oPlayer.x dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="k" {
					if string_char_at(dlg[dlg_t,3],k+2)=="0" {oPlayer.facing=-1}
					else
					if string_char_at(dlg[dlg_t,3],k+2)=="d" {oPlayer.facing=-1; if oPlayer.x<x oPlayer.facing=1}
					else oPlayer.facing=1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="l" {dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="r" {dlg[dlg_t,6].facing=1;}
			};
			if __c=="t" {alarm[0]=round(real_string(string_char_at(dlg[dlg_t,3],k+1)+string_char_at(dlg[dlg_t,3],k+2)+string_char_at(dlg[dlg_t,3],k+3)))};
			if __c=="h" {
				if string_char_at(dlg[dlg_t,3],k+1)=="-" {
				dlg[dlg_t,6].hsp -= round(real_string(string_char_at(dlg[dlg_t,3],k+2)));}
				else
				dlg[dlg_t,6].hsp += round(real_string(string_char_at(dlg[dlg_t,3],k+1)));
			};
			if __c=="v" {
				if string_char_at(dlg[dlg_t,3],k+1)=="-" {
				dlg[dlg_t,6].vsp -= round(real_string(string_char_at(dlg[dlg_t,3],k+2)));}
				else
				dlg[dlg_t,6].vsp += round(real_string(string_char_at(dlg[dlg_t,3],k+1)));
			};
			//if __c=="v" {play_sound_pos(voice[real(string_char_at(dlg[dlg_t,3],k+1))],10,0,mean(1,1,random_range(0.9,1.1)),1,0,x,y);}
		}
	}
	//if dlg[@ dlg_t,16]!=-1 play_sound_pos(dlg[@ dlg_t,16],10,0,mean(1,1,random_range(0.9,1.1)),1,0,dlg[@ dlg_t,17].x,dlg[@ dlg_t,17].y);
	if dlg[@ dlg_t, 18] != 0 {
		switch(dlg[@ dlg_t,19]) {
			case 0:
				instance_create_depth(mean(dlg[@ dlg_t,18].x,(dlg[@ dlg_t,18].bbox_right+4))+1,dlg[@ dlg_t,18].bbox_top-2,99,oEmote_exclaim);
			break;
			
			case 1:
				instance_create_depth(mean(dlg[@ dlg_t,18].x,(dlg[@ dlg_t,18].bbox_right+4))+1,dlg[@ dlg_t,18].bbox_top-2,99,oEmote_question);
			break;
		}
	}
}
};// else DIALOGUE_OPEN = 0;
t_dlg_t = dlg_t;



}
}
