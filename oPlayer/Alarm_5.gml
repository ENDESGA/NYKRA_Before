with(parDoor_Flat) {
	if n==oPlayer.door_n {
		obj_setpos(oPlayer,x,y-16);
		if instance_number(oEo)>=1 {
		obj_setpos(oEo,x,y-16);
			oEo.tx = 0;
			oEo.ty = 0;
			oEo.hsp = 0;
			oEo.vsp = 0;
		}
		fade_in = 1;
		fade = 3;
		open = 1;
		anim = 1;
		anim1 = 1;
		anim2 = 1;
		anim3 = 1;
		anim4 = 1;
		anim5 = 1;
		Clicked = 0;
	}
}