function reach_tween(argument0, argument1, argument2) {

	/// @param var,goal,divider_amount
	/*
		created by SETH (@ENDESGA)
	*/
	//return(argument0+(min(abs(argument1-argument0)/argument2,abs(argument1-argument0))*sign(argument1-argument0)));
	if argument0!=argument1 return(lerp(argument0,argument1,1/argument2)) else return(argument0);



	/*
	//return (argument0+((argument0!=argument1)*(argument2*sign((argument0<argument1)-.5))));
	var ____t1t = (abs(argument1-argument0)/argument2);
	if (argument0 < argument1)
	    return min(argument0 + ____t1t, argument1); 
	else
	    return max(argument0 - ____t1t, argument1);

/* end reach_tween */
}
