
var UISP = ui_sp[ui];
if (!ui_can[ui]) UISP = sEo_uiEmpty;

if dialogue_move<=1 {
	if DIALOGUE_OPEN==1 {
		if point_distance(oPlayer.x-(player_facing*12),oPlayer.y-8,x,y)>8 obj_setpos(oEo,mean(oEo.x,mean(oEo.x,oEo.x,oPlayer.x-(player_facing*12))),mean(oEo.y,mean(oEo.y,oEo.y,oPlayer.y-8)));
	} else player_facing = oPlayer.facing;
} else dialogue_move=reach(dialogue_move,1,1);

ring_fade *= 0.9;
gpu_set_blendmode(bm_add);
var RAD = (((ML_grid_w-1)/2)*16)-16;
in_radius = reach(in_radius,1,1/30);

var player_x = oPlayer.x, player_y = oPlayer.y;
var pd = point_direction(x,y,player_x,player_y);
if (can_see==0) && ds_list_size(ui_pos_mem)>1 && oPlayer.control==1 {
	player_x = ((ui_pos_mem[| (0)])*16)+8;
	player_y = ((ui_pos_mem[| (1)])*16)+8;
	var pd = point_direction(x,y,player_x,player_y);
	if ui_s[1,14]==1 {
		draw_line_width_colour((x+lengthdir_x(14,pd)),(y+lengthdir_y(14,pd)),player_x-1,player_y-1,1,$000000,$ff7700);
		draw_line_width_colour((x+lengthdir_x(14,pd)),(y+lengthdir_y(14,pd)),player_x-1,player_y-1,1,$000000,$ff7700);
	};
};

if (point_distance((player_x+oPlayer.hsp),(player_y+oPlayer.vsp)-10,x,y)>=RAD) {
	in_radius = 0;
	can_see = 0;
};

draw_set_color(merge_color(c_black,$301000,clamp(power(point_distance((player_x+oPlayer.hsp),(player_y+oPlayer.vsp)-10,x,y)/RAD,10),0,1)));
draw_set_alpha(((in_radius==1)?(1):(sqr((0.5+lengthdir_x(0.5,tick*500))/1.5)))*(1-ring_fade));
//draw_polygon(x,y,37,tick,RAD,draw_get_color(),1,1,1,1);
draw_set_circle_precision(66);
draw_circle_colour(x,y,RAD-0.5,c_black,draw_get_color(),0);
draw_circle_colour(x,y,RAD-0.5,c_black,draw_get_color(),0);
draw_circle_colour(x,y,RAD+0.5,c_black,draw_get_color(),1);
draw_circle_colour(x,y,RAD+0.5,c_black,draw_get_color(),1);
if in_radius==0 {
	draw_line_width_colour(x+lengthdir_x(RAD,pd),y+lengthdir_y(RAD,pd),player_x,player_y,1,$ff7700,$000000);
	draw_line_width_colour(x+lengthdir_x(RAD,pd),y+lengthdir_y(RAD,pd),player_x,player_y,1,$ff7700,$000000);
};

if can_see==0 && ds_list_size(ui_pos_mem)<=0 && oPlayer.control==1 {
	draw_set_alpha((sqr((0.5+lengthdir_x(0.5,tick*500))/1.25))*(1-ring_fade));
	draw_circle_colour(x,y,RAD+0.5,c_black,$4400ff,1);
	draw_circle_colour(x,y,RAD+0.5,c_black,$4400ff,1);
	lost = 1;
} else {lost = 0;};

draw_set_circle_precision(24);

if ui_s[1,14]==1 && alive==1 && control==1 && oPlayer.control==1 {
	draw_set_alpha((1-ui_an)*(1-ring_fade));
	draw_set_colour(can_see?$ff0000:$ff7700);
	if ds_list_size(ui_pos_mem)>1 {
		var _tpx, _tpy, _tppx, _tppy;
		for (var i = 2; i < ds_list_size(ui_pos_mem); i+=2) {
			_tpx = ui_pos_mem[| (i)];
			_tpy = ui_pos_mem[| (i+1)];
		
			_tppx = ui_pos_mem[| (i-2)];
			_tppy = ui_pos_mem[| (i-1)];
			draw_line_width((_tppx*16)+7,(_tppy*16)+7,(_tpx*16)+7,(_tpy*16)+7,1);
			draw_sprite_ext(sPixel,8,(_tpx*16)+7.5,(_tpy*16)+7.5,1,1,0,can_see?$ff0000:$ff7700,1-ui_an);
			//draw_sprite(sPixel,9,(_tpx*16)+8,(_tpy*16)+8);
		}
	};
};

//draw_text(x+28,y,string(can_see)+"\n"+string(in_radius)+"\n"+string(ds_list_size(ui_pos_mem)>1));

gpu_set_blendmode(bm_normal);

var _ui1 = (ui_s[1,10]==1), _ui2 = (ui_s[1,11]==1), _ui3 = (ui_s[1,12]==1);

if alive==1 && control==1 && (_ui1 || _ui2 || _ui3) && oPlayer.control==1 {
if !surface_exists(ui_surf) ui_surf = surface_create(64,64);
if surface_exists(ui_surf) {
	
	draw_set_alpha(1);
	
	surface_set_target(ui_surf);
	draw_clear_alpha($000000,1);
	
	#region NN INTEGRATION
	if _ui3 {
		draw_sprite_ext(sEO_ui_over,0,32,32,1,1,0,$800800,1);
		var _asd = 0;
		//for (var i = 0; i < 9; ++i) {
		//	_asd += ML_proof[i,1];
		//}
		_asd += ML_proof[0,1];
		_asd += ML_proof[1,1];
		_asd += ML_proof[2,1];
		_asd += ML_proof[3,1];
		_asd += ML_proof[4,1];
		_asd += ML_proof[5,1];
		_asd += ML_proof[6,1];
		_asd += ML_proof[7,1];
		_asd += ML_proof[8,1];
		_asd /= 9;
		
		if( integration < 50) integration = ceil(_asd*100); else {integration = max(50, ceil(_asd*100)); if (INTEGRATED==0) {instance_create_one(oPlayer.x,oPlayer.y,-10,oDlg_EO_integrated); INTEGRATED = 1;}};
		
		
		if (_asd>0) {
			draw_set_colour($ffff10);
			draw_set_alpha(1);
			mask_set(-1,-1,65,65);
			draw_sprite(sEO_ui_over,0,32,32);
			mask_draw();
			//draw_rectangle(lerp(32,8,_asd),-1,lerp(32,56,_asd),65,0);
			draw_triangle(32,32,
			32,4,
			32+lengthdir_x(26,lerp(90,0,_asd)),32+lengthdir_y(26,lerp(90,0,_asd)),0);
			
			draw_triangle(32,32,
			32+lengthdir_x(26,lerp(90,180,_asd)),32+lengthdir_y(26,lerp(90,180,_asd)),
			32,4,0);
			
			draw_triangle(32,32,
			32,60,
			32+lengthdir_x(26,lerp(270,360,_asd)),32+lengthdir_y(26,lerp(270,360,_asd)),0);
			
			draw_triangle(32,32,
			32+lengthdir_x(26,lerp(270,180,_asd)),32+lengthdir_y(26,lerp(270,180,_asd)),
			32,60,0);
			mask_reset();
			
			draw_set_font(FONT_MAIN);
			draw_set_alpha(1);
			draw_set_valign(fa_bottom);
			draw_set_halign(fa_right);
			draw_set_colour($800800);
			if integration>=50 draw_set_colour($ffff10);
			
			draw_text(63,63,string(integration));
			draw_text(62,63,string(integration));
			draw_sprite_ext(sEO_ui_over,1,32,32,1,1,0,draw_get_colour(),1);
		};
	};
	#endregion
	
	#region CONFIDENCE BARS
	if _ui2 {
		var d,c;
		for (var i = 0; i < 8; ++i) {
			d = (i*45)+180;
			c = (ML_truth_pattern==i);
			draw_set_colour($800800);
			if (ML_truth_pattern!=ML_estim) {
				draw_line_width(
				32+lengthdir_x(9,d+(tick*123)),32+lengthdir_y(9,d+(tick*123)),
				32+lengthdir_x(11,d+(tick*123)),32+lengthdir_y(11,d+(tick*123)),2);
			
				if (ML_estim==i) {
					draw_set_colour($2000ff);
				}
			};
		    draw_line_width(
			32+lengthdir_x(14-c,d),32+lengthdir_y(14-c,d),
			32+lengthdir_x(20+c,d),32+lengthdir_y(20+c,d),2+c);
		
		    if ML_proof[i,1]>0 {
				draw_set_colour($ffff10);
				if (ML_truth_pattern!=ML_estim) && (ML_estim==i) {
					draw_set_colour($2000ff);
				};
				draw_line_width(
				32+lengthdir_x(14-c,d),32+lengthdir_y(14-c,d),
				32+lengthdir_x(lerp(14-c,20+c,ML_proof[i,1]),d),32+lengthdir_y(lerp(14-c,20+c,ML_proof[i,1]),d),2+c);
			};
		}
	}
	#endregion
	
	#region POWER FREQUENCY
	if _ui1 {
		//
	};
	#endregion
	
	surface_reset_target();
	
	gpu_set_blendmode(bm_add);
	draw_surface_ext(ui_surf,xprevious-32,yprevious-32,1,1,0,c_white,1-ui_an);
	gpu_set_blendmode(bm_normal);
};
};


/*
draw_set_colour(c_white);
draw_set_font(FONT_MAIN);
draw_set_alpha(1);

draw_text_transformed(x+8,y,string(ML_truth_pattern)+" "+string(ML_estim)+"\n"+string(ML_truth_pattern==ML_estim),0.5,0.5,0);

var _asd = 0;
for (var i = 0; i < 9; ++i) {
	draw_text_transformed(CX+4,(CY+14)+(i*7),ML_proof[i,1],0.5,0.5,0);
	_asd += ML_proof[i,1];
}

draw_text_transformed(CX+4,(CY+4),_asd/9,0.5,0.5,0);*/

#region ML VISUALISER
/*
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(CX+5,CY+5,CX+15+ML_grid_w+ML_grid_w,CY+15+ML_grid_h+ML_grid_h,0);
draw_set_alpha(1);
draw_rectangle((CMX-(ML_grid_w/2)),(CMY+ML_grid_h),(CMX-(ML_grid_w/2))+ML_grid_w,(CMY+ML_grid_h)+ML_grid_h,0);
draw_set_color(c_white);
var __T = 0, _W;
for (var i = 0; i < ML_grid_w; ++i) {
	for (var j = 0; j < ML_grid_h; ++j) {
		_W = output[ML_estim,1];
		draw_sprite_ext(sPixel,0,(CMX-(ML_grid_w/2)+i),(CMY+ML_grid_h+j),1,1,0,make_color_hsv(0,0,_W[# i,j]*128),1);
		//__T = ML_grid[# i,j];
		//if __T>=2 draw_sprite_ext(sPixel,0,oPlayer.x-10+i,oPlayer.y+10+j,1,1,0,((__T==0)?(c_red):(((__T==4)?($ffff00):(c_orange)))),1);
	}
}

//draw_sprite_ext(sPixel,0,CX+10+floor(ML_grid_w/2),CY+10+floor(ML_grid_h/2),1,1,0,$ffff00,1);

draw_set_color($0000ff);
//draw_sprite(sPixel,0,CX+10+ML_grid_updatex,CY+10+ML_grid_updatey);

draw_text(CX+10,CY+15+ML_grid_h,
string(output_an[0])+" "+string(ML_estim==0)+"\n"+
string(output_an[1])+" "+string(ML_estim==1)+"\n"+
string(output_an[2])+" "+string(ML_estim==2)+"\n"+
string(output_an[3])+" "+string(ML_estim==3)+"\n"+
string(output_an[4])+" "+string(ML_estim==4)+"\n"+
string(output_an[5])+" "+string(ML_estim==5)+"\n"+
string(output_an[6])+" "+string(ML_estim==6)+"\n"+
string(output_an[7])+" "+string(ML_estim==7)+"\n"+
string(output_an[8])+" "+string(ML_estim==8));//+
//string(ML_ESTIM()));
*/
#endregion

/// @description UI
draw_set_font(fnt4);
draw_set_alpha(1);
var ___t = ui_open;
var tuio = ui_open;
if control==1 && oControl.mode==3 && (oPlayer.control==1 || ui_open==1) && (keyboard_check_pressed(global.key_eo)) ui_open = !(bool(floor(real(ui_open))));
//
if force_ui {ui_open = 1; force_ui = 0;};
//
if (keyboard_check(global.key_inv) && (ui_an)>=.1) {
	ui_open = 0;
}

if round(abs(oPlayer.hsp))>1 || round(abs(oPlayer.vsp))>1 ui_open=0;

if (boot==1) {
	if boot_snd==-1 {
		boot_snd = play_sound(sndEO_boot,10,0,1,1,1);
	};
	if audio_sound_get_track_position(boot_snd)>=1.1 && audio_sound_get_track_position(boot_snd)<3 {
		ui_open = 1;
	};
};

if ___t!=ui_open && boot==0 {
	if ui_open==1 {
		play_sound(sndEO_ui_open,10,0,mean(1,random_range(0.9,1.1)),.7777777,0);
	} else {
		play_sound(sndEO_ui_close,10,0,mean(1,random_range(0.9,1.1)),.7777777,0);
	};
};

var ui_ant=ui_an;
ui_an = reach(ui_an,ui_open,0.04);

//if tuio!=ui_open && ui_open==1 tscale=oControl.cam_scale;
//if ui_open!=0 {oControl.cam_scale = tscale+(ui_an/2);} else if (ui_an>0) || (ui_an<=0 && ui_ant>0) {oControl.cam_scale = tscale+(ui_an/2);};
ui_bg = reach(ui_bg,ui_open,1/30);
draw_set_colour(c_white);

//draw_text(x+32,y-8,string(oControl.cam_scale));
//draw_circle(mouse_x,mouse_y+(lerp_bounce(ui_an)*10),4,0)

var cx = CX, cy = CY;
var cw = CW, ch = CH;
var ccx = mean((cx+(cw/2)),oEo.x), ccy = mean((cy+(ch/2)),oEo.y);
var t_uix = ui_cx, t_uiy = ui_cy;
ui_cx = reach(ui_cx,ccx,abs(ccx-ui_cx)/17);
ui_cy = reach(ui_cy,ccy,abs(ccy-ui_cy)/17);
ui_tfl*=0.9;
if ___t!=ui_open && ui_open==1 {
	ui_cx = ccx;
	ui_cy = ccy;
	ds_list_shuffle(ui_anl);
	cam_shake += 1;//mean(2/3,1,1);
	ui_tfl = 1;
	cam_glitch = 1;
}

if ui_flash<1 ui_flash=min(ui_flash+0.05,1);

if ui_on==0 && ui_an==1 && ui_open==1 {
	ui_on = 1;
	ui_flash = 0;
}
else
if ui_an!=1 && ui_open==0 {
	ui_on = 0;
};

//if keyboard_check_pressed(ord("B")) boot = 1;

if ui_an>0 {
	//draw_surface_ext(application_surface,cx+1,cy,1,1,0,c_white,0.5)
	if ui_open {
		oPlayer.control = 0;
		//oPlayer.UI_OPEN = 1;
		LETTERBOX = 1;
	};
	
	var _sn = 8;//sprite_get_number(UISP)-1;
	draw_rectangle_view(c_black,easing(14,ui_bg,0,1,1)/2.5);
	var uix = t_uix+((random_range(-7,7)*(1-ui_an))/2), uiy = t_uiy+((random_range(-7,7)*(1-ui_an))/4);
	t_uix = ui_cx;
	t_uiy = ui_cy;
	draw_sprite_ext(UISP,0,uix,uiy,1,1,0,make_colour_hsv(random(255),255,255),(((1-lerp_bounce(ui_flash))/7)*(ui_an/2))*ui_an);
	gpu_set_blendmode(bm_add);
	var _spw = (sprite_get_width(UISP)/2), _sph = (sprite_get_height(UISP)/2), ccc = merge_colour(c_black,16749568,0.5);
	var cccc = $802000;
	var ccccc = $ff7700;//merge_colour(c_black,merge_colour(cccc,ccc,1/3),2/3);
	
	var ui_tfll = (1-ui_tfl);
	if ui_tfl>0 {
	draw_set_alpha(ui_tfl*2);
	draw_line_width_color(x,y,uix-(_spw+lengthdir_x(-128*ui_tfll,point_direction(oEo.x,oEo.y,uix-_spw,uiy-_sph))),
	uiy-(_sph+lengthdir_y(-128*ui_tfll,point_direction(oEo.x,oEo.y,uix-_spw,uiy-_sph))),((4*ui_tfl)+3)/2,ccccc,c_black);
	
	draw_line_width_color(x,y,uix+(_spw+lengthdir_x(128*ui_tfll,point_direction(oEo.x,oEo.y,uix+_spw,uiy-_sph))),
	uiy-(_sph+lengthdir_y(-128*ui_tfll,point_direction(oEo.x,oEo.y,uix+_spw,uiy-_sph))),((4*ui_tfl)+3)/2,ccccc,c_black);
	
	draw_line_width_color(x,y,uix-(_spw+lengthdir_x(-128*ui_tfll,point_direction(oEo.x,oEo.y,uix-_spw,uiy+_sph))),
	uiy+(_sph+lengthdir_y(128*ui_tfll,point_direction(oEo.x,oEo.y,uix-_spw,uiy+_sph))),((4*ui_tfl)+3)/2,ccccc,c_black);
	
	draw_line_width_color(x,y,uix+(_spw+lengthdir_x(128*ui_tfll,point_direction(oEo.x,oEo.y,uix+_spw,uiy+_sph))),
	uiy+(_sph+lengthdir_y(128*ui_tfll,point_direction(oEo.x,oEo.y,uix+_spw,uiy+_sph))),((4*ui_tfl)+3)/2,ccccc,c_black);
	}
	var ui_ann = ui_bg;
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(oEo.x,oEo.y,16,ccc,c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(uix,uiy,64,ccc,c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(mean(uix,oEo.x),mean(uiy,oEo.y),24,ccc,c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(oEo.x,oEo.y,9,ccc,c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(oEo.x+((oEo.x-uix)*-1.25),oEo.y+((oEo.y-uiy)*-1.25),48,merge_colour(c_black,merge_colour(c_blue,merge_colour(cccc,ccc,0.5),0.5),0.5),c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(oEo.x+((oEo.x-uix)*-1.5),oEo.y+((oEo.y-uiy)*-1.5),64,merge_colour(c_black,merge_colour(c_blue,merge_colour(cccc,ccc,0.5),0.25),1/3),c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_circle_color(oEo.x,oEo.y,7,make_colour_rgb(7,7,255),c_black,0);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_line_width_color(oEo.x,oEo.y,uix-((_spw-1)*ui_tfll),uiy-((_sph-1)*ui_tfll),3,cccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix+((_spw-1)*ui_tfll),uiy-((_sph-1)*ui_tfll),3,cccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix-((_spw-1)*ui_tfll),uiy+((_sph-1)*ui_tfll),3,cccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix+((_spw-1)*ui_tfll),uiy+((_sph-1)*ui_tfll),3,cccc,c_black);
	draw_set_alpha((ui_ann+((random_range(-0.15,0.15)*random_range(-1,1))*choose(0,1)))/2);
	draw_line_width_color(oEo.x,oEo.y,uix-((_spw-1)*ui_tfll),uiy-((_sph-1)*ui_tfll),1,ccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix+((_spw-1)*ui_tfll),uiy-((_sph-1)*ui_tfll),1,ccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix-((_spw-1)*ui_tfll),uiy+((_sph-1)*ui_tfll),1,ccc,c_black);
	draw_line_width_color(oEo.x,oEo.y,uix+((_spw-1)*ui_tfll),uiy+((_sph-1)*ui_tfll),1,ccc,c_black);

	draw_set_alpha(ui_tfl);
	draw_circle_color(oEo.x,oEo.y,31,make_colour_hsv(random(255),255,64),c_black,0);
	draw_circle_color(oEo.x,oEo.y,77,make_colour_hsv(random(255),255,64),c_black,0);
	draw_circle_color(oEo.x,oEo.y,19,make_colour_hsv(random(255),255,64),c_black,0);
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(UISP,0,uix,uiy,1,1,0,c_black,((ui_an/2)*ui_an)*ui_an);
	draw_sprite_ext(UISP,22,uix,uiy,1,1,0,c_edgb,((ui_an/2.5)+random_range(-0.15,0.15))/2);
	draw_rectangle_view(c_black,ui_bg/2.5);
	gpu_set_blendmode(bm_add);
	draw_set_alpha(1);
	
	if ui_an<1 {
		//cam_shake = (1-ui_an)/2;
		var t_av = 0, rtav = 0;
		for(var i=0; i<floor(_sn*ui_an); i++;) {
			t_av = clamp((_sn*ui_an)-(i+1),0,1);
			rtav = (1-t_av);//,lerp_bounce(1-t_av));
			draw_sprite_ext(UISP,ui_anl[| round(i)]+1,uix+(random_range(-16,16)*rtav),uiy+(random_range(-1,1)*rtav),0.5+(sqrt(ui_an)/2),0.5+(sqrt(ui_an)/2),0,merge_colour(make_colour_hsv(random(255),255,255),16749568,t_av/2.5),1);
		}
	}
	else
	{
		draw_sprite_ext(UISP,_sn,uix,uiy,1,1,0,16749568,1);
	};
	
	if (boot==0) {
	if ui_an>0.5 && ui_open==1 {
		var ___tuis = ui_sel;
		var jj = keyboard_check_pressed(global.kkd)-keyboard_check_pressed(global.kku);
		ui_sel += jj;
		if ui_sel<0 ui_sel=4 else if ui_sel>4 ui_sel=0;
		
		// while (!ui_can[ui_sel]) { ui_sel+=jj; if ui_sel>4 ui_sel=0; };   ////////////////////////////////////////////////////////////////////////////
		
		if ui==3 || ui==5 ui_sel = 0; // make the ui_sel not move
		if ___tuis!=ui_sel {
			ui_flash = 0;
			ui_an=0.85;
			ds_list_shuffle(ui_anl);
			var _tui_sel_snd = ui_sel_snd;
			repeat(6) {
				ui_sel_snd = choose(sndEO_ui_blip1,sndEO_ui_blip2,sndEO_ui_blip3,sndEO_ui_blip4,sndEO_ui_blip5,sndEO_ui_blip6);
				if (_tui_sel_snd==ui_sel_snd) {
					ui_sel_snd = choose(sndEO_ui_blip1,sndEO_ui_blip2,sndEO_ui_blip3,sndEO_ui_blip4,sndEO_ui_blip5,sndEO_ui_blip6);
				} else break;
			};
			play_sound(ui_sel_snd,10,0,random_range(0.9,1.1),.7777777,0);
		}
		
		var _t_ui = ui, _ps = 0;
		
		if (ui==0) { // MAIN PAGE
			if keyboard_check_pressed(global.kkr) {
				ui = (ui_sel+1);
				ui_an = 0;
				ui_flash = 0;
				ui_sel_main = (ui_sel+1);
				ui_sel = 0;
			};
		} else { // OTHER PAGES
			if keyboard_check(global.kkr) {
				
				if (ui_can[ui]) {
				
				switch(ui) {
					
					case 0:
					case 1:
					//case 2:
					//case 4:
					{
					if keyboard_check_pressed(global.kkr) {
						var _ui_s_v = (ui_s[ui_sel_main,ui_sel+10]);
						ui_s[ui_sel_main,ui_sel+10] = bool(!bool(_ui_s_v));
						//_ps = 1;
						ui_an = 0.7777777;
						ui_flash = 0.7777777;
						play_sound(((_ui_s_v==0)?(sndEO_ui_on):(sndEO_ui_off)),10,0,mean(1,random_range(0.9,1.1)),1,0);
						ui_sa[ui_sel] = 1;
					};
					break;
					}
					
					case 2:
					case 4:
					{
						//
						break;
					}
					
					case 3:
					ui_s[3,11] += 1;
					if (ui_s[3,11]==1) play_sound(sndEO_ui_off,10,0,mean(1,random_range(0.9,1.1)),0.5,0);
					if (ui_s[3,11]>=60) {ui_s[3,10]+=1; ui_s[3,11]=0; play_sound(sndEO_ui_on,10,0,mean(0.9,0,random_range(0.9,1.1))+(ui_s[3,10]/4.5),1,0);};
					if (ui_s[3,10]==5) {
						ui_s[3,10]=0;
						ui_s[3,11]=0;
						ui_open = 0;
						
						if ( instance_exists(oIs_Inside) || instance_exists(LIGHTING) ) { // could also add a check so there's no blocks above?
							instance_create_one(x,y,-1,oDlg_EO_CantWarp);
							play_sound(snd77Hz_blip,1,0,mean(1,mean(random(2),1)),.7777777,0);
							alarm[0] = 1;
							
							exit;
						}
						else
						{
							var __pdd = point_direction(oPlayer.x,oPlayer.y,x,y);
							oPlayer.control = 0;
						
							obj_setpos(oEo,oPlayer.x,oPlayer.y);
						
							play_sound(sndEO_teleport,10,0,1,1,0);
						
							create_poly(x,y,-100,7,$ffff00,0,32,10,0,0.95,90,0,1);
							create_poly(x,y,-100,7,$ff8000,CHYP*1.1,0,0,8,0.95,90,0,1);
							create_poly(x,y,-100,7,$ff8000,0,32,10,0,0.9,90,0,1);
							create_poly(x,y,-100,7,$ff0000,CHYP*1.1,0,0,8,0.9,90,0,1);
							create_flashline(x,y,__pdd,-100,$ffff00,1,8);
							create_flashline(x,y,__pdd,-100,$ff8000,1,16);
							create_flashline(x,y,__pdd,-100,$ff4000,1,32);
							repeat(80) {
								create_spark(x,y,-100,random(360),random_range(0.3333333,6),random_range(-90,90),$ffff00,$ff0000,mean(random_range(0.8,0.975),1),random_range(0.75,4));
							};
						
							instance_create_one(x,y,-100,oBoldemo_Aenox);
							exit;
						}
					};
					break;
					
					case 5:
					ui_s[5,11] += 1;
					if (ui_s[5,11]==1) play_sound(sndEO_ui_off,10,0,mean(1,random_range(0.9,1.1)),0.5,0);
					if (ui_s[5,11]>=30) {ui_s[5,10]+=1; ui_s[5,11]=0; play_sound(sndEO_ui_on,10,0,mean(0.9,0,random_range(0.9,1.1))+(ui_s[5,10]/4.5),1,0);};
					if (ui_s[5,10]==5) {
						ui_s[5,10]=0;
						ui_s[5,11]=0;
						ui_open = 0;
						var __pdd = point_direction(oPlayer.x,oPlayer.y,x,y);
						oPlayer.control = 0;
						
						obj_setpos(oEo,oPlayer.x,oPlayer.y);
						
						play_sound(sndEO_teleport,10,0,1,1,0);
						
						create_poly(x,y,-100,7,$ffff00,0,32,10,0,0.95,90,0,1);
						create_poly(x,y,-100,7,$ff8000,CHYP*1.1,0,0,8,0.95,90,0,1);
						create_poly(x,y,-100,7,$ff8000,0,32,10,0,0.9,90,0,1);
						create_poly(x,y,-100,7,$ff0000,CHYP*1.1,0,0,8,0.9,90,0,1);
						create_flashline(x,y,__pdd,-100,$ffff00,1,8);
						create_flashline(x,y,__pdd,-100,$ff8000,1,16);
						create_flashline(x,y,__pdd,-100,$ff4000,1,32);
						repeat(80) {
							create_spark(x,y,-100,random(360),random_range(0.3333333,6),random_range(-90,90),$ffff00,$ff0000,mean(random_range(0.8,0.975),1),random_range(0.75,4));
						};
					};
					break;
					
					default:
					//
					break;
				};
				}
				else if keyboard_check_pressed(global.kkr) {
					play_sound(snd77Hz_blip,1,0,mean(1,mean(random(2),1)),.7777777,0);
					alarm[0] = 1;
				}
			} else {
				if (ui==3) {
					ui_s[3,10]=0;
					ui_s[3,11]=0;
				};
				if (ui==5) {
					ui_s[5,10]=0;
					ui_s[5,11]=0;
				};
				if keyboard_check_pressed(global.kkl) {
					ui = 0;
					ui_an = 0;
					ui_flash = 0;
					ui_sel_main = 0;
					ui_sel = 0;
				};
			};
		};
		
		if _t_ui!=ui || _ps {
			play_sound(choose(
			sndEO_ui_select1,sndEO_ui_select2,sndEO_ui_select3,sndEO_ui_select4,sndEO_ui_select5,sndEO_ui_select6,sndEO_ui_select7),
			10,0,random_range(0.9,1.1),1/4.5,0);
			
			var _tui_sel_snd = ui_sel_snd;
			repeat(6) {
				ui_sel_snd = choose(sndEO_ui_blip1,sndEO_ui_blip2,sndEO_ui_blip3,sndEO_ui_blip4,sndEO_ui_blip5,sndEO_ui_blip6);
				if (_tui_sel_snd==ui_sel_snd) {
					ui_sel_snd = choose(sndEO_ui_blip1,sndEO_ui_blip2,sndEO_ui_blip3,sndEO_ui_blip4,sndEO_ui_blip5,sndEO_ui_blip6);
				} else break;
			};
			play_sound(ui_sel_snd,10,0,random_range(0.9,1.1),.7777777,0);
		};
		
	};
	};
	
	var _tc = merge_colour(c_blue,c_edgb,0.5), __tc = merge_colour(c_aqua,c_edgb,0.5), _atn = sqr(sqr(sqr(ui_an)));
	
	if ui_on==1 && ui_flash>0 {
		var _top_t = ui_s[ui_sel_main,ui_sel];
		if boot==1 _top_t = "BOOTING";
		if (!ui_can[ui]) _top_t = "ERROR";
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_colour(merge_colour(c_blue,__tc,ui_flash));
		draw_set_font(fnt4);
		draw_text(uix-28,uiy-25,string_n(_top_t,ui_flash));
		
		if (boot==0) {
			if ui!=0 {
				draw_set_colour(__tc);
				draw_text(uix-46,uiy-31,(!ui_can[ui]) ? "ERROR" : ui_s[0,ui_sel_main-1]);
			};
			
			draw_set_font(FONT_MAIN);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_colour(merge_colour(c_black,$808040,sqr(sqr(ui_flash))));
			draw_text_transformed(CMX,mean(CY+CH,uiy+30),(!ui_can[ui]) ? "ERROR" : ui_s[ui_sel_main,ui_sel+5],0.5,0.5,0);
		};
	};
	
	if boot==1 && boot_stop==0 {
		if audio_sound_get_track_position(boot_snd)>=1.2 && audio_sound_get_track_position(boot_snd)<2.7 {
			draw_sprite_ext(sEO_loadbar,floor(boot_an1*9.5),t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,$ff7700,1);
			boot_an1 = reach(boot_an1,1,(1/77.7777777));
		}
		else
		if audio_sound_get_track_position(boot_snd)>=2.7 && audio_sound_get_track_position(boot_snd)<3.7 {
			cam_shake += sqr(sqr(random(1))/1.7777777);
			draw_sprite_ext(UISP,((0.5+lengthdir_x(0.5,tick*194.44425))*5)+17,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,$ff7700,0.5);
			draw_sprite_ext(UISP,((0.5+lengthdir_x(0.5,tick*388.8885))*5)+17,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,$ff7700,0.5);
			draw_sprite_ext(UISP,((0.5+lengthdir_x(0.5,tick*777.777))*5)+17,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,$ff7700,0.5);
		}
		
		if audio_sound_get_track_position(boot_snd)>=3.2 {
			draw_sprite_ext(sEO_loadscreen,floor(boot_an2*51),t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,$ff7700,1);
			boot_an2 = reach(boot_an2,1,(1/130));
		};
		
		if boot_an2>=1 {
			ui_open = 0;
			boot = 0;
			instance_create_one(x,y,-10,oDlg_EO_boot1);
			boot_stop = 1;
			oEO_frame.final = 1;
			boot_an2 = 0;
			boot_stop = 1;
		};
	};
	
	if (boot==0) {
	draw_sprite_ext(UISP,9,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,c_blue,lerp_bounce(_atn));
	draw_sprite_ext(UISP,10+ui_sel,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,__tc,((1-ui_flash)*_atn));
	draw_sprite_ext(UISP,17+ui_sel,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,__tc,lerp_bounce((ui_flash)*_atn));
	draw_sprite_ext(UISP,10+ui_sel,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,_tc,(_atn)/7);
	
	ui_sel_anim = reach(ui_sel_anim,ui_sel,abs(ui_sel-ui_sel_anim)/7);
	draw_sprite_ext(UISP,15,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy,1,1,0,_tc,(_atn));
	draw_sprite_ext(UISP,16,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(ui_sel*7),1,1,0,__tc,(_atn));
	
	if (ui!=0) {
		if (ui==3) {
			for (var i = 1; i < 5; ++i) {
				if (ui_s[3,11])>0 draw_sprite_ext(UISP,26,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn)*sin(tick*20));
				if (i<=(ui_s[3,10])) draw_sprite_ext(UISP,16,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn));
			}
		}
		else
		if (ui==5) {
			for (var i = 1; i < 5; ++i) {
				if (ui_s[5,11])>0 draw_sprite_ext(UISP,26,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn)*sin(tick*20));
				if (i<=(ui_s[5,10])) draw_sprite_ext(UISP,16,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn));
			}
		}
		else
		{
			for (var i = 0; i < 5; ++i) {
				if (ui_s[ui_sel_main,i+10]==1) draw_sprite_ext(UISP,24,
				t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn));
			
				draw_sprite_ext(UISP,25,
				t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn)*ui_sa[i]);
			
				draw_sprite_ext(UISP,25,
				t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+(i*7),1,1,0,__tc,(_atn)*ui_sa[i]);
			
				ui_sa[i] *= 0.9;
			}
		}
	}
	
	draw_sprite_ext(sArrow,2,t_uix+(random_range(-0.5,0.5)*(1-ui_flash))+51,-14+t_uiy+round(mean(ui_sel,ui_sel_anim)*7),1,1,-90,__tc,(_atn));
	draw_sprite_ext(UISP,23,t_uix+(random_range(-0.5,0.5)*(1-ui_flash)),t_uiy+round(ui_sel_anim*7),1,1,0,__tc,(_atn));
	
	}  /////////// BOOT
	draw_set_alpha(max(ui_an-0.5,0)*2);
	draw_sprite_ext(sEo_ui1glow,_sn,t_uix,t_uiy,1,1,0,make_colour_rgb(7,7,255),sqr(ui_an)/2);
	
	//gpu_set_blendmode(bm_subtract);
	gpu_set_blendmode(bm_normal);
	var _crtlid = 0;
	for(var i=-8; i<=(sprite_get_height(UISP)+7); i+=2;) {
		if i=-8 _crtlid = 1 else if i==(sprite_get_height(UISP)+6) _crtlid = 2 else _crtlid = 0;
		draw_sprite_ext(sCRT_lines,_crtlid,uix,(uiy+i)-_sph,(_spw*2)/48,0.5,0,c_black,sqr(ui_an)*0.2);
	}
	
	//gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
}