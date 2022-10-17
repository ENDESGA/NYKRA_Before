if START_GAME exit;
game_dialogue = 1;
START_GAME = 1;

if instance_exists(oPlayer) {oPlayer.can_boldemo = !(bool(floor(real(oControl.START_GAME))));}
/*
var str = "";
var array = variable_instance_get_names(id);
show_debug_message("Variables for " + object_get_name(object_index) + string(id));
for (var i = 0; i < array_length_1d(array); i++;)
    {
    str = array[i];// + ":" + string(variable_instance_get(id, array[i]));
    show_debug_message(str);
    }*/

//create_tilesheetspaces(sTiles,16);
/*
var _SURF = surface_create(1024,1024);
var __c = 0, __r=0,__g=0,__b=0, rc=0,gc=0,bc=0, BB = 0;
surface_set_target(_SURF);

draw_clear_alpha(0,0);
for (var __i = 0; __i < 1024; __i+=2) {
    for (var __j = 0; __j < 1024; __j+=2) {
		__c = make_color_rgb(clamp(__r,0,1)*255,clamp(__g,0,1)*255,clamp(__b,0,1)*255);
	    draw_set_color(__c);
		draw_point_color(__i,__j,__c);
		draw_point_color(__i+1,__j,__c);
		draw_point_color(__i+1,__j+1,__c);
		draw_point_color(__i,__j+1,__c);
		
		if __r>(1+(1/3)) {
			__r = 0;
			gc = 1;
		}
		if __g>(1+(1/3)) {
			__g = 0;
			bc = 1;
		}
		if __b>(1+(1/3)) {
			BB = 1;
			break;
		}
		
		__r += (1/3);
		if (gc==1) {__g += (1/3); gc=0;};
		if (bc==1) {__b += (1/3); bc=0;};
	}
	if BB break;
}
surface_reset_target();
var _P = get_save_filename_ext("*.png","colours.png",working_directory,"WHERE TO SAVE THE COLOURS?")
if _P != ""
   {
   surface_save(_SURF,_P);
   }
surface_free(_SURF);



/*
draw_set_alpha(1);
draw_set_colour(c_white);
gpu_set_blendmode(bm_normal);

var _BUFF = buffer_create(1024*1024*4,buffer_fixed,1), P=0;
buffer_seek(_BUFF,buffer_seek_start,0);

var _SURF = surface_create(1024,1024);
surface_set_target(_SURF);
draw_sprite_ext(sTiles,0,0,0,1,1,0,c_white,1);
surface_reset_target();

buffer_get_surface(_BUFF,_SURF,0,0,0);
surface_set_target(_SURF);

draw_clear_alpha(0,0);
draw_set_colour($4400ff);

for (var __i = 0; __i < 64; ++__i) {
    for (var __j = 0; __j < 64; ++__j) {
	    for (var t = 0; t < 16; ++t) {
		    for (var l = 0; l < 16; ++l) {
			    P = (buffer_peek(_BUFF,(l+(t*1024)+(__j*16*1024)+(__i*16))*4,buffer_u32));// & $ffffffff);
				if P != $00000000 break;
			}
			if P != $00000000 break;
		}
		if !(P != $00000000) {
			draw_rectangle(__i*16,__j*16,((__i+1)*16)-1,((__j+1)*16)-1,0);
		};
	}
}
surface_reset_target();
surface_save(_SURF,working_directory + "/"+"NEW_TILES.png");*/