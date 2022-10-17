if START_GAME==0 exit;

if room==rmIntro || game_start==1 || main_menu!=0 {event_user(1); mode=-1;}

if room==rmMAIN {
	
	load_GENERAL();
	
	game_start_rm = CURRENTROOM;
	planet = CURRENT_PLANET;
	
	if (game_start==1 || (game_start_rm!="")) {
		if game_start_rm=="" {
			map_load(working_directory + "level_data/" + "rmMal_Origin.rmlvl","rmMal_Origin");
		} else {
			mode = 3;
			file_input = 0;
		
			map_load(working_directory + "level_data/" + game_start_rm + ".rmlvl",game_start_rm);
			load_CHARACTER();
			load_CONTROL();
			_SET_SCENE();
			game_start_rm = "";
		};
		mode = 3;
		file_input = 0;
	}
	
	game_loadchapter = -1;
}

set_game_screen();
alarm[2] = 2;