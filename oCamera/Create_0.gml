follow = noone;
if instance_number(oPlayer)>=1 follow = oPlayer;

globalvar cam_shake;
globalvar cam_push;
globalvar cam_p_dir;
cam_shake = 0;
cam_push = 0;
cam_p_dir = 0;

mv = 0;
mh = 0;

mx = mouse_x;
my = mouse_y;
alarm[1] = 3;
depth = -1000;
alarm[0] = 1;
mxt = 0;
myt = 0;

cpx = 0;
cpy = 0;
xx = 0;
yy = 0;
an = 1;

move = 0;