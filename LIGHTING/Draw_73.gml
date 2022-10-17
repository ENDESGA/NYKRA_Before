if g=1 {
	if instance_number(oLIGHTING_moonglow)>=1 COLOUR = merge_colour(c_black,c_edgbb,0.5);
var cx = round(camera_get_view_x(cam)-2), cy = round(camera_get_view_y(cam)-2), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
if oControl.mode==3 {
if !surface_exists(surf)  surf = surface_create(cw+6,ch+6);
if surface_exists(surf) {
	draw_set_alpha(1);
	draw_set_colour(c_black);
	surface_set_target(surf);
	draw_clear_alpha(c_black,1);
	var blend = bm_add;
	//draw_clear_alpha(merge_colour(c_black,merge_colour(c_ink,make_colour_rgb(15,15,51),0.5),0.5),1);
	draw_ellipse_color(0,0,cw,ch,COLOUR,c_black,0);
	gpu_set_blendmode(blend);
	draw_ellipse_color(0,0,cw,ch,COLOUR,c_black,0);
	//gpu_set_blendmode(bm_add);
	gpu_set_blendmode(bm_normal);
	draw_clear_alpha(c_black,1/3);
	//draw_clear_alpha(c_black,0.5);
	//gpu_set_blendmode(bm_add);
	
	if instance_number(oKS_arthek_train1)>=1 {
		draw_clear_alpha(c_black,1);
		draw_rectangle_color(-2,-2,CW+2,CH*(2/3),c_white,c_white,c_black,c_black,0);
		with(oKS_arthek_train1) {
		draw_rectangle(-2,-2,lerp(CW+4,-16,1-sqrt(anim3)),CH+4,0);
		draw_rectangle(CW+4,-2,lerp(CW+4,-16,1-sqrt(anim6)),CH+4,0);
		}
	}
	
	if instance_number(oDarken)>=1 {
		draw_set_alpha(1);
		draw_rectangle_color(-2,-2,CW+2,CH+2,c_black,c_black,c_black,c_black,0);
		draw_clear_alpha(c_black,1);
	}
	
	gpu_set_blendmode(blend);
	if instance_number(oArt_daipen_praedim)>=1 {
		with(oArt_daipen_praedim) {
			draw_sprite_ext(sArt_daipen_praedim,1,x-cx,y-cy,1,1,0,make_colour_rgb(128,255,255),1);
		}
	}
	if instance_number(oLIGHTING_darken)>=1 {
		gpu_set_blendmode(bm_normal);
		with(oLIGHTING_darken) {
			draw_set_alpha(1);
			draw_set_colour(c_black);
			draw_rectangle(x-cx,y-cy,(x+w)-cx,(y+h)-cy,0);
			//gpu_set_fog(1,c_black,1,1);
			//var lay_id = layer_get_id("tBack");
			//var map_id = layer_tilemap_get_id(lay_id);
			//draw_tilemap(map_id, 0, 0);
			//gpu_set_fog(0,0,0,0);
			//draw_tilemap()
		}
		gpu_set_blendmode(blend);
	}
	
	if instance_number(oArt_daipen_lights)>=1 {
		with(oArt_daipen_lights) {
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,image_yscale,0,merge_colour(c_black,col,an),an);
			draw_sprite_ext(spr,0,x-cx,y-cy,0.75,0.75,ang,merge_colour(c_black,col,an),an);
		}
	}
if instance_exists(oPlayer) {//&& oPlayer.draw!=0 {
	draw_ellipse_color(0,0,cw,ch,merge_colour(c_black,COLOUR,2/3),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,32,merge_colour(c_black,merge_colour(c_white,c_orange,0.55),0.085/1.75),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,59.6789,merge_colour(c_black,merge_colour(c_white,c_orange,0.55),0.085/1.75),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,17.54,merge_colour(c_black,merge_colour(c_white,c_orange,0.666),0.1/1.75),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,69.6789,merge_colour(c_black,merge_colour(c_white,c_orange,0.55),0.085/1.75),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,82.6789,merge_colour(c_black,merge_colour(c_white,c_orange,0.55),0.085/1.75),c_black,0);
	draw_circle_colour(oPlayer.x-cx,oPlayer.y-cy,86.6789,merge_colour(c_black,merge_colour(c_white,c_orange,0.75),0.0875/1.75),c_black,0);
	if oPlayer.tool == 1 && oPlayer.tool_on_an>0 {
		draw_circle_colour((oPlayer.x+(oPlayer.facing*8))-cx,(oPlayer.y)-cy,(36+random(2.500))*oPlayer.tool_on_an,merge_colour(c_black,c_orange,oPlayer.tool_on_an),c_black,0);
		draw_circle_colour((oPlayer.x+(oPlayer.facing*8))-cx,(oPlayer.y)-cy,(59+random(2.500))*oPlayer.tool_on_an,merge_colour(c_black,c_maroon,oPlayer.tool_on_an),c_black,0);
	}
	if oPlayer.aenox_an>1.75 && oPlayer.aenox_an<5.5 {
		draw_circle_color((oPlayer.x+(9*oPlayer.facing)+random_range(-0.5,0.5))-cx,(oPlayer.y-6+random_range(-0.5,0.5))-cy,32+random_range(-0.5,3),c_edgb,c_black,0);
	}
}

	if instance_number(oDarken)>=1 {
		gpu_set_blendmode(bm_normal);
		if instance_number(oDarken)>=1 {
			draw_set_alpha(0.5);
			draw_rectangle_color(-2,-2,CW+2,CH+2,c_black,c_black,c_black,c_black,0);
			draw_clear_alpha(c_black,0.5);
		}
		gpu_set_blendmode(bm_normal);
	};
	draw_set_alpha(1);
	gpu_set_blendmode(blend);
	if instance_number(oEo)>=1 {
		draw_circle_colour(oEo.x-cx,oEo.y-cy,48,merge_colour(c_black,c_edgb,1-oEo.fade_in),c_black,0);
		if oControl.GAME_CHAPTER[1,5]==1 draw_circle_colour(oEo.x-cx,oEo.y-cy,16,merge_colour(c_black,$ffff00,1-oEo.fade_in),c_black,0);
	};
	
	if instance_number(oLight_Glow)>=1 {
		with(oLight_Glow) {
			draw_circle_colour(x-cx,y-cy,64,c_white,c_black,0);
		}
	}
	
	if instance_number(parSIGN)>=1 {
		with(parSIGN) {
			if single==0 {
			draw_sprite(sprite_index,floor(frame),(x-cx),(y-cy));
			draw_sprite(sprite_index,floor(frame+2),(x-cx),(y-cy));
			//draw_sprite(sprite_index,image_index,(x-cx)+0.25,(y-cy));
			//draw_sprite(sprite_index,image_index,(x-cx)-0.25,(y-cy));
			//draw_sprite(sprite_index,image_index,(x-cx),(y-cy)+0.25);
			//draw_sprite(sprite_index,image_index,(x-cx),(y-cy)-0.25);
			}
			else
			draw_sprite(sprite_index,1,(x-cx),(y-cy));
		}
	}
	
	if instance_number(parLED_SIGN)>=1 {
		with(parLED_SIGN) {
			draw_set_colour(COLOUR);
			draw_rectangle(x-cx,y-cy,(x-cx)+width+1,(y-cy)+sprite_height-1,0);
			draw_ellipse_color((x-cx)-20,(y-cy)-16,(x-cx)+width+21,(y-cy)+sprite_height+15,COLOUR,c_black,0);
			draw_ellipse_color((x-cx)-19,(y-cy)-15,(x-cx)+width+20,(y-cy)+sprite_height+14,COLOUR,c_black,0);
		}
	}
	//draw_ellipse_color(x-16,y-28,x+16,y+28,c_fuchsia,c_black,0);
	
	if instance_number(oMex_flatlightpurp)>=1 {
		with(oMex_flatlightpurp) {
			draw_ellipse_color((x-24)-cx,(y-36)-cy,(x+24)-cx,(y+36)-cy,c_fuchsia,c_black,0);
			draw_circle_color(x-cx,y-cy,80,merge_colour(c_black,c_fuchsia,0.75),c_black,0);
		}
	}
	
	if instance_number(oFx_Spark)>=1 {
		with(oFx_Spark) {
			draw_circle_color((x-cx),(y-cy),(min(speed/2,1)*16)+random_range(-1,1),merge_color(c_black,merge_color(colour1,colour2,0.5),min(speed,1)/2),c_black,0);
			draw_circle_color((x-cx),(y-cy),((min(speed/2,1)*16)+random_range(-1,1))*2.5,merge_color(c_black,merge_color(colour1,colour2,0.5),min(speed,1)/4),c_black,0);
		}
	}
	
	if instance_number(oEo_Chamber)>=1 {
		with(oEo_Chamber) {
			if draw_keu {
			draw_set_color($ffff00);
			draw_set_alpha((1-anim1)*anim4);
			draw_rectangle(
			(CX-2)-cx,((y+0.5)-(easing(28,1-anim3,0,1,1)*21*(1-anim2)))-cy,
			(CX+CW+2)-cx,(y+(easing(28,1-anim3,0,1,1)*21*(1-anim2)))-cy,0);
			draw_set_alpha(1-anim4);
			var glmt = clamp(((anim16-7)/7),0,1);
			draw_circle_color(glm+(x-cx),(glm*1.5)+(y-cy),32.2*(anim5/3),merge_colour($ffff00,c_black,clamp((1-anim5)+glmt,0,1)),c_black,0);
			draw_circle_color(glm+(x-cx),(glm*1.5)+(y-cy),80.1*(anim5/3),merge_colour($ff0000,c_black,clamp((1-anim5)+glmt,0,1)),c_black,0);
			draw_set_alpha(1-anim9);
			draw_set_color(make_colour_rgb(0,sqr(1-sqrt(anim9))*255,sqrt(1-sqr(anim9))*255));
			draw_rectangle(-1,-1,cw+5,ch+5,0);
			draw_set_alpha(1);
			};
		}
	}
	/*
	if instance_exists(oPlayer) {
		if oPlayer.holding_eo==1 {
			var eoLx, eoLy;
			eoLx = oPlayer.x+(oPlayer.facing*5);
			eoLy = oPlayer.y-2;
	
			draw_circle_color((eoLx-cx),(eoLy-cy),32.2,$ffff00,c_black,0);
			draw_circle_color((eoLx-cx),(eoLy-cy),80.1,$ff0000,c_black,0);
		};
	};*/
	
	if instance_number(oIiem_Mal)>=1 {
		with(oIiem_Mal) {
			draw_sprite_ext(sIiem_Mal,2,(x+iiem_shake())-cx,(y+iiem_shake())-cy,1,1,0,merge_color(c_black,c_white,lerp_bounce(anim1)),anim1);
			draw_sprite_ext(sIiem_Mal,2,(x+iiem_shake()+0.5)-cx,(y+iiem_shake())-cy,1,1,0,merge_color(c_black,c_white,lerp_bounce(anim1)),anim1);
			draw_sprite_ext(sIiem_Mal,2,(x+iiem_shake()-0.5)-cx,(y+iiem_shake())-cy,1,1,0,merge_color(c_black,c_white,lerp_bounce(anim1)),anim1);
			draw_sprite_ext(sIiem_Mal,2,(x+iiem_shake())-cx,(y+iiem_shake()+0.5)-cy,1,1,0,merge_color(c_black,c_white,lerp_bounce(anim1)),anim1);
			draw_sprite_ext(sIiem_Mal,2,(x+iiem_shake())-cx,(y+iiem_shake()-0.5)-cy,1,1,0,merge_color(c_black,c_white,lerp_bounce(anim1)),anim1);
			draw_circle_color(x-cx,(y-40)-cy,80*mean(1,anim1),merge_colour(c_black,c_iiem,anim1),c_black,0);
			draw_circle_color(x-cx,(y-40)-cy,256*mean(1,anim1),merge_colour(c_black,c_iiem,anim1),c_black,0);
		}
	}
	
	if instance_number(oConsole_Puzzle1)>=1 {
		with(oConsole_Puzzle1) {
			draw_circle_colour((x-cx)-1,(y-cy)-7,32,merge_colour(c_black,c_aqua,min(1,lerp_bounce(anim)+screen)),c_black,0);
		}
	}
	
	if instance_number(oFire_s)>=1 {
		with(oFire_s) {
			draw_circle_colour((x-cx),(y-cy),sqr(3.5+iiem_shake()+lengthdir_x(1,xstart+ystart+(tick*20)+image_index+R)),merge_colour(merge_colour(c_maroon,$0040ff,0.5+lengthdir_y(0.5,(tick*10)+R)),c_black,0.5),c_black,0);
			draw_sprite_ext(sprite_index,image_index,(x-cx),(y-cy),1,1,0,c_orange,1);
			draw_circle_colour((x-cx),(y-cy),(10.25+iiem_shake()+lengthdir_y(1,xstart+ystart+(tick*30)+image_index+R)),c_orange,c_black,0);
			draw_circle_colour((x-cx),(y-cy),sqr(8+iiem_shake()+lengthdir_y(1,xstart+ystart+(tick*20)+image_index+R)),merge_colour(merge_colour(c_maroon,$0040ff,0.5+lengthdir_x(0.5,(tick*10)+R)),c_black,0.5),c_black,0);
		}
	}
	
	with(oOosa_main) {
		draw_rectangle_colour((x-182)-cx,(y-1)-cy,(x+182)-cx,(y+145.5)-cy,$c0ff00,$c0ff00,0,0,0);
	};
	
	with(oOosa_floorpinkL) {
		if (n!=noone) draw_rectangle_colour((x-1)-cx,(y+1)-cy,(nx)-cx,(y-17.5)-cy,0,0,$ff00ff,$ff00ff,0);
	};
	
	if instance_number(oMex_button)>=1 {
		with(oMex_button) {
			draw_circle_colour((x-cx),(y-cy)+6.5,48,merge_colour(c_black,c_fuchsia,anim2),c_black,0);
			draw_circle_colour((x-cx),(y-cy)-7.5,16,merge_colour(c_black,c_fuchsia,1-anim2),c_black,0);
		}
	}
	
	if instance_number(oPrae_escapepodinside)>=1 {
		with(oPrae_escapepodinside) {
			if oControl.GAME_CHAPTER[1,2]!=0 && anim>0 {
				draw_sprite_ext(sprite_index,11,x-cx,(y+((1-anim)*13.5))-cy,1,anim,0,c_white,1);
				draw_circle_color(x-cx,y-cy,64*anim,merge_colour(c_black,c_white,anim),c_black,0);
			}
		}
	}
	
	if instance_number(oGlow)>=1 {
		with(oGlow) {
			if spot==0 {
				draw_circle_colour(x-cx,y-cy,(r*1.2)+lengthdir_x(2,(tick*77)+r+c+x+y),c,c_black,0);
			}
			else
			{
				draw_ellipse_colour(((x-cx)-r)-4,(y-cy)-4,((xf-cx)+r)+4,(yf-cy)+4,c,c_black,0);
			}
		}
	}
	
	if instance_number(oWire)>=1 {
		with(oWire) {
			draw_circle_colour(x-cx,y-cy,16*anim,merge_colour(c_black,merge_colour(c_blue,merge_colour(c_aqua,c_edgb,0.5),anim),sqrt(anim)),c_black,0);
		}
	}
	
	if instance_number(parMex_button)>=1 {
		with(parMex_button) {
			draw_circle_colour(x-cx,(y-cy)-7,32*(1-anim2),merge_colour(c_black,c_fuchsia,1-anim2),c_black,0);
		}
	}
	
	if instance_number(oPta)>=1 {
		with(oPta) {
			draw_circle_colour(x-cx,(y-cy)+lengthdir_y(1,tick*123),66+(random_range(-2,2)/2),merge_colour(c_black,c_orange,disappear),c_black,0);
			draw_circle_colour(x-cx,(y-cy)+lengthdir_y(1,tick*123),50+(random_range(-2,2)/2),merge_colour(c_black,c_yellow,disappear),c_black,0);
		}
	}
	
	if instance_number(oHeavybox_s)>=1 {
		with(oHeavybox_s) {
			//draw_sprite_ext(sprite_index,2,x-cx+0.1,y-cy+0.1,1,1,0,c_aqua,anim1/2);
			draw_circle_colour(x-cx-1.75,y-cy+0.1,30,merge_colour(c_black,c_edgbb,anim1),c_black,0);
			draw_circle_colour(x-cx-3.5,y-cy+0.1,11.111,merge_colour(c_black,merge_colour(c_aqua,c_edgb,0.5),anim1),c_black,0);
			draw_circle_colour(x-cx-2.25,y-cy+0.1,20,merge_colour(c_black,c_edgbbb,(anim1)/2),c_black,0);
		}
	}
	
	if instance_number(oHeptagate)>=1 {
		with(oHeptagate) {
			draw_circle_colour(x-cx,y-cy,64,$40ffff,c_black,0);
			draw_circle_colour(x-cx,y-cy,80,$40ffff,c_black,0);
			draw_circle_colour(x-cx,y-cy,96,$40ffff,c_black,0);
		}
	}
	
	if instance_number(oInput1)>=1 {
		with(oInput1) {
			draw_circle_colour((x-2.5)-cx,(y+5)-cy,32,merge_colour($ff7700,c_black,in),c_black,0);
		}
	}
	
	if instance_number(oANNULUM)>=1 {
		with(oANNULUM) {
			var C = merge_colour($ff7208,c_black,anim2);
			draw_circle_colour(xx-cx,yy-cy,120,C,c_black,0);
			draw_circle_colour(mean(x-cx,xx-cx),mean(y-cy,yy-cy),100,C,c_black,0);
			draw_circle_colour(x-cx,y-cy,80,C,c_black,0);
		}
	}
	
	if instance_number(oVEN_TEMP)>=1 {
		with(oVEN_TEMP) {
			var C = merge_colour($ffff02,c_black,anim2);
			draw_circle_colour(x-cx,y-cy,40,C,c_black,0);
			draw_circle_colour(x-cx,y-cy,80,C,c_black,0);
			draw_circle_colour(x-cx,y-cy,120,C,c_black,0);
		}
	}

	if instance_number(oGlow_fade_toleft)>=1 {
		with(oGlow_fade_toleft) {
			draw_rectangle_color(((x-cx)-371.54)+lengthdir_x(12.345,tick*31),-2,x-cx,ch+2,c_black,c_white,c_white,c_black,0);
		}
	}
	
	if instance_number(oGlow_fade_aqua_toright)>=1 {
		with(oGlow_fade_aqua_toright) {
			draw_rectangle_color(x-cx,-2,((x-cx)+371.54)+lengthdir_x(12.345,tick*31),ch+2,c_aqua,c_black,c_black,c_aqua,0);
		}
	}
	
	if instance_number(oFx)>=1 {
		with(oFx) {
			if glow draw_circle_color(x-cx,y-cy,(sprite_width+1.25)*1.1,merge_colour(c_black,image_blend,sqrt(1-(image_index/image_number))*0.9),c_black,0);
		}
	}

	if instance_number(oWeight_Plate)>=1 {
		with(oWeight_Plate) {
			var _i = (360/7);
			for(var i=0; i<7; i++) {
				draw_circle_colour((xstart+hrnd(lengthdir_x(4,-(i*_i)+90))-1)-cx,((ystart+7.5)+hrnd(lengthdir_y(4,-(i*_i)+90)))-cy,8*(clamp((anim*7)-i,0,1)),merge_colour(c_black,merge_colour(c_blue,c_edgb,(clamp((anim*7)-i,0,1))),(clamp((anim*7)-i,0,1))),c_black,0);
			}
		}
	}
	
	if instance_number(oKIKAROK)>=1 {
		with(oKIKAROK) {
			if eye_anim>0 {
				draw_sprite(sprite_index,1,round(x+lengthdir_x(2*eye_anim,point_direction(x,y-4,oPlayer.x,oPlayer.y-8)))-cx,round(y+lengthdir_y(2*eye_anim,point_direction(x,y-4,oPlayer.x,oPlayer.y-8)))-cy);
			} else draw_sprite(sprite_index,1,x-cx,y-cy);
			draw_circle_color(x-cx,(y-4)-cy,20,c_fuchsia,c_black,0);
		}
	}
	
	if instance_number(oKS_blizzard)>=1 {
		with(oKS_blizzard) {
			draw_sprite_ext(sLight_glow3,0,(x-cx)+5,(y-cy)-19,0.5,1,90,$304000,1);
			draw_sprite_ext(sLight_glow3,0,(x-cx)-4,(y-cy)-19,0.5,1,90,$608000,1);
		};
	};
	
	if instance_number(oMex_FloorGlow)>=1 {
		with(oMex_FloorGlow) {
			var _A = sqr(clamp(lengthdir_x(0.5,(tick*-100)+(x*3)),0,0.5)*2)*anim;
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,1,0,merge_colour(c_black,c_white,_A),1);
			draw_circle_color((x+8)-cx,(y+3.5)-cy,32,merge_colour(c_black,$0040bf,_A),c_black,0);
			if instance_number(oMex_S_BG)>=1 {
				image_alpha = anim;
				if image_alpha<=0 instance_destroy();
				if oMex_S_BG.anim==1 {
					anim *= 0.95;
				};
			};
		}
	}

	if instance_number(parGlow_Beam)>=1 {
		with(parGlow_Beam) {
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex_colour(floor(sx1-cx),round(sy1-cy),c_black,1);
			draw_vertex_colour(floor(fx1-cx),round(fy1-cy),c_black,1);
			draw_vertex_colour(round(sxm-cx),round(sym-cy),c_white,1);
			draw_vertex_colour(round(fxm-cx),round(fym-cy),c_black,1);
			draw_vertex_colour(floor(sx2-cx),round(sy2-cy),c_black,1);
			draw_vertex_colour(floor(fx2-cx),round(fy2-cy),c_black,1);
			draw_primitive_end();
		}
	}
	//(mean(CX+(CW/2),xstart)-(CW/2))+64,(mean(CY+(CH/2),ystart)+(CH/2)+100)-(anim3*(CH+200)
	if instance_number(oMex_Elevator_Wires)>=1 {
		with(oMex_Elevator_Wires) {
			draw_sprite_ext(sLight_glow3,0,
			((mean(CX+(CW/2),xstart)+(CW/2))+80)-cx,
			((mean(CY+(CH/2),ystart)+(CH/2)+200)-(clamp((anim3*2)-0.5,-0.25,1)*(CH+400)))-cy
			,1,2.5,-90,$80ff80,1);
		}
	}
	
	with(oIrnem_elevator) {
		draw_circle_colour(x-cx,(y1+1)-cy,32,merge_colour(0,$800080,lerp_bounce(light_glow)),0,0);
		draw_circle_colour(mean(x1,x)-cx,(y1+1)-cy,32,merge_colour(0,$800080,lerp_bounce(light_glow)),0,0);
		draw_circle_colour(mean(x2,x)-cx,(y1+1)-cy,32,merge_colour(0,$800080,lerp_bounce(light_glow)),0,0);
		draw_circle_colour(x-cx,(y-33)-cy,16,$80ff00,0,0);
		draw_circle_colour(x-cx,(y-25)-cy,16,$80ff00,0,0);
	};
	
	with(oQuo_lightstand) {
		if on draw_sprite_ext(sLight_glow3,0,x-cx,y-cy,0.5/2,-1/2,0,merge_colour(c_black,$c0ff00,anim2),1);
	};
	
	with(oQuo_lightstanddim) {
		if on draw_sprite_ext(sLight_glow3,0,x-cx,y-cy,0.5/2,-1/2,0,merge_colour(c_black,$c0ff00,anim2/2),1);
	};
	
	with(oMoriiem_Comp) {
		if on draw_sprite_ext(sMoriiem_Comp,2,x-cx,y-cy,1,1,0,merge_colour(c_black,$80ff00,anim2),1);
	};
	
	if instance_number(oPowered_light)>=1 {
		with(oPowered_light) {
			draw_sprite_ext(sLight_glow1,0,x-cx,(y+30)-cy,0.55,0.5,0,c_red,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_circle_colour(x-cx,(y+30)-cy,24+lengthdir_x(1,tick*123),merge_colour(c_black,merge_colour(c_yellow,c_orange,0.5),easing(28,anim,0,1,1)),c_black,0);
			draw_sprite_ext(sLight_glow1,0,x-cx,(y+30)-cy,0.8,0.75,0,merge_colour(c_red,c_orange,0.333),(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_sprite_ext(sLight_glow1,0,x-cx,(y+30)-cy,0.55,0.5,0,c_orange,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
		}
	}
	//oPrae_escapepod
	if instance_number(oPrae_escapepod)>=1 {
		with(oPrae_escapepod) {
			draw_sprite_ext(sPrae_escapepod,5,x-cx,y-cy,1,1,0,((locked!=0)?(c_iiem):(c_aqua)),1);
		}
	}
	
	if instance_number(parSpotlight)>=1 {
		with(parSpotlight) {
			draw_sprite_ext(sprite_index,image_index,x-cx,y-cy,image_xscale,image_yscale,0,image_blend,image_alpha);
		}
	}
	
	if instance_number(parMex_Hologram)>=1 {
		with(parMex_Hologram) {
			if surface_exists(surf) {
				draw_surface(surf,(x-20)-cx,(y-35)-cy);
				draw_circle_color(x-cx,y-cy,80,merge_color(c_aqua,c_black,anim),c_black,0);
			};
		}
	}
	
	if instance_number(oMex_VenPuzzleMAIN)>=1 {
		with(oMex_VenPuzzleMAIN) {
			draw_circle_color(x-cx,y-cy,10,$8000ff,c_black,0);
			draw_circle_color((x+16)-cx,y-cy,10,$8000ff,c_black,0);
			draw_circle_color((x+32)-cx,y-cy,10,$8000ff,c_black,0);
			
			draw_circle_color(x-cx,(y-16.5)-cy,28,$ff8000,c_black,0);
			draw_circle_color((x+16)-cx,(y-16.5)-cy,28,$ff8000,c_black,0);
			draw_circle_color((x+32)-cx,(y-16.5)-cy,28,$ff8000,c_black,0);
		}
	}
	
	with(oRope_lightBlue) {
		draw_circle_color(x-cx,(y-cy)+11,8+lengthdir_x(1,(tick*77.777)+(x+x+y+y)),$ffc000,c_black,0);
		draw_circle_color(x-cx,(y-cy)+11,32+lengthdir_x(2,(tick*38.888)+(x+x+y+y)),$802000,c_black,0);
	};
	
	if instance_number(oMex_HoloPuzzle1)>=1 {
		with(oMex_HoloPuzzle1) {
			if surface_exists(surf) {
				draw_surface(surf,(x-5)-cx,(y-14)-cy);
				draw_circle_color(x-cx,y-cy,80,merge_color(c_aqua,c_black,anim),c_black,0);
			};
		}
	}
	
	if instance_number(oMex_HoloPuzzle2)>=1 {
		with(oMex_HoloPuzzle2) {
			if surface_exists(surf) {
				draw_surface_ext(surf,(x+14)-cx,(y-4)-cy,1,1,-90,c_white,1);
				draw_circle_color(x-cx,y-cy,80,merge_color(c_aqua,c_black,anim),c_black,0);
			};
		}
	}
	
	if instance_number(oPowered_light_fluro)>=1 {
		with(oPowered_light_fluro) {
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,0.55,0.5,0,merge_colour(merge_colour(c_white,c_purple,0.5),c_aqua,0.5),(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_circle_colour(x-cx,(y+30)-cy,32+lengthdir_x(1,tick*123),merge_colour(c_black,merge_colour(merge_colour(c_white,c_purple,0.5),c_aqua,0.5),easing(28,anim,0,1,1)),c_black,0);
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.6666666,1,0,c_edgbbb,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.25,0.75,0,c_edgb,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
		}
	}
	
	if instance_number(oPowered_light_daipenfancy)>=1 {
		with(oPowered_light_daipenfancy) {
			draw_circle_colour(x-cx,(y+41)-cy,128+lengthdir_x(1,tick*123),merge_colour(c_black,merge_colour(merge_colour(c_gray,c_edgbbb,0.5),c_aqua,0.5),easing(28,anim,0,1,1)),c_black,0);
			draw_circle_colour(x-cx,(y+62)-cy,80+lengthdir_x(1,tick*123),merge_colour(c_black,merge_colour(merge_colour(c_gray,c_edgbbb,0.5),c_aqua,0.5),easing(28,anim,0,1,1)),c_black,0);
		}
	}
	
	if instance_number(oMex_console1)>=1 {
		with(oMex_console1) {
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_sprite_ext(sprite_index,2,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_circle_color(x-cx,(y-9)-cy,16,merge_colour(c_black,c_fuchsia,anim),c_black,0); //9 27
			draw_circle_color(x-cx,(y-27)-cy,64,merge_colour(c_black,c_fuchsia,anim),c_black,0);
		}
	}
	
	if instance_number(oMex_console32)>=1 {
		with(oMex_console32) {
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_sprite_ext(sprite_index,2,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_circle_color(x-cx,(y-9)-cy,16,merge_colour(c_black,c_fuchsia,anim),c_black,0); //9 27
			draw_circle_color(x-cx,(y-27)-cy,64,merge_colour(c_black,c_fuchsia,anim),c_black,0);
		}
	}
	
	if instance_number(oServer_Comp)>=1 {
		with(oServer_Comp) {
			draw_sprite_ext(sServer_Comp,2,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim1));
			draw_circle_color((x-cx)-3,(y-3)-cy,64,merge_colour(c_black,c_orange,lerp_bounce(anim1)),c_black,0);
		}
	}
	
	if instance_number(oMex_console22)>=1 {
		with(oMex_console22) {
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_sprite_ext(sprite_index,2,x-cx,y-cy,1,1,0,c_white,lerp_bounce(anim)+screen);
			draw_circle_color(x-cx,(y-9)-cy,16,merge_colour(c_black,c_fuchsia,anim),c_black,0); //9 27
			draw_circle_color(x-cx,(y-27)-cy,64,merge_colour(c_black,c_fuchsia,anim),c_black,0);
		}
	}
	
	if instance_number(oIiem_Floater)>=1 {
		with(oIiem_Floater) {
			draw_circle_color(x-cx,(y)-cy,24,merge_colour(c_black,c_iiem,lerp_bounce(sqr(flicker))),c_black,0);
		}
	}
	
	if instance_number(oDaipen_signage)>=1 {
		with(oDaipen_signage) {
			draw_circle_colour((x+32)-cx,(y+48)-cy,24+lengthdir_x(1,tick*123),merge_color(c_white,c_gray,random(1)),c_black,0);
		}
	}
	
	if instance_number(oPowered_light_widewarm)>=1 {
		with(oPowered_light_widewarm) {
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,0.65,0.55,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_circle_colour(x-cx,(y+30)-cy,40+lengthdir_x(1,tick*123),merge_colour(c_black,col,easing(28,anim,0,1,1)),c_black,0);
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.75,1,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.333,0.8,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
		}
	}
	
	if instance_number(oPowered_light_widepurp)>=1 {
		with(oPowered_light_widepurp) {
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,0.65,0.55,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			draw_circle_colour(x-cx,(y+30)-cy,40+lengthdir_x(1,tick*123),merge_colour(c_black,col,easing(28,anim,0,1,1)),c_black,0);
			draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.75,1,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
			//draw_sprite_ext(sLight_glow2,0,x-cx,(y+30)-cy,1.333,0.8,0,col,(1+lengthdir_y(0.05,tick*350)+random_range(-0.05,0.02))*easing(28,anim,0,1,1));
		}
	}
	
	if instance_number(oPrae_door_elevator1)>=1 {
		with(oPrae_door_elevator1) {
			draw_circle_color(x-cx,(y-32)-cy,anim2*64,merge_colour(c_black,c_fuchsia,anim2),c_black,0);
			draw_circle_color(x-cx,(y-32)-cy,anim2*80,merge_colour(c_black,c_fuchsia,anim2),c_black,0);
			draw_sprite(sPrae_elevator2,1,x-cx,y-cy);
			draw_sprite(sPrae_elevator2,oControl.Praedim_elevator_level+3,x-cx,y-cy);
		}
	}
	
	if instance_number(oArt_daipen_door)>=1 {
		with(oArt_daipen_door) {
			draw_sprite_ext(sprite_index,1,x-cx,y-cy,1,1,0,merge_colour(c_black,c_orange,sqr(an1)),sqr(an1));
			draw_sprite_ext(sprite_index,2,x-cx,y-cy,1,1,0,merge_colour(c_black,c_orange,sqr(an2)),sqr(an2));
			draw_sprite_ext(sprite_index,3,x-cx,y-cy,1,1,0,merge_colour(c_black,c_orange,sqr(an3)),sqr(an3));
		}
	}
	
	if instance_number(oTouch_Switch)>=1 {
		with(oTouch_Switch) {
			if anim>0 draw_circle_colour((x-1)-cx,(y+6)-cy,13.5,merge_colour(c_black,c_green,lerp_bounce(anim)),c_black,0);
			draw_circle_colour((x-1)-cx,(y-9)-cy,11.5+lengthdir_x(1,(tick*175)+sqr(xstart)+sqr(ystart)),merge_colour(c_black,c_orange,lerp_bounce(1-anim)*(0.75+lengthdir_x(0.25,tick*175))),c_black,0);
			draw_circle_colour((x-1)-cx,(y-9)-cy,19.5,merge_colour(c_black,c_green,lerp_bounce(anim)),c_black,0);
			if anim>0 draw_circle_colour((x-1)-cx,(y+6)-cy,22.75,merge_colour(c_black,c_green,lerp_bounce(anim)/2),c_black,0);
			draw_circle_colour((x-1)-cx,(y-9)-cy,16.75,merge_colour(c_black,c_green,lerp_bounce(anim)/2),c_black,0);
		}
	}
	
	if instance_number(parGnarcier)>=1 {
		with(parGnarcier) {
			var COL = $4400ff;
			if anim==0 COL = $ffff00;
			draw_circle_colour(x-cx+random_range(-0.5,0.5),y-cy+random_range(-0.5,0.5),(sqrt((sqr(sprite_width)+sqr(sprite_height)))+1+random_range(-0.5,0.5))+((1-anim)*32)+8,COL,c_black,0);
			draw_sprite_ext(mask_index,0,x-cx+random_range(-0.5,0.5),y-cy+random_range(-0.5,0.5),
			(f_*1.1)+random_range(-0.05,0.05),(f__*1.1)+random_range(-0.05,0.05),r__,$a280ff,1);
		}
	}
	
	if instance_number(oMal_Door_Flat)>=1 {
		with(oMal_Door_Flat) {
			draw_circle_colour(x-cx,(y-16.5)-cy,64,merge_colour(c_black,c_edgb,anim2),c_black,0);
		}
	}
	
	if instance_number(oSep_doorflat1)>=1 {
		with(oSep_doorflat1) {
			draw_circle_colour(x-cx,(y-21.5)-cy,64,merge_colour(c_black,c_orange,anim2),c_black,0);
		}
	}
	
	if instance_number(oMex_VenDoor)>=1 {
		with(oMex_VenDoor) {
			draw_circle_colour(x-cx,(y-24)-cy,64,merge_colour(c_black,$ff8000,anim2),c_black,0);
		}
	}
	
	if instance_number(parBullet)>=1 {
		with(parBullet) {
			draw_circle_colour(x-cx,y-cy,(r*2.5)+16,col,c_black,0);
		}
	}
	
	if instance_number(oMuzzleflash)>=1 {
		with(oMuzzleflash) {
			draw_circle_colour(x-cx,y-cy,32,c,c_black,0);
		}
	}
	
	if instance_number(parConsole)>=1 {
		with(parConsole) {
			draw_circle_colour((x+4)-cx,(y-7)-cy,32,merge_colour(c_black,c_edgb,lerp_bounce(anim)),c_black,0);
		}
	}
	
	if instance_number(oArt_vendingmachine)>=1 {
		with(oArt_vendingmachine) {
			if image_index==0 {
			draw_circle_color((x-cx)-5,(y-cy)-17,24,make_colour_rgb(0,255,255),c_black,0);
			draw_circle_color((x-cx)-5,(y-cy)-29,24,make_colour_rgb(0,255,255),c_black,0);
			}
			else
			if image_index==1 {
			draw_circle_color((x-cx)-5,(y-cy)-17,24,make_colour_rgb(255,255,0),c_black,0);
			draw_circle_color((x-cx)-5,(y-cy)-29,24,make_colour_rgb(255,255,0),c_black,0);
			};
		}
	}
	
	if instance_number(oGlw_Purple_Lamp)>=1 {
		with(oGlw_Purple_Lamp) {
			draw_sprite_ext(sLight_glow3,0,x-cx,(y-cy)+6,0.4,0.5,0,make_colour_rgb(255,34,255),1);
			draw_circle_color(x-cx,(y-cy),20,make_colour_rgb(128,16,128),c_black,0);
		}
	}
	
	if instance_number(oPrae_elevator_decal)>=1 {
		with(oPrae_elevator_decal) {
			if oControl.Praedim_elevator_level<oControl.Praedim_level {
				draw_sprite(sPrae_elevatorglow,0,(x-cx)-63,(((y-(((alarm[0]+1)/91)*148))+55)-cy)-5);
				draw_sprite(sPrae_elevatorglow,0,(x-cx)+22,(((y-(((alarm[0]+1)/91)*148))+55)-cy)-5);
			}
			else
			{
				draw_sprite(sPrae_elevatorglow,0,(x-cx)-63,(((y+(((alarm[0]+1)/91)*148))-(148-55))-cy)-5);
				draw_sprite(sPrae_elevatorglow,0,(x-cx)+22,(((y+(((alarm[0]+1)/91)*148))-(148-55))-cy)-5);
			}
		}
	}
	
	if instance_number(oBol_chest)>=1 {
		with(oBol_chest) {
			var anfade = (anim3/30);
			draw_circle_colour(x-cx,(y-13.5)-cy,256*anfade,merge_colour(c_black,c_blue,anim*anfade),c_black,0);
			draw_circle_colour(x-cx,(y-13.5)-cy,128*anfade,merge_colour(c_black,c_edgb,sqrt(anim)*anfade),c_black,0);
			draw_circle_colour(x-cx,(y-13.5)-cy,52*anfade,merge_colour(c_black,c_aqua,sqr(anim)*anfade),c_black,0);
			
			draw_circle_colour(x-cx,(y-14.5)-cy,64*anfade,merge_colour(c_black,c_edgbb,sqrt(anim)*anfade),c_black,0);
			draw_circle_colour(x-cx,((y-(easing(11,anim2,0,1,1)*8))-14.5)-cy,48*sqrt(anim2)*anfade,c_edgbb,c_black,0);
			draw_circle_colour(x-cx,((y-(easing(11,anim2,0,1,1)*8))-14.5)-cy,24*sqrt(anim2)*anfade,c_aqua,c_black,0);
			draw_circle_colour(x-cx,((y-(easing(11,anim2,0,1,1)*8))-14.5)-cy,10*sqrt(anim2)*anfade,c_white,c_black,0);
		}
	}
	
	if instance_number(oArt_train)>=1 {
		with(oArt_train) {
			draw_sprite_ext(sprite_index,2,x-cx,y-cy,1,1,0,make_colour_rgb(128,255,255),1);
			draw_sprite_ext(sprite_index,3,(x-160)-cx,y-cy,1,1,0,make_colour_rgb(128,255,255),1);
			draw_sprite_ext(sprite_index,3,(x-(160*2))-cx,y-cy,1,1,0,make_colour_rgb(128,255,255),1);
		}
	}
	
	if instance_number(oLIGHTING_lighter)>=1 {
		draw_set_alpha(0.5);
		draw_set_colour(c_dkgray);
		draw_rectangle(-1,-1,cw+4,ch+4,0);
	}
	
	if instance_number(oFlash_lighting)>=1 {
		with(oFlash_lighting) {
			draw_set_alpha(clamp(anim,0,1));
			draw_set_colour(c);
			draw_rectangle(-1,-1,cw+4,ch+4,0);
		}
	}
	draw_set_alpha(1);
	//if instance_number(parSPRITELIGHT)>=1 {
		with(parSPRITELIGHT) {
			draw_sprite_ext(sprite_index,image_index,x-cx,y-cy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
			if r!=0 {
				draw_circle_colour(x-cx,y-cy,r,c,c_black,0);
			};
		}
	//}
	
	with(parAENOX) {
		draw_sprite_ext(sprite_index,image_index,x-cx,y-cy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		if object_index==oNen_cluster_1 {
			draw_sprite_ext(sNen_bottom,anim1,x-cx,(y+16)-cy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		};
		if r!=0 {
			draw_circle_colour(x-cx,y-cy,r,c,c_black,0);
		};
	}
	
	with(oAenox_Cell) {
		draw_sprite_ext(sprite_index,7,x-cx,(y+(4*(anim3))+1)-cy,1,1,0,$8020ff,sqr(sqr(sqr(1-sqr(anim1))*(1-anim3))));
		draw_circle_colour((x-cx)-1,(y+(4*(anim3))+5)-cy,10,merge_colour(c_black,$8020ff,sqr(sqr(sqr(1-sqr(anim1))*(1-anim3)))),c_black,0);
	}
	
	with(oBolt_Colour) {
		if (t mod 5)==0 draw_circle_colour(mean(xd,x)-cx,mean(yd,y)-cy,point_distance(xd,yd,x,y)+2,merge_color(c_black,colour,1-sqr(1-anim)),c_black,0);
	}
	
	with(oFx_poly) {
		if glow draw_circle_colour(x-cx,y-cy,lerp(er,sr,anim)*3,merge_color(c_black,c,1-sqr(1-anim)),c_black,0);
	}
	
	with(oTsukuru) {
		if visible draw_circle_colour((x-cx)-2,(y-cy)-10,16.5,$a280ff,c_black,0);
	}
	
	with(oNen_power) {
		if anim<1 {
			draw_circle_colour((x-cx),(y-cy),31.57+random_range(-1,1),merge_colour($ff7700,c_black,anim),c_black,0);
			draw_circle_colour((x-cx),(y-cy),63.57+random_range(-1,1),merge_colour($ff7700,c_black,anim),c_black,0);
		};
	}
	
	with(oDoor_chunky_Nen) {
		if ((anim1+sqr(anim))<1) {
			draw_circle_colour((x-cx)+5,(mean(y1,y2)-cy)+7.5,(31.57+random_range(-1,1))/2,merge_colour($ff7700,c_black,anim1+sqr(anim)),c_black,0);
			draw_circle_colour((x-cx)-6,(mean(y1,y2)-cy)+7.5,(31.57+random_range(-1,1))/2,merge_colour($ff7700,c_black,anim1+sqr(anim)),c_black,0);
			draw_circle_colour((x-cx)+5,(mean(y1,y2)-cy)+7.5,(63.57+random_range(-1,1))/2,merge_colour($ff7700,c_black,anim1+sqr(anim)),c_black,0);
			draw_circle_colour((x-cx)-6,(mean(y1,y2)-cy)+7.5,(63.57+random_range(-1,1))/2,merge_colour($ff7700,c_black,anim1+sqr(anim)),c_black,0);
		};
	}
	
	with (oNen_bounce_TR) {
	    draw_circle_colour((x-cx),(y-cy),16.5,$ff8000,c_black,0);
	}
	
	surface_reset_target();
	//gpu_set_blendmode(bm_add);
	//draw_surface_ext(surf,round(cx),round(cy),1,1,0,merge_colour(c_dkgray,c_black,0.666),0.333);
	//gpu_set_blendmode_ext(bm_dest_color,bm_zero);//keyboard_check(vk_shift)?bm_zero:(keyboard_check(vk_control)?bm_src_alpha_sat:bm_dest_colour));
	//if keyboard_check(vk_alt) gpu_set_blendmode_ext(bm_zero,bm_subtract);
	gpu_set_blendmode_ext(bm_zero,bm_subtract);
	draw_surface(surf,round(cx),round(cy));
	/*gpu_set_blendmode_ext(bm_dest_color,bm_subtract);
	if keyboard_check(vk_shift) draw_surface_ext(surf,round(cx),round(cy),1,1,0,c_gray,0.1);*/
	//gpu_set_blendmode(bm_add);
	//draw_surface_ext(surf,round(cx),round(cy),1,1,0,merge_colour(c_dkgray,c_black,0.666),0.333);
	//draw_surface(surf,round(cx),round(cy));
	
	/*if keyboard_check(ord("K")) {
		//gpu_set_blendmode(bm_add);
		//draw_surface_ext(surf,(cx),(cy),1,1,0,c_white,0.5);
		//gpu_set_blendmode_ext(bm_dest_color,bm_zero);
		//draw_surface(surf,(cx),(cy));
	}*/
	gpu_set_blendmode(bm_normal);
	if surface_get_width(surf)!=cw+4 || surface_get_height(surf)!=ch+4 {
		surface_free(surf);
	}
}
}
}
else
draw_rectangle_view(c_black,1);