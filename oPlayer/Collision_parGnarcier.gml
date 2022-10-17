
var pd = point_direction(x,y+8,other.x,other.y)-180;
if damage<=0 {
	GLITCH = 0;
	hsp = 0;
	vsp = 0;
	hsp = lengthdir_x(1.5,pd);
	vsp = lengthdir_y(1.5,pd);
	vsp -= 1;
	damage = 25;
	cam_shake = 1.5;
	cam_push = 1;
	cam_p_dir = pd;
	hp -= 1;
	sleep(75);
	
	play_sound_pos(choose(sndHit_Gnar1,sndHit_Gnar2,sndHit_Gnar3,sndHit_Gnar4),10,0,random_range(0.9,1.1),1,0,x,y);
	
	/*
	repeat(4) {
		with(instance_create_(mean(x,other.x)+random_range(-1.5,1.5),mean(y,other.y)+random_range(-1.5,1.5),oFx)) {
			sprite_index = sFx_2;
			image_blend = c_iiem;
			speed = ((random((2/3)+0.01)*((sprite_get_width(sprite_index)/16)/1.75)));
			direction = random(360);
			image_index = 0;
			image_speed = (0.4+random(0.5500))/1.2;
			depth = other.depth-1;
		}
	}*/
	
	repeat(3) {
		with(instance_create_depth(other.x,other.y,-31,oBolt_iiem)) {
			xd = oPlayer.x;
			yd = oPlayer.y;
			follow = oPlayer;
		}
	}
}

hsp += lengthdir_x(0.43,pd);
vsp += lengthdir_y(0.3,pd)-0.05;