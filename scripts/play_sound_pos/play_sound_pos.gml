/// @param ID
/// @param Priority
/// @param Loops?
/// @param Pitch
/// @param Gain
/// @param GainTime
/// @param X
/// @param Y
function play_sound_pos(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	var _____b = argument1;
	var ____tsnd = audio_play_sound_at(argument0,
	mean(mean(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),argument6),argument6),
	mean(mean(camera_get_view_y(cam)+(camera_get_view_height(cam)/2),argument7),argument7),
	1,mean(100,mean(camera_get_view_width(cam),camera_get_view_height(cam))/2,),
	mean(300,mean(camera_get_view_width(cam),camera_get_view_height(cam))), 1, argument2, 10);
	audio_sound_pitch(____tsnd,argument3);
	audio_sound_gain(____tsnd,0,0);
	audio_sound_gain(____tsnd,argument4*(oControl.mode==3)*SOUND_VOLUME,argument5);
	return(____tsnd);


}
