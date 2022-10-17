
COLLIDE()

bb_setmiddle();
Xx = reach_tween(Xx,x,4);
Yy = reach_tween(Yy,y,4);

if (alive==1 && control==1 && draw==1 && oPlayer.control==1) {
	if snd_hover==-1 {
		snd_emit = audio_emitter_create();
		snd_hover = audio_play_sound_on(snd_emit,sndEO_hover,1,10);
		audio_sound_gain(snd_hover,0,0);
		//snd_hover = play_sound_pos(sndEO_hover,10,1,1,0.5,1000,x,y);
	} else {
		snd_hover_p = reach_tween(snd_hover_p,0.5+sqr(clamp(max(abs(vsp),abs(hsp))/(oPlayer.base_hsp),0,1)),7);
		audio_sound_pitch(snd_hover,mean(snd_hover_p,1));
		audio_sound_gain(snd_hover,sqr(clamp(max(abs(vsp),abs(hsp))/(oPlayer.base_hsp),0,1))/6,427);
		audio_emitter_position(snd_emit,x+hsp,y+vsp,1);
	};
} else {
	audio_sound_gain(snd_hover,0,1000);
};



