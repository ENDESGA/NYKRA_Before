collision_list = -1;
collision_list[0] = -1;
collision_list[@ 0] = -1;
for(var i=0; i<instance_number(parEntity); i++) {
	collision_list[@ i] = instance_find(parEntity,i);
};