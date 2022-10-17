
CONTROL_MODE = 0;

randomise();
global.D_NUMBER = round(mean(7777,irandom_range(1001,7000)));

//uBlur = shader_get_uniform(shBloom,"Blur");
FPS = 0;
FPS_N = 0;

START_GAME = 0;

EO_SPAWN = 0;
//if (START_GAME) EO_SPAWN = 0;

if START_GAME {	
	gml_release_mode(1);
	gml_pragma("PNGCrush");
	gml_pragma("UnityBuild", "true");
}

chmusic = -1;
chmusic_n = -1;
chmusic_id = -1;

global.PROFILE = 1;

touch_max = 5;
for (var i = 0; i < touch_max; ++i) {
	touch[i,0] = "";
	touch[i,1] = "";
	touch[i,2] = "";
	//touch[i,3] = "";
}

global.touch_left		= -1;
global.touch_right		= -1;
global.touch_up			= -1;
global.touch_down		= -1;
global.touch_jump		= -1;
global.touch_aenox		= -1;
global.touch_telarod	= -1;
global.touch_eo			= -1;
global.touch_inv		= -1;

dragging = 0;
drag_sx = 0;
drag_sy = 0;
drag_x = 0;
drag_y = 0;
drag_xv = 0;
drag_yv = 0;

pause_surf = -1;
pause_obj = 0;
//if room_previous(room)!=-1 START_GAME = 1;

/*if START_GAME==0 {
	var _files = file_find_first(working_directory +"*.SAVE",0);
	if _files!="" {
		file_delete(working_directory +_files)
		_files = file_find_next();
		while(_files!="") {
			file_delete(working_directory +_files)
			_files = file_find_next();
			if _files=="" break;
		}
	}
	file_find_close();
};*/

GPL=-1;GPR=-1;GPU=-1;GPD=-1;GPJ=-1;
quit = 0;
quit_dt = 0;
depth = -100;
randomise();

Praedim_level = 5;
Praedim_elevator_level = 0;

alarm[0] = 6;
planet = 0;
globalvar CURRENT_PLANET;
globalvar SOUND_VOLUME;
globalvar CX;
globalvar CY;
globalvar CW;
globalvar CH;
globalvar CMX;
globalvar CMY;
globalvar CHYP;

globalvar LANGUAGE_FILE;
LANGUAGE_FILE = "dlg_eng.lang";

collision_list = 0;
collision_list[0] = noone;

planet_name[0] = "MALDIS";
planet_name[1] = "MEXULTA";
planet_name[2] = "ARTHEK";
planet_name[3] = "IRNEM";
planet_name[4] = "SEPTEON";
planet_name[5] = "QUORNEM";
planet_name[6] = "IIEDAKAMA";

CX = 0; //camera_get_view_x(cam);
CY = 0; //camera_get_view_y(cam);
CW = 0; //camera_get_view_width(cam);
CH = 0; //camera_get_view_height(cam);
CMX = 0; //CX+(CW/2);
CMY = 0; //CY+(CH/2);
CHYP = 0;

//SOUND_VOLUME = 1;
CURRENT_PLANET = 0;
horizon = 0;

pre_volume = 1;

main_menu = START_GAME;

FADE_COLOUR = c_black;

anim1 = 0;
/*
symbols = 7;
symbol_an = 0;
symbol_go = 0;

symbol_title_an = 0;
symbol_title_an2 = 0;
symbol_title_go = 0;
symbol_fade = 16;
*/
game_start = START_GAME;
game_dialogue = START_GAME;
game_start_rm = "";
game_loadchapter = -1;
CHAPTER = 0;
TEST_ARRAY[0] = "T1";
TEST_ARRAY[1] = "T2";
//TEST_ARRAY[2] = "T3";

TEST_ARRAY2[0,0] = "T1";
TEST_ARRAY2[1,0] = "T2";
//TEST_ARRAY2[2,0] = "T3";
TEST_ARRAY2[0,1] = "T1";
TEST_ARRAY2[1,1] = "T2";
//TEST_ARRAY2[2,1] = "T3";
GAME_CHAPTER[0,0] = 0;
GAME_CHAPTER[0,1] = 0; // Praedim Arrive
GAME_CHAPTER[0,2] = 0; // Taff Boldemo
GAME_CHAPTER[0,3] = 0; // Boldemo Break
GAME_CHAPTER[0,4] = 0;
GAME_CHAPTER[0,5] = 0; // Praedim Arrive at Daipen

GAME_CHAPTER[1,0] = 0; // -
GAME_CHAPTER[1,1] = 0; // finish conversation Taff club
GAME_CHAPTER[1,2] = 0; // Enter Mex atmos
GAME_CHAPTER[1,3] = 0; // Mexulta Stronghold
GAME_CHAPTER[1,4] = 0; // Mexulta Stronghold ANIMATION
GAME_CHAPTER[1,5] = EO_SPAWN; // EO PARTS
GAME_CHAPTER[2,0] = 0; // 
GAME_CHAPTER[3,0] = 0; // Has coat
GAME_CHAPTER[3,1] = 0; // LANRIN
GAME_CHAPTER[4,0] = 0; // Matriarch

BOLDEMO_LINK[0] = 0; // MALDIS
BOLDEMO_LINK[1] = 1; // MEXULTA
BOLDEMO_LINK[2] = 0; // ARTHEK
BOLDEMO_LINK[3] = 1; // IRNEM
BOLDEMO_LINK[4] = 1; // SEPTEON
BOLDEMO_LINK[5] = 1; // QUORNEM
BOLDEMO_LINK[6] = 0; // IIEDAKAMA

file_inputnan = 0;

randomise();
/*
for(var i=0; i<symbols; i++) {
	symbol[i,0] = 0; // ANIM
	
	symbol[i,1] = 0; // tl
	symbol[i,2] = 0; // tc
	symbol[i,3] = 0; // tr
	symbol[i,4] = 0; // ml
	symbol[i,5] = 0; // mc
	symbol[i,6] = 0; // mr
	symbol[i,7] = 0; // bl
	symbol[i,8] = 0; // bc
	symbol[i,9] = 0; // br
	
	symbol[i,10] = 0; // CIRCLE
}*/

scale = 1;
globalvar fnt4;
fnt4 = font_add_sprite_ext(sFont4,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!?.\\:,/_-+=><[]",1,1);

globalvar fnt2;
fnt2 = font_add_sprite_ext(sFont2,"abcdefghijklmnopqrstuvwxyz",1,1);

globalvar fnt3;
fnt3 = font_add_sprite_ext(sFont3,chr(700)+chr(701)+chr(702)+chr(703)+chr(704)+chr(705)+chr(706)+chr(707)+"abcdefghijklmnopqrstuvwxyz0123456789!?;{}+-=:>\\_[]'*(),."+chr(708)+chr(709)+chr(710)+chr(711),0,0);

globalvar fntPTA1;
fntPTA1 = font_add_sprite_ext(sFontPtaloth1,"0123456789abcdefAB",1,0);

globalvar fnt1;
fnt1 = font_add_sprite_ext(sFont1," ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?/`.,_>-+*[]():|~=#$'ū@"+chr(700)+chr(701)+chr(702)+chr(703)+"%",1,1);

globalvar fntIIEM;
fntIIEM = font_add_sprite_ext(sFont_iiem,"abcdefghijklmnopqrstuvwxyz",1,1);

globalvar fntTHICC;
fntTHICC = font_add_sprite_ext(sFontThicc,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",1,1);

globalvar fntBIG;
fntBIG = font_add_sprite_ext(sFontBig,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",1,2 );

globalvar fnt7;
fnt7 = font_add_sprite_ext(sFont7," ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>?ū",1,1);

globalvar FONT_MAIN;
FONT_MAIN = fnt7;

globalvar FONT_MAIN_SMALL;
FONT_MAIN_SMALL = fnt1;

globalvar tick;
tick = random(1000.0000);

globalvar DIALOGUE_OPEN;
globalvar DIALOGUE_X;
globalvar DIALOGUE_Y;
globalvar DIALOGUE_ID;

DIALOGUE_OPEN = 0;
DIALOGUE_X = 0;
DIALOGUE_Y = 0;
DIALOGUE_ID = noone;

globalvar LETTERBOX;
LETTERBOX = 0;

globalvar c_iiem;
c_iiem = $4400ff;//make_colour_rgb(255,0,64);

globalvar GLITCH;
GLITCH = 0;

cam_scale = 1;
cam_scale_d = 1;

draw_set_font(FONT_MAIN);

file = ds_list_create();

reset_files();

DEBUG = "";

file_sel = 0;
file_current = "NEW_LEVEL";
file_input = 0;
file_inputn = -1;
keyboard_string = file_current;

tile_dx1 = -1;
tile_dy1 = -1;
tile_dx2 = -1;
tile_dy2 = -1;
_inover = noone;
_inovern = -1;

globalvar GRV_SPD;
GRV_SPD = 0.218;

//if !directory_exists(working_directory + "datafiles/") directory_create(working_directory + "datafiles/");

globalvar map;
globalvar tick;
globalvar tick360;
globalvar obj_list;
globalvar obj_list_size;
collide_list = ds_list_create();
globalvar c_ink;
c_ink = make_colour_rgb(16,8,32);

globalvar c_light;
c_light = make_colour_rgb(56,38,33);
globalvar CURRENTROOM;
CURRENTROOM = "";

globalvar c_blackink;
c_blackink = merge_colour(c_ink,c_black,0.5);

obj_list_size = 0;

randomize();
tick_n = random(1000);
tick360 = irandom(360);

asset_sel = -1;
asset_sel_dx = 0;
asset_sel_dy = 0;
asset_hold = 0;

globalvar ps_eo;
globalvar pem_eo;
globalvar pt_eo;
globalvar c_edgb;
globalvar c_edgbb;
globalvar c_edgbbb;
c_edgb = $ff7700;
c_edgbb = merge_colour(c_blue,c_edgb,0.5);
c_edgbbb = merge_colour(c_blue,c_edgbb,0.5);
globalvar cam_glitch;
cam_glitch = 0;

ps_eo = part_system_create();
part_system_depth(ps_eo,-1);

pem_eo = part_emitter_create(ps_eo);
pt_eo = part_type_create();
//part_type_sprite(pt_eo,sPixel,0,0,0);//////////////////////////////////////////////
part_type_life(pt_eo,120,240);
part_type_alpha3(pt_eo,1,1,0);
part_type_speed(pt_eo,0.1,0.2,-0.002,0.01);
part_type_direction(pt_eo,0,360,0.01,0.01);
part_type_blend(pt_eo,1);
part_type_colour3(pt_eo,c_aqua,c_blue,16744192);

_sp = 0;

tile_sel = ds_list_create();
tile_selx = -1;
tile_sely = -1;
_mw = 0;
_mh = 0;
min_mw = 0;
min_mh = 0;
max_mw = 0;
max_mh = 0;

/*
var mmm;
mmm=map_load("MAP");
map = mmm[0];
mw = mmm[1];
mh = mmm[2];
map_n = mmm[3];
mmm = 0;
*/
mode = 0;
tile = 0;
//tile_g[0
mid_click = 0;
mid_clickx = 0;
mid_clicky = 0;
mc_difx = 0;
mc_dify = 0;
mc_x = 0;
mc_y = 0;
in_mc = 0;
_layer_n = 1;
_layer[0] = "tFRONT_over";
_layer[1] = "tFRONT";
_layer[2] = "tFRONT_bg";
_layer[3] = "tBACK_over";
_layer[4] = "tBACK";
_layer[5] = "tBACK_bg";
asset_layer[0] = "aFRONT";
asset_layer[1] = "aBACK";
asset_layern = 0;

asset_list = 0;
asset_list[0] = ds_list_create();
asset_list[1] = ds_list_create();


fps_n = 0;
fps_n_t = 0;
fps_n_tt = 0;
map_n = 0;
var n = 0;
sel = 0;
globalvar map_id;
map_id[n,0] = "Air";
map_id[n,1] = 0;
map_id[n,2] = 0;

_ob = 0;
_ob_an = 0;
_ob_depth = 0;
max_obj = 0;
for(;;) {
	max_obj += 1;
	if !object_exists(max_obj) {max_obj-=1; break;};
}

///add_item(n,name,plural_name,weight,price,rarety,extraction);
//
globalvar ITEM;
ITEM = 0;
ITEM[0,0] = 0;

globalvar UTILITY;
UTILITY = 0;
UTILITY[0,0] = 0;
/*
add_item(0,0,4,1,30,0,0,0); // WIRE
add_item(1,0,1,0,60,0,0,0); // SCREW
add_item(2,0,10,2,120,0,0,0); // LIGHT BULB
add_item(3,0,12,2,30,0,0,0); // METAL SHEETS
add_item(4,0,8,2,30,0,0,0); // FUSE
add_item(5,0,40,3,170,0,0,0); // OZAR SHARD
add_item(6,0,18,1,100,0,3,3); // HEATSINK

add_utility(0,0,1,1,2,2,1,3,1,5,1); // TORCH
*/
/*
add_item(0,"Bauxite","Bauxite",900,0,0,0,1,0,0,0,0);
add_item(1,"Aluminium","Aluminium",700,0,0,0,0,0,0,0,0);
add_item(2,"Al. Sheets","Al. Sheets",600,0,0,0,0,1,0,0,0);
add_item(3,"Hematite","Hematite",3200,0,0,0,4,0,0,0,0);
add_item(4,"Iron","Iron",3000,0,0,0,0,0,0,0,0);
add_item(5,"Fe. Rods","Fe. Rods",2800,0,0,0,0,4,0,0,0);
add_item(6,"Malachite","Malachite",4200,0,0,0,7,0,0,0,0);
add_item(7,"Copper","Copper",4000,0,0,0,0,0,0,0,0);
add_item(8,"Cu. Wire","Cu. Wire",3800,0,0,0,0,7,0,0,0);
add_item(9,"Heatsink","Heatsinks",150,0,1,0,0,0,0,0,0);
add_item(10,"Screw","Screws",20,0,0,0,0,0,0,0,0);
add_item(11,"Inductor","Inductors",50,0,0,0,0,0,0,0,0);
add_item(12,"Circuit","Circuits",100,0,0,0,0,0,0,0,0);
add_item(13,"RAM","RAM",150,0,1,0,0,0,0,0,0);
add_item(14,"CPU","CPUs",200,0,2,0,0,0,0,0,0);
add_item(15,"GPU Card","GPU Cards",550,0,0,0,0,0,0,0,0);
add_item(16,"Processor","Processors",50,0,1,0,0,0,0,0,0);
add_item(17,"Super-CPU","Super-CPUs",300,0,2,0,0,0,0,0,0);
add_item(18,"Capacitor","Capacitors",20,0,0,0,0,0,0,0,0);
add_item(19,"Transistor","Transistors",20,0,0,0,0,0,0,0,0);
add_item(20,"Transformer","Transformers",100,0,0,0,0,0,0,0,0);
add_item(21,"Fuse","Fuses",30,0,0,0,0,0,0,0,0);
add_item(22,"Mem. Card","Mem. Cards",30,0,2,0,0,0,0,0,0);
add_item(23,"Key","Key",60,0,2,0,0,0,0,0,0);
add_item(24,"Stabiliser","Stabilisers",5,0,1,0,0,0,0,1,25);
add_item(25,"Stabilise-X","Stabilise-X",10,0,2,0,0,0,0,1,50);
//add_item(25,"Ozar Shard","Stabilise-X",10,0,2,0,0,0,0,1,50);

/*add_item(0,"Chip","Chips",100,0,0,2);
add_item(1,"CPU","CPUs",200,0,2,0);
add_item(2,"RAM","RAM",100,0,1,0);
add_item(3,"Circuit","Circuit",150,0,0,1);
add_item(4,"Capacitor","Capacitors",20,0,0,2);
add_item(5,"Heatsink","Heatsinks",150,0,0,1);
add_item(6,"Inductor","Inductors",50,0,1,2);
add_item(7,"Transformer","Transformers",100,0,1,2);
add_item(8,"Wire","Wires",50,0,0,2);
add_item(9,"Vacuum Tube","Vacuum Tubes",20,0,1,2);
add_item(10,"Metal Sheet","Metal Sheets",250,0,0,1);
add_item(11,"LED","LEDs",20,0,0,2);
add_item(12,"Bulb","Bulbs",100,0,0,0);
add_item(13,"Display","Displays",300,0,1,1);
add_item(14,"Transistor","Transistors",20,0,0,2);
add_item(15,"Optic","Optics",250,0,2,2);
add_item(16,"Screw","Screws",20,0,0,1);
add_item(17,"Mem.Card","Mem.Cards",20,0,2,0);
add_item(18,"Key","Keys",50,0,1,0);
add_item(19,"GPU Card","GPU Cards",300,0,2,0);*/

//VOLUME = (config_get("Settings","Volume",1)/100);
SOUND_VOLUME = (config_get("Settings","Volume",1)/100);
global.t_SOUND_VOLUME = -1;
global.SHAKE = (config_get("Settings","Shake",1)/100);
global.CONTROLS = round(real(config_get("Settings","Controls",1)));

global.kkl = vk_left;
global.kkr = vk_right;
global.kku = vk_up;
global.kkj = vk_space;
global.kkd = vk_down;
global.key_aenox = (ord("A"));
global.key_telarod = (ord("S"));
global.key_eo = (ord("F"));
global.key_inv = (ord("E"));

PLAYING_MUSIC[0] = -1;
PLAYING_MUSIC[1] = -1;
PLAYING_MUSIC[2] = -1;

MUSIC_ID[0] = -1; // BACKGROUND MUSIC
MUSIC_ID[1] = -1; // AMBIENCE FX
MUSIC_ID[2] = -1; // AMBIENCE BG

MUSIC[0] = -1; // BACKGROUND MUSIC
MUSIC[1] = -1; // AMBIENCE FX
MUSIC[2] = -1; // AMBIENCE BG

VOLUME = 1;
music_volume = VOLUME;

n = 1;
map_id[n,0] = "Sld Grass";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = 8388479; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 2;
map_id[n,0] = "JT Grass";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = 8388479; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 3;
map_id[n,0] = "PLACE PLAYER";
map_id[n,1] = 0; // SOLID TYPE
map_id[n,2] = c_red; // COLOUR
map_id[n,3] = 12; // height
map_id[n,4] = oPlace_Player; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 4;
map_id[n,0] = "Sld Dirt";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_orange; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 5;
map_id[n,0] = "JT Dirt";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_orange; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 6;
map_id[n,0] = "Sld Wood";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_yellow; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 7;
map_id[n,0] = "JT Wood";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_yellow; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 8;
map_id[n,0] = "Sld Stone";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_ltgray; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 9;
map_id[n,0] = "JT Stone";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_ltgray; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 10;
map_id[n,0] = "Sld Metal";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_white; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 11;
map_id[n,0] = "JT Metal";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_white; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 12;
map_id[n,0] = "Sld Sand";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_yellow; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 13;
map_id[n,0] = "JT Sand";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_yellow; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 14;
map_id[n,0] = "Sld Carpet";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_purple; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 15;
map_id[n,0] = "JT Carpet";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_purple; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 16;
map_id[n,0] = "Sld Water";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_edgb; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 17;
map_id[n,0] = "JT Water";
map_id[n,1] = 2; // SOLID TYPE
map_id[n,2] = c_edgb; // COLOUR
map_id[n,3] = 8; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 18;
map_id[n,0] = "GRAB BLOCK";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_iiem; // COLOUR
map_id[n,3] = 12; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2

n = 19;
map_id[n,0] = "IIEM";
map_id[n,1] = 1; // SOLID TYPE
map_id[n,2] = c_iiem; // COLOUR
map_id[n,3] = 16; // height
map_id[n,4] = noone; // spawned object
map_id[n,5] = 0; // DEPTH of Obj
map_id[n,6] = 16; // y2


event_user(2);