if alive==1 && (lost==0) {
/*
if oPlayer.facing==1 || keyboard_check(ord("Z")) {
	if !keyboard_check(ord("Z")) || keyboard_check(global.kkr) aim_point = 0;
	if keyboard_check(global.kkr) && oPlayer.ku aim_point = 45
	else if keyboard_check(global.kkr) && oPlayer.kd aim_point = -45
	else if !oPlayer.kr && oPlayer.ku aim_point = 90
	else if !oPlayer.kr && oPlayer.kd aim_point = -90;
}
else
if oPlayer.facing==-1 || keyboard_check(ord("Z")) {
	if !keyboard_check(ord("Z")) || keyboard_check(global.kkl) aim_point = 180;
	if keyboard_check(global.kkl) && oPlayer.ku aim_point = 135
	else if keyboard_check(global.kkl) && oPlayer.kd aim_point = 225
	else if !oPlayer.kl && oPlayer.ku aim_point = 90
	else if !oPlayer.kl && oPlayer.kd aim_point = 270;
};
*/
if control==1 && (oPlayer.control==1 || ui_open==1) {
var kl = keyboard_check(global.kkl), kr = keyboard_check(global.kkr);

//if oPlayer.
if oControl.mode==3 {
if ui_open==0 {
	if keyboard_check_pressed(ord("A")) {aim_dd = oPlayer.facing; ui_open=0;} else if !keyboard_check(ord("A")) aim_dd = oPlayer.facing;
	if aim_dd==1 {
		if keyboard_check(ord("A")) || keyboard_check(global.kkr) aim_point = 0;
		if keyboard_check(global.kkr) && oPlayer.ku aim_point = 45
		else if keyboard_check(global.kkr) && oPlayer.kd aim_point = -45
		else if !oPlayer.kr && oPlayer.ku aim_point = 90
		else if !oPlayer.kr && oPlayer.kd aim_point = -90;
	}
	else
	if aim_dd==-1 {
		if keyboard_check(ord("A")) || keyboard_check(global.kkl) aim_point = 180;
		if keyboard_check(global.kkl) && oPlayer.ku aim_point = 135
		else if keyboard_check(global.kkl) && oPlayer.kd aim_point = 225
		else if !oPlayer.kl && oPlayer.ku aim_point = 90
		else if !oPlayer.kl && oPlayer.kd aim_point = 270;
	};
};
};

aim_d = point_direction(x,y,mean(x,oPlayer.x,oPlayer.x)+lengthdir_x(32,aim_point),mean(y,oPlayer.y,oPlayer.y-4)+lengthdir_y(32,aim_point));
if DIALOGUE_OPEN==1 {
	ui_open = 0;
	/*if DIALOGUE_ID!=noone aim_d = point_direction(x,y,DIALOGUE_ID.x,DIALOGUE_ID.y) else
	aim_d = point_direction(x,y,DIALOGUE_X,DIALOGUE_Y);
	if look_id!=noone aim_d = point_direction(x,y,look_id.x,look_id.y);
	*/
	aim_d = point_direction(x,y,oCamera.x,oCamera.y);
	//obj_setpos(oEo,mean(oEo.x,oEo.x,oPlayer.x-(player_facing*12)),mean(oEo.y,oEo.y,oPlayer.y-8));
};// else player_facing = oPlayer.facing;

/*
if instance_number(parIiem)>0 {
	var i = instance_nearest(x,y,parIiem);
	aim_d = point_direction(x,y,i.x+i.hsp,i.y+i.vsp);
};*/

//var pd = aim_d;
//var dd = ((((pd - dir) mod 360) + 540) mod 360) - 180;

//dir += ((abs(dd)/7) * sign(dd));

var dd = angle_difference(dir, aim_d);
dir -= (abs(dd)/7) * sign(dd);

//angle_difference()


//var tx = 0, ty = 0;
//if fol_id==oPlayer {
    //tx = oPlayer.x+28;
    //ty = oPlayer.y-8;
    if aim_dd==1 {
        //tx = oPlayer.x-28;
    }
	
//var randd = (lengthdir_x(2,tick*38.5)+26);

//if point_distance(x,y,oPlayer.x,oPlayer.y-8)>(randd+1) {
	tx = (oPlayer.x+hsp);//+lengthdir_x(randd,point_direction(x,y,oPlayer.x,oPlayer.y-8)+180);
	ty = ((oPlayer.y+vsp)-8);//+lengthdir_y(randd,point_direction(x,y,oPlayer.x,oPlayer.y-8)+180);
//}
	
//}
//var ttick = (tick*1.5);
//ty += (lengthdir_y(3+lengthdir_x(1,ttick*2),ttick*31)/1.9)/4;
//tx += (lengthdir_y(3+lengthdir_x(1,ttick),ttick*9.867)/2.1)/4;
    
var pd = point_distance(x,y,tx,ty);//, pdd = point_direction(x,y,tx,ty);
//hsp = lengthdir_x(pd/12,pdd);
//vsp = lengthdir_y(pd/12,pdd);


if punch>0 punch = max(0,punch-0.1)*0.89;

//hsp -= lengthdir_x(punch,shot_dir);
//vsp -= lengthdir_y(punch,shot_dir);

/*if point_distance(x,y,oPlayer.x,oPlayer.y)>128 {
	//hsp += lengthdir_x(lengthdir_x(1,tick*300)*1.2,dir+90);
	//vsp += lengthdir_y(lengthdir_x(1,tick*300)*1.2,dir+90);
}*/

var bl = 4;

if in_radius==1 && ui_an<0.1 && oPlayer.control==1 {
var _pd = point_direction(x,y,oPlayer.x,oPlayer.y-10);
switch (ML_ESTIM()) {
	
	case 0:
		ML_hsp = reach_tween(ML_hsp,-1,bl)*mean(ML_proof[0,1],1,1);
		ML_vsp = reach_tween(ML_vsp,0,bl)*mean(ML_proof[0,1],1,1);
	break;
	
	case 1:
		ML_hsp = reach_tween(ML_hsp,-sqrt2,bl)*mean(ML_proof[1,1],1,1);
		ML_vsp = reach_tween(ML_vsp,sqrt2,bl)*mean(ML_proof[1,1],1,1);
	break;
	
	case 2:
		ML_hsp = reach_tween(ML_hsp,0,bl)*mean(ML_proof[2,1],1,1);
		ML_vsp = reach_tween(ML_vsp,1,bl)*mean(ML_proof[2,1],1,1);
	break;
	
	case 3:
		ML_hsp = reach_tween(ML_hsp,sqrt2,bl)*mean(ML_proof[3,1],1,1);
		ML_vsp = reach_tween(ML_vsp,sqrt2,bl)*mean(ML_proof[3,1],1,1);
	break;
	
	case 4:
		ML_hsp = reach_tween(ML_hsp,1,bl)*mean(ML_proof[4,1],1,1);
		ML_vsp = reach_tween(ML_vsp,0,bl)*mean(ML_proof[4,1],1,1);
	break;
	
	case 5:
		ML_hsp = reach_tween(ML_hsp,sqrt2,bl)*mean(ML_proof[5,1],1,1);
		ML_vsp = reach_tween(ML_vsp,-sqrt2,bl)*mean(ML_proof[5,1],1,1);
	break;
	
	case 6:
		ML_hsp = reach_tween(ML_hsp,0,bl)*mean(ML_proof[6,1],1,1);
		ML_vsp = reach_tween(ML_vsp,-1,bl)*mean(ML_proof[6,1],1,1);
	break;
	
	case 7:
		ML_hsp = reach_tween(ML_hsp,-sqrt2,bl)*mean(ML_proof[7,1],1,1);
		ML_vsp = reach_tween(ML_vsp,-sqrt2,bl)*mean(ML_proof[7,1],1,1);
	break;
	
	case 8: // STOP
		if (floor(abs(oPlayer.hsp))==0 && floor(abs(oPlayer.vsp))==0) {
			ML_hsp *= 0.9;
			ML_vsp *= 0.9;
		};
	break;
	default: break;
}

if ML_truth_pattern!=ML_estim {
	ML_hsp *= 0.9;
	ML_vsp *= 0.9;
};
} else {
	ML_hsp *= 0.9;
	ML_vsp *= 0.9;
};

hsp = reach_tween(hsp,ML_hsp*clamp(pd/12,abs(oPlayer.hsp),oPlayer.base_hsp*1.5),bl);//mean(ML_hsp,reach_tween(hsp,ML_hsp*mean(((1+sqrt(pd))/2),1),2));
vsp = reach_tween(vsp,ML_vsp*clamp(pd/12,abs(oPlayer.vsp),oPlayer.base_hsp*1.5),bl);//mean(ML_vsp,reach_tween(vsp,ML_vsp*mean(((1+sqrt(pd))/2),1),2));

shoot = max(shoot-1,0);

if 1==0 && oControl.mode==3 && oPlayer.ks && shoot=0 && ui_open==0 {
	shoot = cool;
	shot_dir = dir;//point_direction(x,y,mouse_x,mouse_y);
	punch = 7;
	with(instance_create_depth(x+lengthdir_x(6,shot_dir),y+lengthdir_y(6,shot_dir),depth+1,oBullet)) {
		var pd = other.dir;//point_direction(x,y,mouse_x,mouse_y);
		cam_p_dir = pd-180;
		cam_push = 4;
		cam_shake = 1;
		dir = pd;
		hsp = lengthdir_x(340,pd);
		vsp = lengthdir_y(340,pd);
	};
}
} else {
	hsp *= 0.5;
	vsp *= 0.5;
};
event_inherited();
} else {
	hsp *= 0.9;
	vsp *= 0.9;
};




