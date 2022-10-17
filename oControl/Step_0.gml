if( chmusic_n == 0 ) {
	oControl.MUSIC[0] = 0;
	
	switch( oControl.CHAPTER) {
			case 1:
			chmusic_id = play_sound(sndMCh_Origin,10,0,1,1/7.777777,0);
			break;
			
			case 2:
			chmusic_id = play_sound(sndMCh_Confusion,10,0,1,1/7.777777,0);
			break;
			
			case 3:
			chmusic_id = play_sound(sndMCh_Isolation,10,0,1,1/7.777777,0);
			break;
			
			case 4:
			chmusic_id = play_sound(sndMCh_Discovery,10,0,1,1/7.777777,0);
			break;
			
			case 5:
			chmusic_id = play_sound(sndMCh_Purpose,10,0,1,1/7.777777,0);
			break;
			
			case 6:
			chmusic_id = play_sound(sndMCh_Truth,10,0,1,1/7.777777,0);
			break;
			
			case 7:
			chmusic_id = play_sound(sndMCh_Reality,10,0,1,1/7.777777,0);
			break;
			
		}
	chmusic_n = -1;
} else {
	if(!audio_group_is_loaded(MUSIC_GROUP)) audio_group_load(MUSIC_GROUP);
	chmusic_n--;
}

if( chmusic_id != -1) {
	oControl.MUSIC[0] = 0;
	if( !audio_is_playing(chmusic_id) ) {
		chmusic = -1;
		chmusic_id = -1;
		_SET_SCENE();
	}
}