//window_set_fullscreen(config_get("Settings","Fullscreen",1));
//game_set_speed(60,gamespeed_fps);
//window_set_fullscreen(config_get("Settings","Fullscreen",1));

//ds_list_clear(file)

//event_user(0);

window_set_position((display_get_width()/2)-(window_get_width()/2),(display_get_height()/2)-(window_get_height()/2));
window_center();

set_game_screen();
alarm[2] = 2;

//event_user(2);


//if room==rmIntro || game_start==1 || main_menu!=0 {event_user(1); mode=-1;}

//window_set_fullscreen(config_get("Settings","Fullscreen",1));
//display_reset(0,1);

//working_directory + "/"+CURRENTROOM+".SAVE"