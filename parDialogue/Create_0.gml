_ins = 0;
_ins_text = "";


dlg_name = "";
pick_random = 0;
pick_list = -1;

//instance_destroy();

/*
	dlg[ N , f ] = value;
	
trigger = 0;		// 0 - no trigger, 1 - auto trigger, 2 - distance, 3 - activate
if trigger>1 trigger_distance = 0; // distance

stop_player = 0;	// stops the player from moving
one_off = 0;		// deletes after dialogue
	
var n = -1;
	
n += 1;
dlg[n,0] = "";		// NAME
dlg[n,1] = "";		// DIALOGUE TEXT
dlg[n,2] = 1;		// ARROW TYPE  [0 - no arrow, 1 - arrow, 2 - bubbles]
dlg[n,3] = "";		// AFTER COMMAND  ['|' + s-shake, g-give]
dlg[n,4] = 0;		// CAMERA X
dlg[n,5] = 0;		// CAMERA Y
dlg[n,6] = noone;   // FOLLOW ID
dlg[n,7] = -1;		// GOTO  [-1 next, -2 quit]
	
dlg[n,8] = "";		// CHOICE 1
dlg[n,9] = "";		// CHOICE 2
dlg[n,10] = "";		// CHOICE 3
dlg[n,11] = "";		// CHOICE 4
	
dlg[n,12] = 0;		// CHOICE GOTO 1
dlg[n,13] = 0;		// CHOICE GOTO 2
dlg[n,14] = 0;		// CHOICE GOTO 3
dlg[n,15] = 0;		// CHOICE GOTO 4

*/
prev_snd = -1;
sound_once = 0;
on = 0;
t = 0;
t_tick = 1;
dlg_t = -1;
t_dlg_t = -1;
end_exit = 0;
line = 0;
dlg_anim_id = noone;
dlg_done = 0;

sound_playing = 0;
instance_following = noone;

t_on = 0;

is_choice = 0;
is_choice_an = 0;
is_choice_n = 0;
choice_n = 0;
choice_an = 0;

anim = 0;
anim1 = 0;
anim2 = 0;
interact_colour = c_aqua;
interact_arrow_h = 8;

dialogue_eo_move = 1;

alarm[0] = -1;

var n = -1;
	
n += 1;
dlg[n,0] = "";		// NAME
dlg[n,1] = "";		// DIALOGUE TEXT
dlg[n,2] = 1;		// ARROW TYPE  [0 - no arrow, 1 - arrow, 2 - bubbles]
dlg[n,3] = "";		// AFTER COMMAND  ['|' + s-shake, g-give]
dlg[n,4] = 0;		// CAMERA X
dlg[n,5] = 0;		// CAMERA Y
dlg[n,6] = noone;   // FOLLOW ID
dlg[n,7] = -1;		// GOTO  [-1 next, -2 quit]