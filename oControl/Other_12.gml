if main_menu==0 {
map = 0;
asset_list_back = 0;
mw = 32;
mh = 24;
map[mw,mh] = 0;

for(var i=0; i<=mw; i++;) {
	for(var j=0; j<=mh; j++;) {
		map[@ i,j] = 0;
	};
}

for(var i=0; i<mw; i++;) {
	for(var j=0; j<mh; j++;) {
		if (j==(mh-9)) map[@ i,j] = 1;
	};
}

if game_start==0 map[@ 8,(mh-12)] = 3;
if game_start==0 instance_create_depth(8*16,(mh-12)*16,map_id[3,5],map_id[3,4]);

//oCamera.x = mw*8;
//oCamera.y = mh*8;
//oCamera.follow = noone;

}

if (!ds_exists(asset_list[0],ds_type_list)) asset_list[0] = ds_list_create();
if (!ds_exists(asset_list[1],ds_type_list)) asset_list[1] = ds_list_create();

obj_list = ds_list_create();
