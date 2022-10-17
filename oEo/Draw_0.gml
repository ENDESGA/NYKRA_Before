
x = Xx;
y = Yy;

if alive==1 {
	//y += lengthdir_y(2,tick*77)/2;
	y -= 1;
	x -= 1;
};
//dir = point_direction(x,y,mouse_x,mouse_y);

//aim_d = point_direction(x,y,mean(x,oPlayer.x)+lengthdir_x(32,aim_point),mean(y,oPlayer.y)+lengthdir_y(32,aim_point));
//if !surface_exists(_surf) _surf=surface_create(32,32);
var _reldir = (((abs(dir+540) mod 360)+540) mod 360), __rel=1;
if _reldir>90 && _reldir<270 __rel=-1;

var rddir = dir;//(round(dir/1.6603125)*1.6603125);



if surface_exists(_surf) {
surface_set_target(_surf);
draw_clear_alpha(0,0);
if oControl.GAME_CHAPTER[1,5]==1 {
	draw_sprite_ext(sEo,0,16,16,1,__rel,rddir-(45*__rel),c_white,1);
	draw_sprite_ext(sEo,2,16-lengthdir_x(punch,rddir),16-lengthdir_y(punch,rddir),1,__rel,rddir,c_white,1);
	draw_sprite_ext(sEo,3,16,16,1,__rel,rddir,c_white,1);
}
draw_sprite(sEo,1,16,16);
surface_reset_target();
} else _surf=surface_create(32,32);
if surface_exists(_surf) draw_surface_ext(_surf,(x-15),(y-15),1,1,0,c_white,draw);
//surface_free(_surf);
//_surf = 0;
draw_set_alpha(1);
gpu_set_blendmode(bm_add);
draw_circle_color(x,(y),8+lengthdir_x(1,tick*77),merge_colour(c_black,merge_colour(c_edgbbb,c_black,0.666),1-fade_in),c_black,0);
draw_circle_color(x,(y),2.5+lengthdir_x(0.5,tick*123),merge_colour(c_black,merge_colour(c_edgbbb,c_black,0.666),1-fade_in),c_black,0);
//draw_sprite_ext(sEo_Glow,2,oEo.x,(oEo.y),1,1,0,merge_colour(c_edgbbb,c_black,0.666),1);
//draw_sprite_ext(sEo_Glow,3,oEo.x,(oEo.y),1,1,0,merge_colour(c_edgbbb,c_black,0.666),1);

if 1==0 && ui_open==0 {
	var _pox = (mean(x,oPlayer.x,oPlayer.x)+lengthdir_x(40,aim_point)), _poy = (mean(y,oPlayer.y,oPlayer.y-4)+lengthdir_y(40,aim_point));
	_poxx = reach(_poxx,_pox,abs(_pox-_poxx)/pi);
	_poyy = reach(_poyy,_poy,abs(_poy-_poyy)/pi);
	draw_sprite_ext(sEo_pointer,0,_poxx,_poyy,1,1,0,merge_colour(c_edgb,c_blue,0.5),1);
	var pd = point_direction(_poxx,_poyy,x,y);
	draw_sprite_ext(sEo_pointer,1,_poxx+lengthdir_x(0.5,pd+135)+0.5,_poyy+lengthdir_y(0.5,pd+135)+0.5,1,1,pd,merge_colour(c_edgb,c_aqua,0.5),1);
}

//if round(abs(oPlayer.hsp))>0 || round(abs(oPlayer.vsp))>0 ui_open=0;

gpu_set_blendmode(bm_normal);

//draw_circle_colour(x,y,4,c_red,c_red,0);