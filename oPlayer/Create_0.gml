event_inherited();
//flashcoln = 0;

BOLDEMO_TP = 0;

AENOX_CAN_TP = 0;

solidtoothers = 0;
tool = 0;
tool_on = 0;
tool_on_an = 0;

pause_surf = -1;

holding_eo = 0;

inv_choose = 0;
inv_choose_an = 0;
inv_choose_on = 0;
inv_choose_on_an = 0;
//INV_CHOOSE[0] = "CRAFT";
//INV_CHOOSE[1] = "BAG";
//INV_CHOOSE[2] = "TORCH";
flash_col = 0;
aenox_surf = -1;
aenox_has_power = 0;
aenox_has_power_an = 0;

necklace_anim = 0;

talking = 0;
talk_t = 0;
talk_tt = 0;
control_fade = 0;

set_state = 0;
set_anim = 0;
set_sprite = 0;

draw = 1;
ui_menu = 0;
ui_menu_an = 0;
sprite_onfloor = 0;

inv_open_annn = 0;

death_t = ceil(60*0.333);
death_ta = death_t;
death_tA = ceil(((60*0.77777777)-death_t)/3);
death_t1 = death_tA;
death_t2 = death_tA;
death_t3 = death_tA*2;
death_an = 0;

death_final = 0;

respawn = 0;

//THOUGHT = "Where am I?";

books = ds_list_create();
//ds_list_add(books,5,4,3,2,1,0);

book_desc = 0;
book_desc[0] = 0;

event_user(2);
alarm[8] = 2;

hept_anim = 1;
hept_anim2 = 1;

GP_col = 0;

hept_fade = 0;

UI_OPEN = 0;
UI_SMELT = 0;
UI_CRAFT = 0;

smelt_choose_n = 0;
smelt_choose_n_an = 0;
t_click_sfx = 0;

hit_id = -1;

p_control = 0;
aenox = !(bool(floor(real(oControl.START_GAME))));
has_aenox = aenox;

// TEST
//aenox = 0;
//has_aenox = 1;
//oControl.GAME_CHAPTER[1,5] = 1;
////////////////////////////////

can_aenox_re = 0;
aenox_re_anim = 0;
aenox_re_tick = -1;
aenox_re_time = -1;
aenox_re_getan = 20;
aenox_re_tick_an = -1;
aenox_re_snd = -1;
aenox_re_finding = 0;
aenox_re_finding_an = 0;
aenox_an = 0;
aenox_t = 0;
aenox_use = 0;
aenox_x = 0;
aenox_y = 0;
aenox_id = noone;
aenox_ID = noone;
aenox_bw = 0;
aenox_bh = 0;
paenox_an = 1;

RESPAWN_RM = "rmMal_Origin";
dead = 0;
dead_an = 1;

shd_dissolve_size       = shader_get_uniform( shDissolve, "size"      );

// Amount to dissolve 0 = blank, 1 = fully dissolved, 1 + fadeColorDistance = color back to normal
shd_dissolve_amount     = shader_get_uniform( shDissolve, "amount"    );

// Color to fade from. Values are r, g, b and must be from 0.0 to 1.0
shd_dissolve_fade_color = shader_get_uniform( shDissolve, "fadeColor" );

// Offset of the perlin noise. Use this to get a different noise effect each time
shd_dissolve_offset     = shader_get_uniform( shDissolve, "offset"    );

// Values used for debug testing (see step and draw events)
dead_amount = 1;
dead_offset = random(50)+random(100)+1.0;
dead_x = 0;
dead_y = 0;
dead_fade = 1;

MED_INV = ds_list_create();
MED_INV_N = ds_list_create();

current_bag_prev = -1;

med_use = 0;
med_use_click = 0;

STATS[0,0] = 0; // locks opened
STATS[0,1] = 0; // bag opened
STATS[0,2] = 0; // aenox take

aenox_h = 0;
aenox_hm = 100;

step_sfx = 0;

weight = 1;

debug1 = 0;
debug2 = 0;

control_l = 0;
control_r = 0;

//alarm[4]=2;

alpha = 1;

dlg_anim = 0;
thept = 0;
hept_obj = noone;
hept_obj_d = 0;
hept_use = 0;
hept_use_an = 0;
hxp = 0;
hyp = 0;
hept_max = 100;
hept = hept_max;
hept_charge = 0;
//game_start = 1;

SAVE_prev_rm = -1;
SAVE_prev_x = -1;
SAVE_prev_y = -1;

tSAVE_curr_rm = -1;
tSAVE_curr_x = -1;
tSAVE_curr_y = -1;

SAVE_curr_rm = -1;
SAVE_curr_x = -1;
SAVE_curr_y = -1;

hp_max = 7;
hp = hp_max;
r_hp = hp;

hp_regen = 60*7;
//hp_regen_t = 0;

hept_recharge = 0;
fade_an1 = 12;
fade_an11 = 0;
fade_an2 = 0;
fade_an3 = 0;

grab_t = 0;

bh_s = 2000;
bh_surf = 0;
mob_near = 0;
//outlineColor = shader_get_uniform(shOutline, "outlineColor");
//sprite_size = shader_get_uniform(shOutline, "sprite_size");
hept_got = 1;
hept_an = 0;
/*heptacon[0] = 1; // NEA
heptacon[1] = -1; // LAR
heptacon[2] = -1; // DOX
heptacon[3] = -1; // KIV
heptacon[4] = -1; // ENO
heptacon[5] = -1; // VEN
heptacon[6] = -1; // TOL*/

damage = 0;

door_n = -1;

has_telarod = !(bool(floor(real(oControl.START_GAME))));
telarod_an = 0;
telarod_ant = 0;
telarod = 0;
attack = 0;
attack_an = 0;

can_boldemo = !(bool(floor(real(oControl.START_GAME))));

bw = 8;
bh = 22;
bwh = bw/2;
bhh = bh/2;
//alarm[3] = 6;

path_side = 0;
has_path = -1;
prev_room = room;

x1 = floor(x-bwh);
y1 = floor(y-bhh);
x2 = floor(x+bwh);
y2 = floor(y+bhh);

base_hsp = 1.46;
max_hsp = base_hsp;
acc_hsp = 0.1269;
facing = 1;
hop = 0;
toka = 0;
jumped = 0;

control = 1;
do_grav = 0;
grav = 0;
do_fric = 0;

grab = 0;
slide = 0;

kl = 0;
kr = 0;
ku = 0;
kj = 0;
kd = 0;
ks = 0;
ka = 0;


kks = ord("D"); // shoot
kka = ord("S"); // action
kpu = 0;
kpj = 0;

state = sPlayer_idle;
state_n = 0;
anim = 0;
anim_t = 0;
frame = 0;

jump = 0;
jump_t = 5;
land = 0;
_pvs = vsp;
_pos = onsolid;
p_onsolid = onsolid;

IDLE[0] = sPlayer_idle;
RUN[0] = sPlayer_run;
WALK[0] = sPlayer_walk;
JUMP[0] = sPlayer_jump;
ATTACK[0] = sPlayer_telarod_attack;

IDLE[1] = sPlayer_telarod_idle;
RUN[1] = sPlayer_telarod_run;
WALK[1] = sPlayer_telarod_run;
JUMP[1] = sPlayer_telarod_jump;
ATTACK[1] = sPlayer_telarod_attack;

IDLE[2] = sPlayer_idleCoat;
RUN[2] = sPlayer_runCoat;
WALK[2] = sPlayer_runCoat;
JUMP[2] = sPlayer_jumpCoat;
ATTACK[2] = sPlayer_telarod_attack;

onblock_id = -1;
_snd = sndStep_grass1;
inv_open = 0;
inv_open_an = 0;
inv_open_book = 0;
inv_open_tool = 0;
inv_open_planet = 0;
inv_open_book_an = 0;
inv_open_tool_an = 0;
inv_open_planet_an = 0;

craft_open = 0;
craft_open_an = 0;

inv_sel = 0;
inv_sel_an = 0;
inv_sel_an2 = 0;
inv_sel_an3 = 0;
inv_sel_an4 = 0;
bag_sel = 0;
current_bag = -1;
bag_sel_an = 0;
bag_sel_ann = 0;

planet_info[0] = -1;

PLANET_FOUND = ds_list_create();
planet_menu = 0;
planet_menu_an = 0;
planet_menu_sel = 0;
planet_menu_sel_an = 0;

//ini_language();
//bag_n[0] = ini_read_string("GENERAL","bagn1",""); // NAME
//bag_n[1] = ini_read_string("GENERAL","bagn2",""); // PLURAL NAME
//bag_n[2] = ini_read_string("GENERAL","bagn3",""); // DESCRIPTION
//ini_close();

//bag_n[0] = "ITEMS";
//bag_n[1] = "MEDICINE"
//bag_n[2] = "KEY ITEMS";
//bag_n[3] = "IIEDREMOR";
//bag_n[3] = "TOKA POUCH";
//bag_n[4] = "HEPTACON";
bag_sel_ob = 1;
bag_iie_an = 0;

symbol_pos = 0;
page_anim = 0;
page_flip_an = 11;
page_flip_d = 1;

hascontrol_an = 1;
/*
collected_symbols = ds_list_create();
col_sym_sel = 2;
ds_list_add(collected_symbols,0,1,2,3,4,5,6,7,8,9,10,11,12,13);
ds_list_shuffle(collected_symbols);

var i=0;
symbol[i,0] = "Start"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 8; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 1; // CIRCLE
symbol[i,11] = "NAI";
symbol[i,12] = "NAH";
symbol[i,13] = "NEH";
i++;
symbol[i,0] = "Repeat"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 9; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "DOK";
symbol[i,12] = "DAK";
symbol[i,13] = "DOA";
i++;
symbol[i,0] = "Manifest"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 2; // CIRCLE
symbol[i,11] = "TEL";
symbol[i,12] = "TAI";
symbol[i,13] = "TEM";
i++;
symbol[i,0] = "Somewhere"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 4; // tr
symbol[i,4] = 9; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "KAL";
symbol[i,12] = "KON";
symbol[i,13] = "KUA";
i++;
symbol[i,0] = "This"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 8; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 1; // CIRCLE
symbol[i,11] = "DOH";
symbol[i,12] = "DOR";
symbol[i,13] = "DOM";
i++;
symbol[i,0] = "That"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 4; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 2; // CIRCLE
symbol[i,11] = "SOH";
symbol[i,12] = "SOR";
symbol[i,13] = "SOM";
i++;
symbol[i,0] = "Last"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 5; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 2; // CIRCLE
symbol[i,11] = "GAI";
symbol[i,12] = "GAH";
symbol[i,13] = "GEH";
i++;
symbol[i,0] = "Time"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 5; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 7; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 1; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "TEO";
symbol[i,12] = "TEI";
symbol[i,13] = "TAN";
i++;
symbol[i,0] = "Space"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 9; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 5; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 1; // CIRCLE
symbol[i,11] = "PEN";
symbol[i,12] = "PAN";
symbol[i,13] = "PON";
i++;
symbol[i,0] = "Random"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 6; // tr
symbol[i,4] = 6; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 1; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 6; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "VEI";
symbol[i,12] = "VOL";
symbol[i,13] = "VEA";
i++;
symbol[i,0] = "Infinity"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 0; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 3; // CIRCLE
symbol[i,11] = "G";
symbol[i,12] = "-";
symbol[i,13] = "-";
i++;
symbol[i,0] = "Entropy"; // translation??
symbol[i,1] = 3; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 4; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 1; // mr
symbol[i,7] = 6; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "KWO";
symbol[i,12] = "KOR";
symbol[i,13] = "KRA";
i++;
symbol[i,0] = "Force"; // translation??
symbol[i,1] = 2; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 2; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 2; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 0; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 2; // CIRCLE
symbol[i,11] = "BAR";
symbol[i,12] = "BUO";
symbol[i,13] = "BIN";
i++;
symbol[i,0] = "Energy"; // translation??
symbol[i,1] = 0; // tl
symbol[i,2] = 0; // tc
symbol[i,3] = 1; // tr
symbol[i,4] = 0; // ml
symbol[i,5] = 0; // mc
symbol[i,6] = 0; // mr
symbol[i,7] = 1; // bl
symbol[i,8] = 0; // bc
symbol[i,9] = 0; // br
symbol[i,10] = 0; // CIRCLE
symbol[i,11] = "ZAR";
symbol[i,12] = "ZOL";
symbol[i,13] = "ZIN";
*/

prev_control = 0;

bag_weight = 0;
bag_weight_max = 27200;

ui_extra_an = 0;
UI_SMELT_ID = noone;

inv_sel_w = 0;

circ_an = 0;
circ_go = 0;
circ_ann = 0;

collide_object = 1;
grav = 1;

prev_x1 = x1;
prev_y1 = y1;
prev_x2 = x2;
prev_y2 = y2;

//inv_create();
//repeat(30) player_inv_add(irandom(6),1);






//

// DEBUG
/*
has_telarod = 0;
can_boldemo = 0;
aenox = 0;
has_aenox = 0;
*/