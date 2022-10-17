//var tgrab = grab;

if vsp>0 && ((y2+vsp)>=((oControl.mh-1)*16)) {
	y2 = oControl.mh*16;
	y1 = y2-bh;
	vsp = 0;
	col_b = 1;
};

//x1 = max(x1,0);
//y1 = max(y1,0);
//x2 = x1+bw;
//y2 = y1+bh;
//x2 = max(x2,

/*if hsp<0 && (mid_map_pos_x1<0 || map_pos_x1<0 || prev_map_pos_x1<0) {
	x1 = 0;
	x2 = x1+boundary_width;
	hsp = 0;
	col_l = 1;
}
else
if hsp>0 && (mid_map_pos_x2>map_W-1 || map_pos_x2>map_W-1 || prev_map_pos_x2>map_W-1) {
	x2 = map_W<<grid_sz;
	x1 = x2-boundary_width;
	hsp = 0;
	col_r = 1;
};*/

if dead {control=0; UI_OPEN=1; };//SOUND_VOLUME = 0;};
if physics==1 {
	ARRAY_COLLIDE();
}
else
if physics==0 {
	//x1 += hsp;
	//y1 += vsp;
	//x2 += hsp;
	//y2 += vsp;
}
if col_b onsolid=1;
bb_setmiddle();
/*
if grab!=facing grab = 0;

if (hsp<-0.1 || hsp>0.1) && grab!=0 {
	grab=0;
}*/
/*
if grab!=0 {
	if keyboard_check_pressed(kkd) slide = 1;
	grab_t = 1;
}
else
grab_t = max(grab_t-0.25,0);*/


/*if tvsp!=9999 vsp = tvsp;
if thsp!=9999 hsp = thsp;

tvsp = 9999;
thsp = 9999;

t_vsp = vsp;*
/*
if vsp<0 grab=0;

if tgrab==0 && grab!=0 && slide==0 {
	hsp=0;
	vsp=0;
	y1 = ((y1/16)*16)-1;
	y2 = y1+bh;
}*/

prev_control = control;
if inv_open_an>=0.5 control = 0;

/*

var f_x1=((x1+hsp)/16), f_x2=((x2+hsp)/16), f_y1=((y1+vsp)/16), f_y2=((y2+vsp)/16);
	//var T_hsp = (round(hsp*10)/10);
	if hsp>0 {
		if (((x2-(sign(hsp)/2))/16)!=f_x2) && (map_id[map[@ f_x2,((y1+1)/16)],1]==1 || map_id[map[@ f_x2,((y2-1)/16)],1]==1) {
			x2 = f_x2*16;
			x1 = x2-bw;
			hsp = 0;
		}
		else
		{
			x1 += hsp;
			x2 += hsp;
		};
	}
	else
	if hsp<0 {
		if (((x1-(sign(hsp)/2))/16)!=f_x1) && (map_id[map[@ f_x1,((y1+1)/16)],1]==1 || map_id[map[@ f_x1,((y2-1)/16)],1]==1) {
			x1 = (f_x1+1)*16;
			x2 = x1+bw;
			hsp = 0;
		}
		else
		{
			x1 += hsp;
			x2 += hsp;
		};
	};

	if vsp>0 {
		if (((y2-(sign(vsp)/2))/16)!=f_y2) {
			if (jt_col==1 && (map_id[(map[@ ((x1+1)/16),f_y2]),1]==2 || map_id[@ (map[((x2-1)/16),f_y2]),1]==2) && (ceil((y2)/16)!=ceil((y2+vsp)/16))) {
				y2 = f_y2*16;
				y1 = y2-bh;
				onsolid = 1;
				vsp = 0;
				onJT = 1;
			}
			else
			if (map_id[(map[((x1+1)/16),f_y2]),1]==1 || map_id[(map[((x2-1)/16),f_y2]),1]==1)  {
				y2 = f_y2*16;
				y1 = y2-bh;
				onsolid = 1;
				vsp = 0;
			}
			else
			{
				y1 += vsp;
				y2 += vsp;
			};
			if onsolid {
				hit_id = map[x/16,f_y2];
				onblock_id = map[x/16,f_y2];
			}
		}
		else
		{
			y1 += vsp;
			y2 += vsp;
		};
	}
	else
	if vsp<0 {
		if (((y1-(sign(vsp)/2))/16)!=f_y1) && (map_id[map[@ ((x1+1)/16),f_y1],1]==1 || map_id[map[@ ((x2-1)/16),f_y1],1]==1) {
			y1 = (f_y1+1)*16;
			y2 = y1+bh;
			vsp = 0;
		}
		else
		{
			y1 += vsp;
			y2 += vsp;
		};
	}














/*



var map_pos_x1, map_pos_y1, map_pos_x2, map_pos_y2;
	var mid_map_pos_x1, mid_map_pos_y1, mid_map_pos_x2, mid_map_pos_y2;
	var prev_map_pos_x1, prev_map_pos_y1, prev_map_pos_x2, prev_map_pos_y2;

	// GRID SIZE for BITWISE OPERATIONS
	//var 4 = map_GRID_SIZE; // since using a local variable is a little better

	prev_map_pos_y1 = ((prev_y1+0.001)/16); // Previous x1,y1,x2,y2 positions with a SMALL buffer of 0.001 (can be smaller)
	prev_map_pos_y2 = ((prev_y2-0.001)/16); // the buffer allows the correct collision boundaries for movement
	prev_map_pos_x1 = ((prev_x1+0.001)/16);
	prev_map_pos_x2 = ((prev_x2-0.001)/16);

	mid_map_pos_x1 = (mean(x1 + hsp,prev_x1)/16);
	mid_map_pos_y1 = (mean(y1 + vsp,prev_y1)/16);
	mid_map_pos_x2 = (mean(x2 + hsp,prev_x2)/16);
	mid_map_pos_y2 = (mean(y2 + vsp,prev_y2)/16);

	// WHERE IT WILL BE IN THE GRID
	map_pos_x1 = ((x1 + hsp)/16); // We're adding the speed to the corner variables, which allows us
	map_pos_y1 = ((y1 + vsp)/16); // to find if where it will be will intersect within a GRID cell.
	map_pos_x2 = ((x2 + hsp)/16);
	map_pos_y2 = ((y2 + vsp)/16);

	if vsp<0 && (mid_map_pos_y1<0 || map_pos_y1<0 || prev_map_pos_y1<0) {
		y1 = 0;
		y2 = y1+bh;
		vsp = 0;
		col_t = 1;
	}
	else
	if vsp>0 && (mid_map_pos_y2>oControl.mh-1 || map_pos_y2>oControl.mh-1 || prev_map_pos_y2>oControl.mh-1) {
		y2 = oControl.mh*16;
		y1 = y2-bh;
		vsp = 0;
		col_b = 1;
	};
	if hsp<0 && (mid_map_pos_x1<0 || map_pos_x1<0 || prev_map_pos_x1<0) {
		x1 = 0;
		x2 = x1+bw;
		hsp = 0;
		col_l = 1;
	}
	else
	if hsp>0 && (mid_map_pos_x2>oControl.mw-1 || map_pos_x2>oControl.mw-1 || prev_map_pos_x2>oControl.mw-1) {
		x2 = oControl.mw*16;
		x1 = x2-bw;
		hsp = 0;
		col_r = 1;
	};

	if hsp<0 { // GOING LEFT
		// Does it collide at the x midpoint, using the previous y buffer positions?
		// Notice the *_pos_y1 and *_pos_y2 in the arrays. We're checking the top AND bottom of the object
		if ((map[mid_map_pos_x1,prev_map_pos_y1] != 0) || (map[mid_map_pos_x1,prev_map_pos_y2] != 0)) {
			x1 = (mid_map_pos_x1+1)*16;	// We want to move to the correct SIDE of the tile cell, so we add 1
			x2 = x1+bw;				// This is the right side of the boundary, so we get the left + width
			hsp *= bounce;					// We collided! so, if bounce==0 we stop, otherwise, WE BOUNCE!
			col_l = 1;					// Set the collide_* variable to 1
		}
		else
		{
			// This is the exact same thing, but we are now using WHERE-IT-WILL-BE positions ~!
			if ((map[map_pos_x1,prev_map_pos_y1] != 0) || (map[map_pos_x1,prev_map_pos_y2] != 0)) {
				x1 = (map_pos_x1+1)*16;
				x2 = x1+bw;
				hsp *= bounce;
				col_l = 1;
			}
			else
			{
				x1 += hsp;
				x2 += hsp;
			};
		};
	}
	else
	if hsp>0 { // GOING RIGHT
		if ((map[mid_map_pos_x2,prev_map_pos_y1] != 0) || (map[mid_map_pos_x2,prev_map_pos_y2] != 0)) {
			x2 = (mid_map_pos_x2)*16;
			x1 = x2-bw;
			hsp *= bounce;
			col_r = 1;
		}
		else
		{
			if ((map[map_pos_x2,prev_map_pos_y1] != 0) || (map[map_pos_x2,prev_map_pos_y2] != 0)) {
				x2 = (map_pos_x2)*16;
				x1 = x2-bw;
				hsp *= bounce;
				col_r = 1;
			}
			else
			{
				x1 += hsp;
				x2 += hsp;
			};
		};
	};

	// RE-ADJUST THE HORIZONTAL POSITIONS
	// This is important, because this will stop any sort of weird "ghost" positioning.
	// Logically this doesn't seem needed, but it solves a bug when it comes to moving into corners at small speeds.
	prev_x1 = x1;
	prev_x2 = x2;
	prev_map_pos_x1 = ((prev_x1+0.001)/16);
	prev_map_pos_x2 = ((prev_x2-0.001)/16);
	mid_map_pos_x1 = (mean(x1 + hsp,prev_x1)/16);
	mid_map_pos_x2 = (mean(x2 + hsp,prev_x2)/16);

	if vsp<0 { // GOING UP
		if ((map[prev_map_pos_x1,mid_map_pos_y1] != 0) || (map[prev_map_pos_x2,mid_map_pos_y1] != 0)) {
			y1 = (mid_map_pos_y1+1)*16;
			y2 = y1+bh;
			vsp *= bounce;
			col_t = 1;
		}
		else
		{
			if ((map[prev_map_pos_x1,map_pos_y1] != 0) || (map[prev_map_pos_x2,map_pos_y1] != 0)) {
				y1 = (map_pos_y1+1)*16;
				y2 = y1+bh;
				vsp *= bounce;
				col_t = 1;
			}
			else
			{
				y1 += vsp;
				y2 += vsp;
			};
		};
	}
	else
	if vsp>0 { // GOING DOWN
		if ((map[prev_map_pos_x1,mid_map_pos_y2] != 0) || (map[prev_map_pos_x2,mid_map_pos_y2] != 0)) {
			y2 = (mid_map_pos_y2)*16;
			y1 = y2-bh;
			vsp *= bounce;
			col_b = 1;
		}
		else
		{
			if ((map[prev_map_pos_x1,map_pos_y2] != 0) || (map[prev_map_pos_x2,map_pos_y2] != 0)) {
				y2 = (map_pos_y2)*16;
				y1 = y2-bh;
				vsp *= bounce;
				col_b = 1;
			}
			else
			{
				y1 += vsp;
				y2 += vsp;
			};
		};
	};










////////////////////////////////////

/*
repeat(ceil(amount)+1) {
	// reset x positions
	hit = 0;
	hit_id = -1;
	_x1 = ((x1+__qwe)/16);
	_x2 = ((x2-__qwe)/16);
	if abs(vsp)-vs>0 {
		if abs(vsp)<1 vvsp=vsp; 
		vvsp=min((abs(vsp)/amount),(abs(vsp)-vs))*sign(vsp);
		f_y2 = floor((y2+vvsp)/16);
		f_y1 = floor((y1+vvsp)/16);
		if sign(vsp)==1 {
			if (map_id[@ map[@ _x1,f_y2],1]!=0 || map_id[@ map[@ _x2,f_y2],1]!=0) {
				if ((jt_col==1 && (map_id[(map[_x1,f_y2]),1]==2 || map_id[(map[_x2,f_y2]),1]==2) && (ceil((y2)/16)!=ceil((y2+vvsp)/16)))
				|| (map_id[(map[_x1,f_y2]),1]==1 || map_id[(map[_x2,f_y2]),1]==1))  {
					vsp*=-bounce;
					y2=(f_y2*16);
					y1=y2-bh;
					hit = 1;
					hit_id = map[round(mean(_x2,_x1)),f_y2];
					onsolid = 1;
					if jt_col==1 && (map[_x1,f_y2]==7 || map[_x2,f_y2]==7) {
						if (map_id[(map[_x1,f_y2]),1]!=1 && map_id[(map[_x2,f_y2]),1]!=1) {
							onJT = 1;
						}
					}
					onblock_id = map[(mean(x1,x2)/16),f_y2];
					if stat==1 break;
					col_b = 1;
				} else {y1+=vvsp; y2+=vvsp;}
			} else {y1+=vvsp; y2+=vvsp;}
		}
		else
		if sign(vsp)==-1 {if map_id[@ map[@ _x1,f_y1],1]!=0 || map_id[@ map[@ _x2,f_y1],1]!=0  {
				if map_id[(map[_x1,f_y1]),1]==1 || map_id[(map[_x2,f_y1]),1]==1 {
					vsp*=-bounce;
					y1=((1+f_y1)*16);
					y2=y1+bh;
					hit = 1;
					hit_id = map[round(mean(_x2,_x1)),f_y1];
					if stat==1 break;
					col_t = 1;
				} else {y1+=vvsp; y2+=vvsp;}
			} else {y1+=vvsp; y2+=vvsp;}
		};
	}
	// reset y positions
	_y1 = ((y1)/16);
	_y2 = ((y2-__qwe)/16);
	if abs(hsp)-hs>0 {
		if abs(hsp)<1 hhsp=hsp;
		hhsp=min((abs(hsp)/amount),(abs(hsp)-hs))*sign(hsp);
		f_x2 = floor((x2+hhsp)/16);
		f_x1 = floor((x1+hhsp)/16);
		if sign(hsp)==1 {if (map_id[@ map[@ f_x2,_y1],1]==1 || map_id[@ map[@ f_x2,_y2],1]==1 || map_id[@ map[@ f_x2,mean(_y2,_y1)],1]==1) {
			hsp*=-bounce;
			x2=(f_x2*16);
			x1=x2-bw;
			hit = 1;
			hit_id = map[f_x2,round(mean(_y2,_y1))];
			if stat==1 break;
			col_r = 1;
		} else {x1+=hhsp; x2+=hhsp;}}
		else
		if sign(hsp)==-1 {if (map_id[@ map[@ f_x1,_y1],1]==1 || map_id[@ map[@ f_x1,_y2],1]==1 || map_id[@ map[@ f_x1,mean(_y2,_y1)],1]==1) {
			hsp*=-bounce;
			x1=((1+f_x1)*16);
			x2=x1+bw;
			hit = 1;
			hit_id = map[f_x1,round(mean(_y2,_y1))];
			if stat==1 break;
			col_l = 1;
		} else {x1+=hhsp; x2+=hhsp;}};
		if vsp>=0.1 && grab==0 {
			if col_r && facing==1 && map_id[@ map[@ f_x2,_y1],1]==1 && map[@ f_x2,_y1]==18 {
				if map[@ f_x2,_y1-1]!=0 slide=1 else slide=0;
				if ((_y1*16)+2)<t_prev_y1 slide=1;
				if grab==0 && slide==0 {
					//y1 = (floor((mean(y2,y1)+1+vsp)/16)*16)-1;
					//y2 = y1+bh;
				}
				grab = 1;
			}
			else
			if col_l && facing==-1 && map_id[@ map[@ f_x1,_y1],1]==1 && map[@ f_x1,_y1]==18 {
				if map[@ f_x1,_y1-1]!=0 slide=1 else slide=0;
				if ((_y1*16)+2)<t_prev_y1 slide=1;
				if grab==0 && slide==0 {
					//y1 = (floor((mean(y2,y1)+1+vsp)/16)*16)-1;
					//y2 = y1+bh;
				}
				grab = -1;
			}
		}
	}
	if col_b grab = 0;
	vs += (abs(vsp)/amount);
	hs += (abs(hsp)/amount);
	
	if grab!=0 && slide==1 {
		if (grab==-1 && map[@ (((x1+1)/16)-1),(mean(y1,y1,y2)/16)]==0) || (grab==1 && map[@ (((x2-1)/16)+1),(mean(y1,y1,y2)/16)]==0) {grab=0; slide=0;};
	}
	
	if hit==1 && hit_id==19 {
		hurt_player(7,x,y,choose(sndHit_Gnar1,sndHit_Gnar2,sndHit_Gnar3,sndHit_Gnar4));
	}
}


/////////////////////////////////////////////




//vsp+=0.29471;
/*
if jump==0 {
	if (kj && onsolid && jump_t>0) {
		jump = jump_t;
	}
}
else
{
	if onsolid && jump>1 && kj {
		jump -= 1;
	}
	else
	{
		vsp -= (jump_t-jump);
		jump = 0;
		/*repeat(round(jump_t-jump)) {
		with(instance_create(x+random_range(-3,3),y2+1+random_range(-0.5,0.5),oPlayer_smoke)){
			spd = random_range(0.4,abs(other.vsp)/1.5)/pi;
			dir = 90;
			//if oPlayer.facing==-1 dir = random_range(0,60);
		}
		}*/
//	};
//};

//event_inherited();