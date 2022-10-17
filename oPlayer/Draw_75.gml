/*
if keyboard_check_pressed(ord("G")) {
	death_an = 1;
	play_sound(sndBSOD_tone,100,0,1,1,0);
};
*/
if death_an==1 {
	display_set_gui_size(CW,CH);
	control = 0;
	physics = 0;
	draw = 0;
	UI_OPEN = 1;
	vsp = 0;
	hsp = 0;
	draw_set_alpha(1);
	draw_set_color($200080);
	draw_rectangle(-1,-1,CW+1,CH+1,0);

	draw_set_font(fnt3);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color($ffffff);
	var _T1 = string_n("reformatting past location",1-(death_t1/death_tA)), _T2 = string_n("restructuring connection of being in question",1-(death_t2/death_tA)), _T3 = string_n("observing existence",1-(max(death_t3-death_tA,0)/death_tA));

	draw_text_transformed(16,16,string_wordbreak(
	//string_n_glitch(
	string_lower("a problem has been detected and [redacted] has been shut down to prevent damage to the system.\n\nthe problem seems to be caused by the following file: iinenea.sys\n\npage_fault_in_nonpaged_area\n\nif this is the first time you've seen this stop error screen, restart the system. if this screen appears again, follow these steps:\n\ncheck to make sure any new hardware or software is properly installed. if this is a new installation, ask your hardware or software manufacturer for any [redacted] updates you might need.\n\nif the problems continue, disable or remove any newly installed hardware or software. disable bios memory options such as caching or shadowing. if you need to use safe mode to remove or disable components, restart the system, press f7 to select advanced startup options,and then select safe mode.\n\ntechnical information:\n\n*** stop: 0x00000007 (0x00000019, 0x00000028, 0x0000004E, 0x000000A2, 0x000000C1, 0x000000C5, 0x000000D0)\n\n"
	)//,mean(1-(death_ta/death_t),1))
	+_T1+"\n"+_T2+"\n"+_T3,((CW-16)*0.777777777)*2,0,1),0.5,0.5,0);
	
	death_ta = max(death_ta-1,0);
	if death_ta<=0 death_t1 = max(death_t1-1,0);
	if death_t1<=0 death_t2 = max(death_t2-1,0);
	if death_t2<=0 death_t3 = max(death_t3-1,0);
	
	if death_t3<=0 {
			global.D_NUMBER += irandom(77)+7;
		
			death_an = 0;
			respawn = 1;
			control = 0;
			physics = 0;
			draw = 0;
			UI_OPEN = 1;
			vsp = 0;
			hsp = 0;
			play_sound(sndDeath_respawn,10,0,1,1,1);
			alarm[7] = 100;
			create_poly(x,y,-100,7,$ff8000,0,20,0,2,mean(0.9,0.91),random(360),random_range(-10,10)/2,1);
			create_poly(x,y,-101,7,$0040ff,48,0,0,4,mean(0.95,0.91),random(360),random_range(-10,10)/2,1);
			create_poly(x,y,-102,7,$ff8000,32,0,0,1,mean(0.85,0.91),random(360),random_range(-10,10)/2,1);
			create_poly(x,y,-103,7,$0040ff,0,60,8,0,mean(0.94,0.91),random(360),random_range(-10,10)/2,1);
		
			display_set_gui_size(display_get_width(),display_get_height());
	};
};