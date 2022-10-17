
fade_in *= 0.95;
if (in_radius==0) can_see = 0;
if oControl.mode==3 && alive==1 && ui_an<0.1 && oPlayer.control==1 {
if ML_state==0 {
	ds_grid_clear(ML_grid,0);
	var G = 0, eo_x = floor(x/16), eo_y = floor(y/16), G_x, G_y;
	//repeat(2) {
	repeat(ML_grid_w) {
		G = 0;
		G_x = (ML_grid_updatex);
		G_y = (ML_grid_updatey);

		if ((G_x>=0 && G_x<ML_grid_w && G_y>=0 && G_y<ML_grid_h) && (check_block((eo_x+G_x)-floor(ML_grid_w/2),(eo_y+G_y)-floor(ML_grid_h/2))==1)) {
			//G = 1;
		};

		ML_grid[# G_x,G_y] = G;

		ML_grid_updatex += 1;

		if ML_grid_updatex>=(ML_grid_w-1) {
			ML_grid_updatex = 0;
			ML_grid_updatey += 1;
		};

		if ML_grid_updatey>=(ML_grid_h-1) {
			ML_grid_updatex = 0;
			ML_grid_updatey = 0;
			ML_state = 1;
		};
	};
	
	if can_see {
		var _tppx = floor((oPlayer.x+oPlayer.hsp)/16), _tppy = floor((oPlayer.y+oPlayer.vsp)/16);
	
		ML_grid[# (_tppx-(eo_x-floor(ML_grid_w/2))),(_tppy-(eo_y-floor(ML_grid_h/2)))] = 20;
	
		if ((ds_list_size(ui_pos_mem)<=0) || (ui_pos_mem[| (ds_list_size(ui_pos_mem)-2)]!=_tppx || ui_pos_mem[| (ds_list_size(ui_pos_mem)-1)]!=_tppy)) {
			ds_list_add(ui_pos_mem,_tppx,_tppy);
		
			if ds_list_size(ui_pos_mem)>14 {
				ds_list_delete(ui_pos_mem,0);
				ds_list_delete(ui_pos_mem,0);
			};
		};
	} else if (ds_list_size(ui_pos_mem)>1) {
		
		ML_grid[# ((ui_pos_mem[| (0)])-(eo_x-floor(ML_grid_w/2))),((ui_pos_mem[| (1)])-(eo_y-floor(ML_grid_h/2)))] = 20;
		
		if (point_distance(x,y,(ui_pos_mem[| (0)]*16)+8,(ui_pos_mem[| (1)]*16)+8)<28) {
			ds_list_delete(ui_pos_mem,0);
			ds_list_delete(ui_pos_mem,0);
		};
	};
	
	/*with(parIiem) {
		other.ML_grid[# (floor(id.x/16)-(eo_x-floor(other.ML_grid_w/2))),(floor(id.y/16)-(eo_y-floor(other.ML_grid_h/2)))] = 30;
	};*/
	//ML_grid[# round(ML_grid_w/2),round(ML_grid_h/2)] = 40;
} else
if ML_state==1 {
	
	//if (in_radius==0) {can_see = 0;} else {
	
	//if (ds_list_size(ui_pos_mem)>1) {
	var _pd = point_distance(x+hsp,y+vsp,oPlayer.x+hsp,oPlayer.y+vsp), _pdd = point_direction(x+hsp,y+vsp,oPlayer.x+hsp,oPlayer.y+vsp);
	var _tpx, _tpy, _hitid;
	var RAD = (((ML_grid_w-1)/2)*16)-16;
	if (point_distance((oPlayer.x+oPlayer.hsp),(oPlayer.y+oPlayer.vsp)-10,x,y)<RAD) {
		can_see = 1;
		for (var i = 0; i < (_pd); i+=4) {
			_tpx = (x+lengthdir_x(i,_pdd));
			_tpy = (y+lengthdir_y(i,_pdd));
			
			if (check_block(floor(_tpx/16),floor(_tpy/16))==1) {
				can_see = 0;
				break;
			} else {
				_hitid = collision_point(_tpx,_tpy,parPhysics,0,1);
				if _hitid!=noone {
					if ((_hitid.solidtoothers==1) && (_hitid.player_solid==1)) {
						if point_in_rectangle(_tpx,_tpy,_hitid.x1,_hitid.y1,_hitid.x2,_hitid.y2) {
							can_see = 0;
						};
						break;
					};
				};
			};
		}
	} else can_see = 0;
		
	//if (in_radius==0) {can_see = 0;}
	
	//};
	
	//};
	
	if lost==0 {
	var player_x = oPlayer.x, player_y = oPlayer.y;
	if (can_see==0) && ds_list_size(ui_pos_mem)>1 {
		player_x = ((ui_pos_mem[| (0)])*16)+8;
		player_y = ((ui_pos_mem[| (1)])*16)+8;
	};
	
	ML_FORWARD();
	ML_estim = ML_ESTIM();
	ML_state = 0;
	//if ML_train==1 {
	//hsp = 0;
	//vsp = 0;
	
	var _PD = point_direction((player_x+oPlayer.hsp),(player_y+oPlayer.vsp)-10,x,y);
	var train = 1;
	if (_PD<=(22.5) || _PD>=(337.5)) ML_truth_pattern=0;//
	if (_PD<=(67.5) && _PD>=(22.5)) ML_truth_pattern=1;
	if (_PD<=(112.5) && _PD>=(67.5)) ML_truth_pattern=2;
	if (_PD<=(157.5) && _PD>=(112.5)) ML_truth_pattern=3;
	if (_PD<=(202.5) && _PD>=(157.5)) ML_truth_pattern=4;//
	if (_PD<=(247.5) && _PD>=(202.5)) ML_truth_pattern=5;
	if (_PD<=(292.5) && _PD>=(247.5)) ML_truth_pattern=6;
	if (_PD<=(337.5) && _PD>=(292.5)) ML_truth_pattern=7;

	if point_distance((player_x+(oPlayer.hsp*2)),(player_y+(oPlayer.vsp*2))-10,x,y)<=16 {
		ML_truth_pattern=8;
		//ML_hsp *= 0.5;
		//ML_vsp *= 0.5;
	};
	
	if ML_truth_pattern!=ML_estim {
		//ML_hsp *= 0.9;
		//ML_vsp *= 0.9;
		ML_TRAIN();
	}
	
	ML_proof[ML_truth_pattern,0] = reach_tween(ML_proof[ML_truth_pattern,0],
	(ML_truth_pattern==ML_estim),
	((ML_truth_pattern==ML_estim)?(3):(6)));
	
	};
		//ML_train = 0;
	//};
	//ds_grid_clear(ML_grid,0);
};
/*
if keyboard_check_pressed(vk_ralt) {
	ML_train = 1;
};
if keyboard_check_pressed(vk_rshift) {
	ML_train = 0;
};*/

for (var i = 0; i < ML_outputs; ++i) {
	output_an[i] = reach_tween(output_an[i],sqr(abs(real(output[i,0]))),2);
};
};

ML_proof[ML_truth_pattern,1] = reach_tween(ML_proof[ML_truth_pattern,1],ML_proof[ML_truth_pattern,0],12);





