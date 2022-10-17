
for(var t=0; t<ds_list_size(INV); t++;) {
	if ITEM[@ INV[| t],9]==1 {
		var __tp = (ds_list_find_index(MED_INV,INV[| t]));
		if __tp==-1 {
			//ds_list_add(INV,argument0);
			//ds_list_add(INV_N,argument1);
			ds_list_insert(MED_INV,0,INV[| t]);
			ds_list_insert(MED_INV_N,0,INV_N[| t]);
		}
		else
		{
			//ds_list_replace(INV_N,__tp,ds_list_find_value(INV_N,__tp)+argument1);
			var ____T = (ds_list_find_value(MED_INV_N,__tp)+INV_N[| t]);
			ds_list_delete(MED_INV,__tp);
			ds_list_delete(MED_INV_N,__tp);
			ds_list_insert(MED_INV,0,INV[| t]);
			ds_list_insert(MED_INV_N,0,____T);
		};
		inv_delete(oPlayer,t,9999);
	}
}

/*bag_weight = 0;
for(var t=0; t<ds_list_size(INV); t++;) {
	if INV[| t]>-1 && INV_N[| t]>0 {bag_weight += ITEM[INV[| t],2]*INV_N[| t];}
	else
	{
		inv_delete(id,t,9999);
	};
	
	if ITEM[@ INV[| t],9]==1 {
		var __tp = (ds_list_find_index(MED_INV,INV[| t]));
		if __tp==-1 {
			//ds_list_add(INV,argument0);
			//ds_list_add(INV_N,argument1);
			ds_list_insert(MED_INV,0,INV[| t]);
			ds_list_insert(MED_INV_N,0,INV_N[| t]);
		}
		else
		{
			//ds_list_replace(INV_N,__tp,ds_list_find_value(INV_N,__tp)+argument1);
			var ____T = (ds_list_find_value(MED_INV_N,__tp)+INV_N[| t]);
			ds_list_delete(MED_INV,__tp);
			ds_list_delete(MED_INV_N,__tp);
			ds_list_insert(MED_INV,0,INV[| t]);
			ds_list_insert(MED_INV_N,0,____T);
		};
		inv_delete(id,t,9999);
	}
	
}
//alarm[4] = 6;

