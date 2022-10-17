//draw = 0;

if CURRENT_PLANET==6 gpu_set_fog(1,0,0,0);

if draw {
draw_set_colour(c_white);
draw_set_alpha(1);
if 1==0 && has_telarod && telarod==0 && telarod_an==0 {
	//draw_sprite_ext(sTelarod_player,0,((mean(x,xprevious)-(facing*2))-(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])))-(facing),-1+yprevious-abs(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])),1,1,0,merge_colour(c_ltgray,make_colour_rgb(76,74,84),2/3),1);
	draw_sprite_ext(sTelarod_player,0,
	(1+(mean(x,xprevious)-(facing*2)))-round(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])),
	-1+yprevious-round(abs(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n]))),
	-1,-1,0,c_white,1);
}

if has_telarod==1 && telarod_an==1 {
	telarod_ant += ((1/6)*1.5);
	state = sPlayer_telarod_grab;
	telarod_ant = clamp(telarod_ant,0,10);
	anim = floor(telarod_ant);
	control = 0;
}

if dlg_anim!=0 {
	if dlg_anim==1 {
		state = sPlayer_pain1;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==2 {
		state = sPlayer_wave;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==3 {
		state = sPlayer_earpiece;
		anim = 0;
	}
	else
	if dlg_anim==4 {
		state = sPlayer_happy;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==5 {
		state = sPlayer_peer;
		anim = 0;//(round(tick*10));
	}
	else
	if dlg_anim==6 {
		state = sPlayer_necklace;
		necklace_anim = clamp(necklace_anim+(1/6),0,8);
		anim = floor(necklace_anim);//(round(tick*10));
		//necklace_anim = 0;
		control = 0;
	}
	else
	if dlg_anim==7 {
		state = sPlayer_idleThink;
		anim = 0;
	}
	else
	if dlg_anim==8 {
		state = sPlayer_idleWorry;
		anim = 0;
	}
	else
	if dlg_anim==9 {
		state = sPlayer_idleHips;
		anim = 0;
	}
	else
	if dlg_anim==10 {
		state = sPlayer_bg;
		anim = 0;
	}
	else
	if dlg_anim==11 {
		state = sPlayer_shock;
		anim = 0;
	}
}

if (necklace_anim>0) && dlg_anim!=6 {
	state = sPlayer_necklace;
	necklace_anim = clamp(necklace_anim-(1/6),0,9);
	anim = floor(necklace_anim);
	control = 0;
	if floor(necklace_anim)<=0 {
		necklace_anim = 0;
		dlg_anim = 0;
		//control = 1;
		//state = sPlayer_idle;
	};
};

if grab!=0 {
	state = sPlayer_hang;
	anim = 0;
}
var aenox_ant = aenox_an;
if aenox_use==1 {
	aenox_an += ((1/6)*1.75);
	control = 0;
	state = sPlayer_Aenox;
	anim = floor(aenox_an);
	if aenox_an>=11 {aenox_use=0; aenox_an=0;};
}

if set_sprite==1 {
	state = set_state;
	anim = set_anim;
	set_sprite = 0;
}
if tool==1 {
	if state==IDLE[state_n] {
		state = sPlayer_idle_torch;
	}
}
//state = sPlayer_runCoat;
//anim = 0;

if (CURRENT_PLANET==4) {
	if (round(tick*60) mod 160)==1 {
		create_fx(
		x+(2*facing),
		y-8,
		depth-1,
		merge_colour(c_white,c_ltgray,random_range(0.33333,1)/3),
		((random_range(0.4,1.4)/3)),
		(oPlayer.facing==1)?random_range(-4,4):random_range(176,184),
		0,
		0,
		0,
		0,
		0.93,
		sFx_3,
		0,
		0.7777777,
		1,
		(random_range(0.2,1)/2),
		0,
		-0.01);
	};
};

if (oControl.EO_SPAWN) {
	if instance_number(oEo)<=0 {
		instance_create_depth(x,y,1,oEo);
	};
}

if (holding_eo==1) {
	if instance_number(oEo)<=0 {
		instance_create_depth(x,y,1,oEo);
	};
	
	oPlayer.physics = 1;
	oPlayer.max_hsp = oPlayer.base_hsp/2.6666666;
	
	oEo.draw = 0;
	oEo.alive = 0;
	state = sPlayer_EO_walk;
	LETTERBOX = 1;
	
	anim += 0.15*(abs(hsp)/max_hsp);
	if abs(hsp)<0.01 {
		state = sPlayer_EO_idle;
		anim = 0;
	};
	obj_setpos(oEo,(x+(facing*5.25))+hsp,y-2);
};

if (aenox_re_time!=-1 && aenox_re_tick>=1) {
	state = sPlayer_aenox_re;
	if aenox_re_tick==1 anim=0;
	if aenox_re_tick>=2 anim=1;
	if aenox_re_tick>=14 anim=2;
};

draw_sprite_ext(state,anim,x,y,facing,1,0,c_white,alpha);

if paenox_an==0 && aenox_an>0 && aenox_use==1 sleep(123);
if aenox_use==1 paenox_an = aenox_ant;

if aenox_an>1.75 && aenox_an<5.5 {
	gpu_set_blendmode(bm_add);
	draw_circle_color(x+(9*facing)+random_range(-0.5,0.5),y-6+random_range(-0.5,0.5),24+random_range(-0.5,3),c_edgb,c_black,0);
	gpu_set_blendmode(bm_normal);
	cam_shake = 1.75;
	with(instance_create_depth(x+(9*facing)+random_range(-0.5,0.5),y-6+random_range(-0.5,0.5),depth+1,oBolt_Colour)) {
		colour = c_edgb;
		colour2 = c_edgbb;
		colour3 = c_edgbbb;
		xd = oPlayer.aenox_x+random_range(-4,4);
		yd = oPlayer.aenox_y+random_range(-4,4);
	}
}
else
if aenox_an>=5.5 && aenox_an<8 {
	gpu_set_blendmode(bm_add);
	draw_circle_color(x+(9*facing)+random_range(-0.5,0.5),y-6+random_range(-0.5,0.5),12+random_range(-0.5,3),c_edgbbb,c_black,0);
	gpu_set_blendmode(bm_normal);
}
/*
if 1==0 && hept_obj!=noone && hept_use {
	var colour = c_edgb;

	shader_set( shDissolve );

	// Size must be 1 / dimension like so...
	shader_set_uniform_f( shd_dissolve_size, 1 / sprite_width, 1 / sprite_height );

	// Values from step event, etc.
	shader_set_uniform_f( shd_dissolve_amount, amount );
	shader_set_uniform_f( shd_dissolve_offset, offset );

	// Color split into rgb and made to be from 0.0 to 1.0
	shader_set_uniform_f( shd_dissolve_fade_color,
		colour_get_red( colour ) / 255,
		colour_get_green( colour ) / 255,
		colour_get_blue( colour ) / 255
	);

	// draw the sprite
	draw_self();

	shader_reset();
}
*/
//draw_set_colour(c_red);
//draw_set_alpha(1);
//draw_text(x,y-16,string(debug1)+" "+string(debug2)+" "+string(hsp));

//draw_sprite_ext(sEo_Glow,1,oEo.x,(oEo.y),1,1,0,merge_colour(c_edgbbb,c_black,0.666),1);
//draw_sprite_ext(sEo_Glow,0,oEo.x,(oEo.y),1,1,0,merge_colour(c_blue,c_black,0.666),1);
gpu_set_blendmode(bm_normal);
//draw_text(x+32,y-32,string(vsp)+" "+string(hsp));
} else {draw = reach(draw,1,1/60);}

if instance_number(oEo)>=1 {
	gpu_set_blendmode(bm_add);
	draw_circle_color(oEo.x,(oEo.y),13.25+lengthdir_x(1,tick*100),merge_colour(merge_colour(c_edgbbb,c_black,0.666),c_black,oEo.fade_in),c_black,0);
	draw_circle_color(oEo.x,(oEo.y),24.25+lengthdir_x(1,tick*123),merge_colour(merge_colour(c_blue,c_black,0.666),c_black,oEo.fade_in),c_black,0);
	gpu_set_blendmode(bm_normal);
}

if CURRENT_PLANET==6 gpu_set_fog(0,0,0,0);


//draw_rectangle(x1,y1,x2,y2,1);