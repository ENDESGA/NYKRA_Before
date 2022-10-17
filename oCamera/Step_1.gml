/*if oControl.mode!=3 && alarm[1]<=0 {
	if oControl.file_input==0 {
		mh += ((keyboard_check(ord("D"))-keyboard_check(ord("A")))/mean(2,pi))/2.28535;
		mv += ((keyboard_check(ord("S"))-keyboard_check(ord("W")))/mean(2,pi))/2.28535;
	}
	follow = noone;
	if mouse_check_button(mb_middle) && !(oControl.mode==1 && oControl.in_mc==1) {
		mh -= (mouse_x-mx)/8;
		mv -= (mouse_y-my)/8;
	}
}
else
if follow!=-2 && instance_number(oPlayer)>=1 && oControl.START_GAME==0 {
	follow = oPlayer;
	mh += ((keyboard_check(ord("K"))-keyboard_check(ord("H")))/mean(7,pi))/7;
	mv += ((keyboard_check(ord("J"))-keyboard_check(ord("U")))/mean(7,pi))/7;
};