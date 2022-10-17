//draw_rectangle_view(c_black,1)

CX = camera_get_view_x(cam);
CY = camera_get_view_y(cam);
CW = camera_get_view_width(cam);
CH = camera_get_view_height(cam);
CMX = CX+(CW/2);
CMY = CY+(CH/2);
planet = CURRENT_PLANET;
if instance_number(oIs_Inside)<=0 {
	switch(planet) {
		case 0: // MALDIS
		{
			draw_set_alpha(1);
			var c = make_colour_rgb(0,170,255);
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);

			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,c_aqua,c_aqua,0);
			draw_sprite_ext(sMal_bg1,0,ccx,CY,_scale,_scale,0,c_white,1);
			draw_bg_tiled_hwave(sMal_bg2,(ccx/1.04)+((tick*1.5)*_scale),((ccy/1.04)-30)-32,_scale,_scale,c_white,1,10,-5.5);
			draw_bg_tiled_h(sMal_bg3,(ccx/1.1),((ccy/1.1)-16)-36,_scale,_scale,c_white,1);
			draw_bg_tiled_h(sMal_bg4,(ccx/1.45),((ccy/1.45)-16)-65,_scale,_scale,c_white,1);
			
			//draw_set_colour(c_iiem);
			//draw_set_alpha(1);
			//draw_text(cx+32,cy+32,string(CURRENTROOM));
			if GAME_CHAPTER[0,1]==1 {
				if CURRENTROOM=="rmMal_mush" {
					draw_sprite_ext(sPraedim_Mal,0,(mean(cx+cw,cx+cw,cx)/1.056),
					(mean(cy-(22),cy-(22)+(ch/2)))/1.055,1,1,0,c_aqua,1);
				}
				else
				if CURRENTROOM=="rmMal_4" {
					draw_sprite_ext(sPraedim_Mal,0,(mean(cx+(cw/3),cx,cx,cx)/1.056)-16,
					mean(cy-20,(cy-20)+(ch/2))/1.055,1,1,0,c_aqua,1);
				};
			}
			
		}break;
		
		case 1: // MEXULTA
		{
			draw_set_alpha(1);
			var c = make_colour_rgb(12,216,119);
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
			var _h = 0;
			if instance_number(oSET_HORIZON)>=1 _h=floor(oSET_HORIZON.y/16);
			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,c_aqua,c_aqua,0);
			draw_sprite_ext(sMex_bg1,0,ccx,mean(CY,mean(ccy-90,cy))-1,_scale,_scale,0,c_white,1);
			ccy += _h;
			draw_bg_tiled_hwave(sMex_bg2,(ccx/1.04)+((tick*1.5)*_scale),((ccy/1.04)-30)-16,_scale,_scale,c_white,1,5,-10);
			draw_bg_tiled_h(sMex_bg3,(ccx/1.1),((ccy/1.1))-36,_scale,_scale,c_white,1);
			draw_bg_tiled_h(sMex_bg4,(ccx/1.45),((ccy/1.45))-36,_scale,_scale,c_white,1);
			
			if CURRENTROOM=="rmMex_KS_pod" && instance_number(oKS_Mexescapepod)>=1 {
				var surf = surface_create(ceil(CH),ceil(CH/2));
				if surface_exists(surf) {
					surface_set_target(surf);
					draw_line_width_color(ceil(CH),-1,lerp(ceil(CH),0,oKS_Mexescapepod.anim),lerp(-1,ceil(CH/2),oKS_Mexescapepod.anim),4/2,c_ink,c_red);
					draw_circle_color(lerp(ceil(CH),0,oKS_Mexescapepod.anim),lerp(-1,ceil(CH/2),oKS_Mexescapepod.anim),2/2,c_red,c_red,0);
					draw_circle_color(lerp(ceil(CH),0,oKS_Mexescapepod.anim),lerp(-1,ceil(CH/2),oKS_Mexescapepod.anim),1/2,c_white,c_white,0);
					surface_reset_target();
					gpu_set_blendmode(bm_add);
					draw_surface(surf,CMX-(CH/2),CY-1);
					gpu_set_blendmode(bm_normal);
					surface_free(surf);
				}
				surf = -1;
			}
		}break;
		
		case 2: // ARTHEK
		{
			draw_set_alpha(1);
			
			var cy = CY+16;
			var ccy = (cy+(CH/2));
			var sclx = mean((CW/320),sqr(CW/320)), scly = mean((CH/180),sqr(CH/180));
			var _scale = mean(sclx,scly);
			
			draw_rectangle_colour(CX-1,CY-1,CX+CW+1,1+CY+CH,$085b71,$085b71,$5650ff,$5650ff,0);
			
			draw_sprite_ext(sArtIs_bg1,0,CMX,CY,_scale,_scale,0,c_white,1);
			draw_bg_tiled_hwave(sArtIs_bg2,(CMX/1.04)+((tick*-2)*_scale),((ccy/1.04)-18),_scale,_scale,c_white,0.5,5,16);
			draw_set_alpha(1/3);
			draw_rectangle_colour(CX-1,CY-1,CX+CW+1,1+CY+CH,0,0,$8080ff,$8080ff,0);
			draw_set_alpha(1);
		}break;
		
		case 3: // IRNEM
		{
			draw_set_alpha(1);
			var c = $B33A85;
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
			var _h = 0;
			if instance_number(oSET_HORIZON)>=1 _h=floor(oSET_HORIZON.y/16);
			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,c_fuchsia,c_fuchsia,0);
			draw_rectangle_view($E0AAAF,0.55);
			draw_sprite_ext(sIrn_bg1,0,ccx,CY,_scale,_scale,0,c_white,1);
			ccy += _h;
			draw_bg_tiled_hwave(sIrn_bg2,(ccx/1.04)+((tick*1.75)*_scale),((ccy/1.04)-30)-8,_scale,_scale,c_white,1,5,-10);
			draw_bg_tiled_h(sIrn_bg3,(ccx/1.1),((ccy/1.1))-36,_scale,_scale,c_white,1);
			if CURRENTROOM=="rmIrn_pillars" draw_bg_tiled_h(sIrn_bg4,(ccx/1.45),((ccy/1.45))+40,_scale,_scale,c_white,1);
		}break;
		
		case 4: // SEPTEON
		{
			draw_set_alpha(1);
			var c = $B33A85;
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
			var _h = 0;
			if instance_number(oSET_HORIZON)>=1 _h=floor(oSET_HORIZON.y/16);
			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,$00c0ff,$00c0ff,0);
			//draw_rectangle_view(c_orange,1/3);
			draw_sprite_ext(sSep_bg1,0,ccx,CY,_scale,_scale,0,c_white,1);
			//draw_rectangle_view(c_edgb,0.2);
			ccy += _h;
			draw_bg_tiled_hwave(sSep_bg2,(ccx/1.04)+((tick*1.5)*_scale),((ccy/1.04)-30)-8,_scale,_scale,c_white,1,5,-10);
			draw_bg_tiled_h(sSep_bg3,(ccx/1.1),((ccy/1.1))-36,_scale,_scale,c_white,1);
			//draw_rectangle_view($ffff80,0.1);
			//draw_rectangle_view(c_white,0.1);
			//draw_bg_tiled_h(sIrn_bg4,(ccx/1.45),((ccy/1.45))-36,_scale,_scale,c_white,1);
		}break;
		
		case 5: // QUORNEM
		{
			draw_set_alpha(1);
			var c = $731740;
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
			var _h = 0;
			if instance_number(oSET_HORIZON)>=1 _h=floor(oSET_HORIZON.y/16);
			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,$80ff00,$80ff00,0);
			//draw_rectangle_view(c_orange,1/3);
			draw_sprite_ext(sQuo_bg1,0,ccx,mean(CY,mean(ccy-90,cy))-1,_scale,_scale,0,c_white,1);
			ccy += _h;
			draw_bg_tiled_hwave(sQuo_bg2,(ccx/1.04)+((tick*1.5)*_scale),((ccy/1.04)-30)-16,_scale,_scale,c_white,1,5,-10);
			draw_bg_tiled_h(sQuo_bg3,(ccx/1.1),((ccy/1.1))-36,_scale,_scale,c_white,1);
			draw_bg_tiled_h(sQuo_bg4,(ccx/1.45),((ccy/1.45))-36,_scale,_scale,c_white,1);
		}break;
		
		case 6: // IIEDAKAMA
		{
			
			LETTERBOX = 1;
			
			var sclx = mean((CW/320),sqr(CW/320)), scly = mean((CH/180),sqr(CH/180));
			var _scale = mean(sclx,scly)*(7./9.);
			
			draw_clear_alpha(0,1);
			
			
			
			
			
			draw_rectangle_color(CX-1,CY-1,CX+CW+1,CY+(CH*2),0,0,$220077,$220077,0);
			//draw_sprite_ext(sStarsBG,0,CMX,CMY,_scale,_scale,0,$220077,1);
			
			draw_bg_tiled_hwave(sStarsBG,CMX+((tick+77.7)),CY,_scale*(7./9.)*(7./9.),_scale*(7./9.)*(7./9.),$110033,.5,8,-4);
			
			draw_sprite_ext(sIie_bg1,0,CMX,CY,_scale,_scale,0,c_white,1);
			
			draw_bg_tiled_hwave(sStarsBG,CMX+((tick+777.7)*1.5),CY,_scale*(7./9.),_scale*(7./9.),$220077,.5,8,-8);
			
			gpu_set_blendmode(bm_normal);
			
			draw_sprite_ext(sIie_bg1,1,CMX,CY,_scale,_scale,0,c_white,1);
			
			gpu_set_blendmode(bm_add);
			draw_bg_tiled_hwave(sStarsBG,CMX+((tick+7777.7)*3.),CY,_scale,_scale,$4400ff,.5,8,-16);
			
			draw_triangle_color(CMX,CY-1,CMX,CY+(_scale*75),CX,CY+(_scale*75),0,$220077,0,0);
			draw_triangle_color(CMX,CY-1,CMX,CY+(_scale*75),CX+CW,CY+(_scale*75),0,$220077,0,0);
			draw_triangle_color(CMX,CY+CH,CMX,CY+(_scale*75),CX,CY+(_scale*75),0,$220077,0,0);
			draw_triangle_color(CMX,CY+CH,CMX,CY+(_scale*75),CX+CW,CY+(_scale*75),0,$220077,0,0);
			
			gpu_set_blendmode(bm_subtract);
			draw_circle_color((CMX - 1)+.5,CY+(75*_scale),44*_scale,$aaaaaa,0,0);
			draw_circle_color((CMX - 1),CY+(75*_scale)+.5,46*_scale,$aaaaaa,0,0);
			draw_circle_color((CMX - 1)-.5,CY+(75*_scale),48*_scale,$aaaaaa,0,0);
			
			draw_bg_tiled_hwave(sMal_bg2,(CMX/1.04)+((tick*1.5)*_scale)+77.777,CMY,_scale,_scale,$221144,.25,8,-10);
			draw_bg_tiled_hwave(sMal_bg2,(CMX/1.17)+((tick*1.75)*_scale)+777.777,CMY,_scale,_scale,$442288,.25,12,-8);
			draw_bg_tiled_hwave(sMal_bg2,(CMX/1.3)+((tick*2.)*_scale)+7777.777,CMY,_scale,_scale,$4422ff,.25,16,-6);
			
			gpu_set_blendmode(bm_add);
			
			draw_rectangle_color(CX-1,CY-1,CX+CW+1,CY+(CH) + 1,0,0,$220077,$220077,0);
			draw_rectangle_color(CX-2,CY-2,CX+CW+2,CY+(CH) + 2,0,0,$220077,$220077,0);
			
			gpu_set_blendmode(bm_subtract);
			draw_circle_color((CMX - 1)+.5,CY+(75*_scale),44*_scale,$aaaaaa,0,0);
			draw_circle_color((CMX - 1),CY+(75*_scale)+.5,46*_scale,$aaaaaa,0,0);
			draw_circle_color((CMX - 1)-.5,CY+(75*_scale),48*_scale,$aaaaaa,0,0);
			
			gpu_set_blendmode(bm_normal);
		}break;
		
		case 7: // ANTARCTICA
		{
			draw_set_alpha(1);
			var c = make_colour_rgb(12,216,119);
			var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam)+16;
			var cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
			var _h = 0;
			if instance_number(oSET_HORIZON)>=1 _h=floor(oSET_HORIZON.y/16);
			var ccx = (cx+(cw/2)), ccy = (cy+(ch/2));
			var sclx = mean((cw/320),sqr(cw/320)), scly = mean((ch/180),sqr(ch/180));
			var _scale = mean(sclx,scly);

			draw_rectangle_colour(camera_get_view_x(cam),camera_get_view_y(cam),camera_get_view_x(cam)+camera_get_view_width(cam),camera_get_view_y(cam)+camera_get_view_height(cam),c,c,c_aqua,c_aqua,0);
			draw_sprite_ext(sMex_bg1,0,ccx,mean(CY,mean(ccy-90,cy))-1,_scale,_scale,0,c_white,1);
			ccy += _h;
			draw_bg_tiled_hwave(sMex_bg2,(ccx/1.04)+((tick*1.5)*_scale),((ccy/1.04)-30)-16,_scale,_scale,c_white,1,5,-10);
			draw_bg_tiled_h(sMex_bg3,(ccx/1.1),((ccy/1.1))-36,_scale,_scale,c_white,1);
			draw_bg_tiled_h(sMex_bg4,(ccx/1.45),((ccy/1.45))-36,_scale,_scale,c_white,1);
		}break;
	};
	var c = make_colour_rgb(12,216,119);
	
	if mode!=3 {
		draw_rectangle_view(c_black,0.333);
		draw_rectangle_view(c_dkgray,0.333);
		draw_rectangle_view(c_black,0.333);
	}
}
else
{
	//draw_set_colour(c_black);
	draw_set_alpha(1);
	draw_clear_alpha(mode==1?c_dkgray:c_black,1);
};