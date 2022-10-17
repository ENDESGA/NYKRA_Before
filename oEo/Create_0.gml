event_inherited();

player_solid = 0;
solidtoothers = 0;

force_ui = 0;

dialogue_move = 1;

_surf=surface_create(32,32);

Xx = x;
Yy = y;

player_facing = 0;

in_radius = 0;
draw = 1;
fade_in = 1;
alive = 1;
draw_ui = 1;

snd_emit = -1;
snd_hover = -1;
snd_hover_p = 1;
snd_hover_g = 1;

ring_fade = 1;

tx = 0;
ty = 0;

bw = 6;
bh = 6;
bwh = (bw/2);
bhh = (bh/2);
control = 1;
look_id = noone;
ai_shoot = 0;

boot = 0;
boot_snd = -1;
boot_an1 = 0;
boot_an2 = 0;
boot_stop = 0;

//top left
x1 = (xstart-bwh);
y1 = (ystart-bhh);

//bottom right
x2 = (xstart+bwh);
y2 = (ystart+bhh);

ML_grid_w = 23;
ML_grid_h = 23;
ML_grid = ds_grid_create(ML_grid_w+1,ML_grid_h+1);
ML_grid_update = 0;
ML_grid_updatex = 0;
ML_grid_updatey = 0;
ML_state = 0;
ML_outputs = 9;
ML_train = 0;
weight = 0;
output = 0;
output_an = 0;
ML_estim = 0;

W_t = 0;
W_x = 0;
W_y = 0;

// L
ML_truth[0,0] = 1;
ML_truth[0,1] = 0;
ML_truth[0,2] = 0;
ML_truth[0,3] = 0;
ML_truth[0,4] = 0;
ML_truth[0,5] = 0;
ML_truth[0,6] = 0;
ML_truth[0,7] = 0;
ML_truth[0,8] = 0;
// LD
ML_truth[1,0] = 0;
ML_truth[1,1] = 1;
ML_truth[1,2] = 0;
ML_truth[1,3] = 0;
ML_truth[1,4] = 0;
ML_truth[1,5] = 0;
ML_truth[1,6] = 0;
ML_truth[1,7] = 0;
ML_truth[1,8] = 0;
// D
ML_truth[2,0] = 0;
ML_truth[2,1] = 0;
ML_truth[2,2] = 1;
ML_truth[2,3] = 0;
ML_truth[2,4] = 0;
ML_truth[2,5] = 0;
ML_truth[2,6] = 0;
ML_truth[2,7] = 0;
ML_truth[2,8] = 0;
// RD
ML_truth[3,0] = 0;
ML_truth[3,1] = 0;
ML_truth[3,2] = 0;
ML_truth[3,3] = 1;
ML_truth[3,4] = 0;
ML_truth[3,5] = 0;
ML_truth[3,6] = 0;
ML_truth[3,7] = 0;
ML_truth[3,8] = 0;
// R
ML_truth[4,0] = 0;
ML_truth[4,1] = 0;
ML_truth[4,2] = 0;
ML_truth[4,3] = 0;
ML_truth[4,4] = 1;
ML_truth[4,5] = 0;
ML_truth[4,6] = 0;
ML_truth[4,7] = 0;
ML_truth[4,8] = 0;
// RU
ML_truth[5,0] = 0;
ML_truth[5,1] = 0;
ML_truth[5,2] = 0;
ML_truth[5,3] = 0;
ML_truth[5,4] = 0;
ML_truth[5,5] = 1;
ML_truth[5,6] = 0;
ML_truth[5,7] = 0;
ML_truth[5,8] = 0;
// U
ML_truth[6,0] = 0;
ML_truth[6,1] = 0;
ML_truth[6,2] = 0;
ML_truth[6,3] = 0;
ML_truth[6,4] = 0;
ML_truth[6,5] = 0;
ML_truth[6,6] = 1;
ML_truth[6,7] = 0;
ML_truth[6,8] = 0;
// LU
ML_truth[7,0] = 0;
ML_truth[7,1] = 0;
ML_truth[7,2] = 0;
ML_truth[7,3] = 0;
ML_truth[7,4] = 0;
ML_truth[7,5] = 0;
ML_truth[7,6] = 0;
ML_truth[7,7] = 1;
ML_truth[7,8] = 0;
// STOP
ML_truth[8,0] = 0;
ML_truth[8,1] = 0;
ML_truth[8,2] = 0;
ML_truth[8,3] = 0;
ML_truth[8,4] = 0;
ML_truth[8,5] = 0;
ML_truth[8,6] = 0;
ML_truth[8,7] = 0;
ML_truth[8,8] = 1;

ML_proof[0,0] = 0;
ML_proof[1,0] = 0;
ML_proof[2,0] = 0;
ML_proof[3,0] = 0;
ML_proof[4,0] = 0;
ML_proof[5,0] = 0;
ML_proof[6,0] = 0;
ML_proof[7,0] = 0;
ML_proof[8,0] = 0;

ML_proof[0,1] = 0;
ML_proof[1,1] = 0;
ML_proof[2,1] = 0;
ML_proof[3,1] = 0;
ML_proof[4,1] = 0;
ML_proof[5,1] = 0;
ML_proof[6,1] = 0;
ML_proof[7,1] = 0;
ML_proof[8,1] = 0;

ML_truth_pattern = 0;

ML_hsp = 0;
ML_vsp = 0;
bias = 0;
sqrt2 = abs(sin(45));//sqrt(2);

for (var i = 0; i < ML_outputs; ++i) {
    output[i,0] = 0;
	output_an[i] = 0;
	bias[i] = random(1);
	var _W = ds_grid_create(ML_grid_w+1,ML_grid_h+1);
	for (var iy = 0; iy < ML_grid_h; ++iy) {
		for (var ix = 0; ix < ML_grid_w; ++ix) {
			_W[# ix,iy] = random(1)/2;
		}
	}
	output[i,1] = _W;
}

grav = 0;
fric = 0;
bounce = 0;
tscale = oControl.scale;
dir = 0;
shoot = 0;
cool = 7;
recoil = 0;
punch = 0;
shot_dir = 0;
jt_col = 0;

integration = 0;
INTEGRATED = 0;

ui_surf = -1;

ui = 0;
ui_open = 0;
ui_bg = 0;
ui_an = 0;
ui_sp[0] = sEo_ui1;
ui_sp[1] = sEo_ui2;
ui_sp[2] = sEo_uiEmpty;//
ui_sp[3] = sEo_ui3;
ui_sp[4] = sEo_uiEmpty;//
ui_sp[5] = sEo_ui6;

ui_can = 0;
ui_can[0] = 1;
ui_can[1] = 1;
ui_can[2] = 0;
ui_can[3] = oControl.EO_SPAWN; // WARP
ui_can[4] = 0;
ui_can[5] = 1;

ui_cx = 0;
ui_cy = 0;
ui_anl = ds_list_create();
ui_flash = 0;
ui_on = 0;
ui_tfl = 0;

ui_sel = 0;
ui_sel_snd = -1;
ui_sel_anim = 0;
ui_sel_main = 0;
ui_sel_an = 0;

ui_s[0,0] = "CORE";
ui_s[0,1] = "POWER INPUT";
ui_s[0,2] = "APERTURE";
ui_s[0,3] = "BARREL";
ui_s[0,4] = "MAINFRAME";
ui_s[0,5] = "visual monitors and display";
ui_s[0,6] = "energy balance and control";
ui_s[0,7] = "output dimension and warp";
ui_s[0,8] = "blast accuracy and damage";
ui_s[0,9] = "relocation matrix and return";
ui_s[0,10] = 0;
ui_s[0,11] = 0;
ui_s[0,12] = 0;
ui_s[0,13] = 0;
ui_s[0,14] = 0;

ui_s[1,0] = "SINGULARITY";
ui_s[1,1] = "NONAPROBES";
ui_s[1,2] = "CONTAINMENT";
ui_s[1,3] = "OUTER SHELL";
ui_s[1,4] = "INNER SHELL";
ui_s[1,5] = "power frequency display";
ui_s[1,6] = "AI confidence bars";
ui_s[1,7] = "neural network integration";
ui_s[1,8] = "outer structural integrity";
ui_s[1,9] = "target location memory";
ui_s[1,10] = 0;
ui_s[1,11] = 1;
ui_s[1,12] = 1;
ui_s[1,13] = 0;
ui_s[1,14] = 1;

ui_s[2,0] = "";
ui_s[2,1] = "";
ui_s[2,2] = "";
ui_s[2,3] = "";
ui_s[2,4] = "";
ui_s[2,5] = "";
ui_s[2,6] = "";
ui_s[2,7] = "";
ui_s[2,8] = "";
ui_s[2,9] = "";
ui_s[2,10] = 0;
ui_s[2,11] = 0;
ui_s[2,12] = 0;
ui_s[2,13] = 0;
ui_s[2,14] = 0;

ui_s[3,0] = "WARP";
ui_s[3,1] = "";
ui_s[3,2] = "";
ui_s[3,3] = "";
ui_s[3,4] = "";
ui_s[3,5] = "hold to warp to boldemo";
ui_s[3,6] = "";
ui_s[3,7] = "";
ui_s[3,8] = "";
ui_s[3,9] = "";
ui_s[3,10] = 0;
ui_s[3,11] = 0;
ui_s[3,12] = 0;
ui_s[3,13] = 0;
ui_s[3,14] = 0;

ui_s[4,0] = "";
ui_s[4,1] = "";
ui_s[4,2] = "";
ui_s[4,3] = "";
ui_s[4,4] = "";
ui_s[4,5] = "";
ui_s[4,6] = "";
ui_s[4,7] = "";
ui_s[4,8] = "";
ui_s[4,9] = "";
ui_s[4,10] = 0;
ui_s[4,11] = 0;
ui_s[4,12] = 0;
ui_s[4,13] = 0;
ui_s[4,14] = 0;

ui_s[5,0] = "RETURN";
ui_s[5,1] = "";
ui_s[5,2] = "";
ui_s[5,3] = "";
ui_s[5,4] = "";
ui_s[5,5] = "hold to return to entity";
ui_s[5,6] = "";
ui_s[5,7] = "";
ui_s[5,8] = "";
ui_s[5,9] = "";
ui_s[5,10] = 0;
ui_s[5,11] = 0;
ui_s[5,12] = 0;
ui_s[5,13] = 0;
ui_s[5,14] = 0;

ui_sa[0] = 0;
ui_sa[1] = 0;
ui_sa[2] = 0;
ui_sa[3] = 0;
ui_sa[4] = 0;

ui_pos_mem = ds_list_create();
can_see = 1;
lost = 0;

aim_d = 0;
aim_point = 0;
aim_dd = 0;
_poxx = 0;
_poyy = 0;

do_fric = 0;
do_grav = 0;

ds_list_add(ui_anl,0,1,2,3,4,5,6);
ds_list_shuffle(ui_anl);
ds_list_shuffle(ui_anl);