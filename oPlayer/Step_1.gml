tSAVE_curr_rm = SAVE_curr_rm;
tSAVE_curr_x = SAVE_curr_x;
tSAVE_curr_y = SAVE_curr_y;

if onsolid && round(vsp)==0 && control==1 && UI_OPEN==0 && physics==1 && draw==1 {
	SAVE_curr_rm = CURRENTROOM;
	SAVE_curr_x = x;
	SAVE_curr_y = y;
};

if dead {control=0; UI_OPEN=1; };//SOUND_VOLUME = 0;};

t_click_sfx = (inv_sel+smelt_choose_n+bag_sel);

//if keyboard_check_pressed(ord("H")) {
//	alarm[4] = 1;
//}
onblock_id = -1;
kpj = keyboard_check_pressed(global.kkj);
control_fade = reach_tween(control_fade,control,2);
if control_fade+0.02>1 UI_OPEN=0;
r_hp = reach_tween(r_hp,hp,8);
thept = 0;
hept_obj=noone;

//////////////////////

#region TELAROD // ATTACK
if (floor(has_telarod) && floor(oControl.GAME_CHAPTER[3,0])==0) {
	if control==1 && telarod==0 && keyboard_check_pressed(global.key_telarod) && telarod_an==0 {
		telarod_an = 1;
	}
	else
	if telarod==0 && keyboard_check_pressed(global.key_telarod) && telarod_an==1 && telarod_ant>2 {
		telarod = 1;
		telarod_an = 0;
		telarod_ant = 0;
		if control==0 control = 1;
	}
	
	if telarod_ant>=10 {
		telarod=1;
		telarod_an = 0;
		telarod_ant = 0;
		if control==0 control = 1;
	}
}
#endregion

if aenox && control==1 && UI_OPEN==0 {
if aenox_id == noone {
if instance_number(oHeavybox_s)>=1 {
	hept_obj=instance_nearest(x+(8*facing),y,oHeavybox_s);
	if point_distance(x,y,hept_obj.x,hept_obj.y)<29 thept=1// else hept_obj=noone;
}
hept_use = 0;
if instance_exists(hept_obj) && hept>0 && hept_charge==0 && thept && hept_obj!=noone {
	if keyboard_check(global.key_aenox) {
		if keyboard_check_pressed(global.key_aenox) {
			hept_obj.alive = 0;
			hept_obj.anim7 = 1;
			aenox_use = 1;
			aenox_x = hept_obj.x;
			aenox_y = hept_obj.y;
			aenox_id = hept_obj.object_index;
			aenox_ID = hept_obj.id;
			aenox_bw = hept_obj.bw;
			aenox_bh = hept_obj.bh;
			play_sound_pos(sndAenox_Take,10,0,1,0.75,0,x,y);
			STATS[0,2] += 1;
			if STATS[0,2]==1 instance_create_depth(x,y,-10,oDlg_Aenox_1);
		}
	}
}
} else {
	if instance_number(oAenox_bound)<=0 {
		if aenox_use==0 {
			if keyboard_check_pressed(global.key_aenox) {
				var ____t = instance_create_depth(x,y,depth-1,oAenox_bound);
				____t.g_bw = aenox_bw+3;
				____t.g_bh = aenox_bh+3;
				____t.bw = ceil((aenox_bw+3)/3);
				____t.bh = ceil((aenox_bh+3)/3);
			}
		}
	}
	else {
		if keyboard_check(global.key_aenox) {
		with(oAenox_bound) {
			var _pdd = point_direction(x,y,(oPlayer.x+(24*oPlayer.facing))+(oPlayer.hsp*5),oPlayer.y-(9+((oPlayer.ku*7)-(oPlayer.kd*7))));
			var _pddd = point_distance(x,y,(oPlayer.x+(24*oPlayer.facing))+(oPlayer.hsp*5),oPlayer.y-(9+((oPlayer.ku*7)-(oPlayer.kd*7))));
			hsp = reach_tween(hsp,lengthdir_x(_pddd/6,_pdd),2);
			vsp = reach_tween(vsp,lengthdir_y(_pddd/6,_pdd),2);
		}
		}
		else
		{
			if instance_exists(oAenox_bound) && oAenox_bound.anim2<(2/3) {
				with(oAenox_bound) {
					instance_destroy();
				}
			}
			
			if instance_exists(oAenox_bound) {
			var __t = instance_create_depth(mean(mean(oAenox_bound.x1,oAenox_bound.x2),oAenox_bound.x),mean(mean(oAenox_bound.y1,oAenox_bound.y2),oAenox_bound.y),depth+1,aenox_id);
			play_sound_pos(sndAenox_Make,10,0,1,0.75,0,x,y);
			//__t.x1 = oAenox_bound.x1;
			//__t.y1 = oAenox_bound.y1;
			//__t.x2 = oAenox_bound.x2;
			//__t.y2 = oAenox_bound.y2;
			__t.appear = 1;
			__t.alive = 1;
			__t.amount = 0;
			
			__t.bw = oAenox_bound.bw/2;
			__t.bh = oAenox_bound.bh/2;
			
			//__t.hsp= (-0.1*oPlayer.facing);
			//__t.vsp=(0.1);
			//__t.id = aenox_ID;
			
			aenox_use = 1;
			aenox_id = noone;
			//aenox_use = 0;
			aenox_an = 0;
			aenox_x = oAenox_bound.x;
			aenox_y = oAenox_bound.y;
			aenox_bw = 0;
			aenox_bh = 0;
			aenox_ID = noone;
			with(oAenox_bound) {
				instance_destroy();
			}
			}
		};
		if instance_exists(oAenox_bound) && oAenox_bound.anim2>0.9 && point_distance(mean(oAenox_bound.x,oAenox_bound.x,x),mean(oAenox_bound.y,oAenox_bound.y,y),x,y)>32 {
			with(oAenox_bound) {
				instance_destroy();
			}
		}
	};
};
};

if hept_use && hept_charge=0 {
	hept = reach(hept,0,0.4);
	if hept<=0 {
		hept_charge = 1;
	}
	hept_recharge = 0;
	alarm[1] = 120;
}
else
if hept_recharge {
	hept = reach(hept,hept_max,0.5);
	if hept_charge==1 && hept>=hept_max/2 {
		hept_charge = 0;
	}
}

if hp<=(hp_max/9.5) hp = reach(hp,hp_max,((((mob_near?0.01:0.025)*hp_max)/(((hp/hp_max)*(hp_max))+1))/60)/2);

if door_n!=-1 {
	control = 0;
	with(parDoor_Flat) {
		if n==oPlayer.door_n {
			obj_setpos(oPlayer,x,y-16);
			if instance_number(oEo)>=1 {
				obj_setpos(oEo,x,y-16);
				oEo.tx = 0;
				oEo.ty = 0;
				oEo.hsp = 0;
				oEo.vsp = 0;
				ds_list_clear(oEo.ui_pos_mem);
				oEo.can_see = 1;
				oEo.in_radius = 1;
			}
			fade_in = 1;
			fade = 3;
			open = 1;
			anim = 1;
			anim1 = 1;
			anim2 = 1;
			anim3 = 1;
			anim4 = 1;
			anim5 = 1;
			Clicked = 0;
		} else {
			open = 0;
			anim = 0;
			anim1 = 0;
			anim2 = 0;
			anim3 = 0;
			anim4 = 0;
			anim5 = 0;
		};
	}
	//alarm[5] = 1;
	door_n = -1;
}

_pvs = vsp;
_pos = onsolid;

if control==1 && UI_OPEN==0 && telarod==1 {
	if keyboard_check_pressed(global.key_telarod) {
		if !onsolid && attack==0 {attack = -1; attack_an=0;} else {
			if (attack==0) {attack=1; attack_an=0; hsp+=(0.5*facing);}
			else if (attack==1 && attack_an>2) {attack=2; hsp+=(0.5*facing);}
			else if (attack==2 && attack_an>9) {attack=3; hsp+=(0.5*facing);}
		}
	}
}

kl = keyboard_check(global.kkl);
kr = keyboard_check(global.kkr);
ku = keyboard_check(global.kku);
kj = keyboard_check(global.kkj);
kd = keyboard_check(global.kkd);
ks = keyboard_check_pressed(kks);//keyboard_check(kks);
ka = keyboard_check(kka);
kpu = keyboard_check_pressed(global.kku);

if control<1 {
	kl = 0;
	kr = 0;
	ku = 0;
	kj = 0;
	kd = 0;
	ks = 0;
	ka = 0;
	kpj = 0;
	//kpu = 0;
}

//debug1 = control_l;
//debug2 = control_r;
var tacc_hsp = acc_hsp;
if onsolid!=1 || (attack!=0 && onsolid!=0) tacc_hsp/=3;// else if 
if control_l>0 {kl=1; tacc_hsp*=control_l; control_l=0;};
if control_r>0 {kr=1; tacc_hsp*=control_r; control_r=0;};

if inv_open_an>0.1 kpu = 0;

if path_side!=0 {
	kl = 0;
	kr = 0;
	if path_side==1 kl = 1 else kr = 1;
}
var run_spd = (max_hsp/(1+(keyboard_check(vk_shift)/1.5)));
if kr {hsp = reach(hsp,run_spd,tacc_hsp); facing=1;};
if kl {hsp = reach(hsp,-run_spd,tacc_hsp); facing=-1;};
//if attack!=0 hsp *= 0.9;
if !(kl ^ kr) hsp = reach(hsp,0,acc_hsp);
if (attack!=0) {
	if onsolid!=0 {
		hsp = reach(hsp,0,acc_hsp);
	} else {
		hsp = reach(hsp,0,acc_hsp/4);
	};
};
//if p_control==control control = 1;
//control = p_control;
//p_control = reach(p_control,1,0.1);
control += 0.33333;
if control>1 control = 1;

if onsolid==1 jumped=0;
/*
if (kj && (onsolid>0 || p_onsolid>0 || _pos>0)) && jumped==0 {
	play_sound_pos(choose(sndMove_leather1,sndMove_leather2,sndMove_leather3,sndMove_leather4,
	sndMove_leather5,sndMove_leather6,sndMove_leather7),10,0,mean((1+random_range(-0.03,0.03))*1.54321,1,1),1/5.5,0,x,y);
	jumped = 1;
	vsp -= 4;
} else if (!kj && onsolid==0 && vsp<0) {
	vsp += (GRV_SPD);
	vsp *= 0.9;
}*/
if onsolid p_onsolid=1 else p_onsolid = reach(p_onsolid,onsolid,1/10);

if jump>=0 && physics==1 && control==1 && holding_eo==0 {
	if jump==0 {
		if (kj && (onsolid>0 || p_onsolid>0 || _pos>0) && jump_t>0) {
			jump = jump_t-1;
		}
	}
	else
	{
		if (onsolid>0 || p_onsolid>0 || _pos>0) && jump>1 && kj {
			jump -= 1;
			//if p_onsolid>0 jump=0;
		}
		else
		{
			vsp -= ((mean((sqr(sqr(easing(14,1-(jump/jump_t),0,1,1)))*jump_t),jump_t-jump)+0.25)*1.1)+0.1//(mean((sqr(jump_t-jump)/jump_t)*1.25,(jump_t-jump))*1.05)+0.1;
			play_sound_pos(choose(sndMove_leather1,sndMove_leather2,sndMove_leather3,sndMove_leather4,
			sndMove_leather5,sndMove_leather6,sndMove_leather7),10,0,mean((1+random_range(-0.03,0.03))*1.54321,1,1)*1.1,1/7,0,x,y);
			jumped = 1;
			jump = -1;
			p_onsolid = 0;
			/*repeat(round(jump_t-jump)) {
			with(instance_create(x+random_range(-3,3),y2+1+random_range(-0.5,0.5),oPlayer_smoke)){
				spd = random_range(0.4,abs(other.vsp)/1.5)/pi;
				dir = 90;
				//if oPlayer.facing==-1 dir = random_range(0,60);
			}
			}*/
		};
	};
}
else
if !kj {
	jump = 0;
};

if (jumped==1 || jump=-1) && (!kj && onsolid==0 && vsp<0) {
	vsp += (GRV_SPD/2);
	vsp *= 0.975;
}
//debug1 = grab;
//debug2 = slide;

if grab==0 && physics==1 {
	vsp += (GRV_SPD);
	if grab_t>0 && kpj==1 {
		hsp += grab;
		vsp-=3.333;
		grab = 0;
		grab_t = 0;
	}
}
else {
	if slide && physics==1 {
		vsp += (GRV_SPD/pi);
	} else if kpj==1 && control==1 {
		hsp += grab;
		vsp-=3.333;
		play_sound_pos(choose(sndMove_leather1,sndMove_leather2,sndMove_leather3,sndMove_leather4,
		sndMove_leather5,sndMove_leather6,sndMove_leather7),10,0,1+random_range(-0.03,0.03),1/3,0,x,y);
		grab = 0;
		grab_t=0;
	};
};

event_inherited();

if (holding_eo) {
	//vsp = 0;
	//hsp *= 0.7777777;
};