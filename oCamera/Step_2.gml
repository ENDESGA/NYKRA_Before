
var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam);
var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);

if oControl.START_GAME==0 && keyboard_check(ord("O")) {mh = 0; mv = 0;};

if oControl.mode==3 {
if instance_number(oEo)>=1 && oEo.ui_open!=0 {
	x = reach(x,oEo.ui_cx,abs(oEo.ui_cx-x)/7);
	y = reach(y,oEo.ui_cy,abs(oEo.ui_cy-y)/7);
}
else
if (follow > -1) {
	if instance_number(follow)>=1 && follow.object_index!=oVIEW_CONSTRICT {
		xx = reach_tween(xx,(follow.x+(follow.hsp)),3);
		yy = reach_tween(yy,((follow.y-11)+follow.vsp)-(mean(16,ch/4)*instance_exists(oCamera_high)*0.825),3);
		var weak = 0;
		var cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point);
		if cp!=noone {
			if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=100 cp=noone;
		}
		else {cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point_Weak); if cp!=noone {
			weak = 1;
			if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=70 cp=noone;
			}};
		//if (oPlayer.onsolid==0 || oPlayer.p_onsolid<=0) cp=noone
		if cp!=noone || (cp==noone && an<1) {
			if cp!=noone {
				cpx = lerp(cp.x,xx,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
				cpy = lerp(cp.y,yy,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
				an = reach_tween(an,0,22);
			} else {cpx=xx; cpy=yy;};
			x = lerp(mean(cpx,cpx,cpx,cpx,xx),xx,(an));//(mean(cpx,cpx,cpx,cpx,xx)*(1-an))+(xx*an);
			y = lerp(mean(cpy,cpy,cpy,cpy,yy),yy,(an));//(mean(cpy,cpy,cpy,cpy,yy)*(1-an))+(yy*an);
			if weak {
				x = mean(xx,x,x);
				y = mean(yy,y,y);
			};
		}

		if cp==noone {
			if an>=1 {
				x = xx;
				y = yy;
			}
			an = reach_tween(an,1,22);
		};
	};
}
else
if follow<=-2 && follow!=noone {
	xx = x;
	yy = y;
	mh = 0;
	mv = 0;
	if follow<=-4 {follow+=1;
	if follow>=-4 && instance_exists(oPlayer) follow=oPlayer;};
};
} else follow = -5;

if oControl.mode!=3 {
	if instance_exists(oPlayer) oPlayer.control = 0;
	mh += ((keyboard_check(ord("D"))-keyboard_check(ord("A")))/mean(2,pi))/2.28535;
	mv += ((keyboard_check(ord("S"))-keyboard_check(ord("W")))/mean(2,pi))/2.28535;
	
	if mouse_check_button(mb_middle) && !(oControl.mode==1 && oControl.in_mc==1) {
		mh -= (mouse_x-mx)/8;
		mv -= (mouse_y-my)/8;
	}
};

//
if (follow>-2 || follow==noone) && instance_number(oPlayer)>=1 && oControl.START_GAME==0 {
	follow = oPlayer;
	mh += ((keyboard_check(ord("K"))-keyboard_check(ord("H")))/mean(7,pi))/7;
	mv += ((keyboard_check(ord("J"))-keyboard_check(ord("U")))/mean(7,pi))/7;
};
//

var vvmx = (cx+(cw/2)), vvmy = (cy+(ch/2));
var pd = point_distance(vvmx,vvmy,x,y), pdd = point_direction(vvmx,vvmy,x,y);
var shk = cam_shake*global.SHAKE;
camera_set_view_pos(cam,
round((mh+(cx+lengthdir_x(pd/8,pdd)+(choose(-shk,shk))+lengthdir_x(cam_push*global.SHAKE,cam_p_dir)))*10)/10,
round((mv+(cy+lengthdir_y(pd/8,pdd)+(choose(-shk,shk))+lengthdir_y(cam_push*global.SHAKE,cam_p_dir)))*10)/10
);

cam_shake *= 0.9;//88123211415926535;
cam_push  *= 0.9;//88123211415926535;

mx = mouse_x;
my = mouse_y;

if follow<-4 && instance_exists(oPlayer) oPlayer.control = 0;

/*
if oControl.mode!=3 && alarm[1]<=0 {
	if oControl.file_input==0 {
		mh += ((keyboard_check(ord("D"))-keyboard_check(ord("A")))/mean(2,pi))/2.28535;
		mv += ((keyboard_check(ord("S"))-keyboard_check(ord("W")))/mean(2,pi))/2.28535;
	}
	follow = noone;
	if mouse_check_button(mb_middle) && !(oControl.mode==1 && oControl.in_mc==1) {
		mh -= (mouse_x-mx)/8;
		mv -= (mouse_y-my)/8;
	}
}
else
if (follow>-2 || follow==noone) && instance_number(oPlayer)>=1 && oControl.START_GAME==0 {
	follow = oPlayer;
	mh += ((keyboard_check(ord("K"))-keyboard_check(ord("H")))/mean(7,pi))/7;
	mv += ((keyboard_check(ord("J"))-keyboard_check(ord("U")))/mean(7,pi))/7;
};*/

//camera_set_view_pos(cam,0,0);


/*
var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam);
var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);

if oControl.START_GAME==0 && keyboard_check(ord("O")) {mh = 0; mv = 0;};

if instance_number(oEo)>=1 && oEo.ui_open!=0 {
	x = reach(x,oEo.ui_cx,abs(oEo.ui_cx-x)/7);
	y = reach(y,oEo.ui_cy,abs(oEo.ui_cy-y)/7);
}
else
if (follow != noone) && (follow != -2) {
	if instance_number(follow)>=1 && follow.object_index!=oVIEW_CONSTRICT {
		xx = reach_tween(xx,(follow.x+(follow.hsp)),3);
		yy = reach_tween(yy,((follow.y-11)+follow.vsp)-(mean(16,ch/4)*instance_exists(oCamera_high)*0.825),3);
		var weak = 0;
		var cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point);
		if cp!=noone {
			if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=100 cp=noone;
		}
		else {cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point_Weak); if cp!=noone {
			weak = 1;
			if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=70 cp=noone;
			}};
		//if (oPlayer.onsolid==0 || oPlayer.p_onsolid<=0) cp=noone
		if cp!=noone || (cp==noone && an<1) {
			if cp!=noone {
				cpx = lerp(cp.x,xx,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
				cpy = lerp(cp.y,yy,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
				an = reach_tween(an,0,22);
			} else {cpx=xx; cpy=yy;};
			x = lerp(mean(cpx,cpx,cpx,cpx,xx),xx,(an));//(mean(cpx,cpx,cpx,cpx,xx)*(1-an))+(xx*an);
			y = lerp(mean(cpy,cpy,cpy,cpy,yy),yy,(an));//(mean(cpy,cpy,cpy,cpy,yy)*(1-an))+(yy*an);
			if weak {
				x = mean(xx,x,x);
				y = mean(yy,y,y);
			};
		}

		if cp==noone {
			if an>=1 {
				x = xx;
				y = yy;
			}
			an = reach_tween(an,1,22);
		};
	};
}
else if follow<=-2 || follow==noone {
	xx = x;
	yy = y;
	mh = 0;
	mv = 0;
	if oControl.START_GAME==1 {
		if follow<-2 {follow+=1;
		if follow>-3 follow=oPlayer;};
	};
};

var vvmx = (cx+(cw/2)), vvmy = (cy+(ch/2));
var pd = point_distance(vvmx,vvmy,x,y), pdd = point_direction(vvmx,vvmy,x,y);
var shk = cam_shake*global.SHAKE;
camera_set_view_pos(cam,
round((mh+(cx+lengthdir_x(pd/8,pdd)+(choose(-shk,shk))+lengthdir_x(cam_push*global.SHAKE,cam_p_dir)))*10)/10,
round((mv+(cy+lengthdir_y(pd/8,pdd)+(choose(-shk,shk))+lengthdir_y(cam_push*global.SHAKE,cam_p_dir)))*10)/10
);

cam_shake *= 0.9;//88123211415926535;
cam_push  *= 0.9;//88123211415926535;

mx = mouse_x;
my = mouse_y;

if oControl.mode!=3 && alarm[1]<=0 {
	if oControl.file_input==0 {
		mh += ((keyboard_check(ord("D"))-keyboard_check(ord("A")))/mean(2,pi))/2.28535;
		mv += ((keyboard_check(ord("S"))-keyboard_check(ord("W")))/mean(2,pi))/2.28535;
	}
	follow = noone;
	if mouse_check_button(mb_middle) && !(oControl.mode==1 && oControl.in_mc==1) {
		mh -= (mouse_x-mx)/8;
		mv -= (mouse_y-my)/8;
	}
}
else
if (follow!=-2 && follow!=noone) && instance_number(oPlayer)>=1 && oControl.START_GAME==0 {
	follow = oPlayer;
	mh += ((keyboard_check(ord("K"))-keyboard_check(ord("H")))/mean(7,pi))/7;
	mv += ((keyboard_check(ord("J"))-keyboard_check(ord("U")))/mean(7,pi))/7;
};

//camera_set_view_pos(cam,0,0);