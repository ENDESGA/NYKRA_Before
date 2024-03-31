# NYKRA: Before

*Before you, before me, before the leaves on the tallest tree.*

*Before matter, before light, before the stars that shine at night.*

*The Seven Observers roamed the planes of time, guided by Nenox - Holder of Time itself.*

*An Observer noticed something infinitesimally small in the wake of their movements.*

*A collapse of three spatial dimensions, and Nea was the first to witness it.*

*Broken up into seven equal parts, forming a complex relationship of realities.*

*The Heptaverse was born, and the first light from the first galaxy manifested.*

---

When I was about 14-15 years old I had this grand idea for a huge sci-fi sandbox game. This was about 2010-2011 when I started making online posts about it. I started a blog on Blogspot and pretended to be a big studio - thinking it was super cool to act like that, knowing fully that no one was really looking or reading. But what if they did? I had huge dreams. Seemingly complex dreams that I just wanted to reach. I was just a kid though, with no real knowledge on how to make a game. In fact, this entire document can be a CV of sorts, because NYKRA was the progression of not-knowing-how-to-make-a-game me to knowing-a-decent-amount-about-making-games-but-still-has-a-lot-to-learn me. I didn't know how to program, but all I knew is that I loved Terraria, I loved Minecraft, and I loved Star Wars/Trek/Gate. Why not combine them all into ONE GAME! I spent countless months after high school making a 2D sandbox game all too similar to Terraria. I just had this desire for it to be “my own,” and always pushed myself to put a twist on things I loved about sci-fi and pixel games. But I had huge issues when it came to actual game development, which is obvious with me only actually “making a game” for a year or so. I would tell friends and even teachers at school that I was “making a game”. It became who I was, and it was all I wanted to do, for whatever reason. I obsessed over it, but it was never good enough.

The game periodically changed over the years, from a young-dev’s terraria-clone, to something that had structure and a narrative. But even then, it still didn’t come out as intended, which is something I have trouble talking about today. It’s gotten to the point where I’m now too deeply emotionally connected to it, and trying to write this document has taken days of mental prep and build-up, when all it is, is me going over some code. Hindsight is such a painful and wonderful thing. I’m very glad I can look back in the light of “wow I grew a lot”, but damn is it hard. I was making NYKRA during a painful time of my life, and it heavily affected the game and the release. I came out feeling deeply embarrassed, which is not what younger me would have wanted. It’s painful, but I’m dedicated to keep NYKRA by my side. I love it and I’m proud of what it has become. Even since the release, it has grown so much more in my head, my skills just take a lot longer to catch up. That’s something I wish I could tell younger me; You can dream and fantasise about entire universes within reality, but it’s only when you put the work into gaining the skill to make them real, do they become so.

I would like to take you on a journey through the thoughts of younger me, as I learned how to program in GML (GameMaker's Language), while making NYKRA - my dream game - over the span of about 7-ish years. This will be me mostly going over the major parts of the game, referencing the lumps of source code that will be linked to this.

```csharp
/// Triple slash comments are by now-me writing this doc
```

---

# oControl

In GameMaker I tended to call objects “o+name”, so this would be “object Control”. I’m not sure why I did it like that, since people these days typically go “obj_+name”, like “obj_Control”, or something similar. Regardless, this was probably one of the first and most important objects in the entire project. It holds the world editor, renders the backgrounds for each planet, and is in charge of all the important background systems (like playing the music depending on the planet and room) and global variables. It needed really specific features that just didn't fit anywhere else. "I really need a specific detail-system which adds thick letterboxing for ***added intensity*** whenever and wherever I want it during the game…” I would just chuck it somewhere completely wild like the last rendered Event (Draw End), because I "wanted it to always be drawn above everything" - which is totally fair, but it later became a problem when I wanted to draw specific UI text that kept on being drawn over when the letterboxing would happen:

### > letterbox *[oControl/Draw_73.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/oControl/Draw_73.gml#L38-L48)* _

```csharp
/// It's interesting how I'm using reach() in a way that reach_tween()
/// works, which means this must be very old code.

anim1 = reach(anim1,LETTERBOX>0,abs(LETTERBOX-anim1)/9);
//if LETTERBOX {
	if anim1>0 {
		draw_set_colour(c_black);
		draw_set_alpha(1);
		draw_rectangle(cx-1,cy-1,cx+cw+1,(cy-1)+((ch/11)*anim1),0);
		draw_rectangle(cx-1,(cy+ch+1)-((ch/11)*anim1),cx+cw+1,cy+ch+1,0);
		LETTERBOX -= (1/(ceil(fps)/4));
	};
	LETTERBOX = clamp(LETTERBOX,0,1);
//};

```

I left the comments in there so you can see some of my thinking. Though I'm not entirely sure why I would comment out that part, it stopped it from executing if `LETTERBOX` was not true, so maybe I realised using a `clamp()` function was better since it would stop `LETTERBOX` from going below `0` and above `1`… The line `LETTERBOX -= (1/(ceil(fps)/4));` is interesting to me because I always tried to use strange values for changing variables - basically `1 / 15 (which is just 0.0667)` since the fps was almost always capped at 60. I could have simplified a lot of this. Which is really the crux of a lot of what you'll see. This is code written by a young someone who doesn't know how to write code, but somehow after scrambling in the rubble made something that worked. I knew one day I'd be a lot older (now), and there will be another day where I'm even older (hello future me). The cycle will end one day - but within the cycle I really want to put together a universe that exists and is stable. I had that dream back then, and I still have the dream. I feel it'll come to fruition one day in its most stable form. Like a radioactive material decaying down to a stable isotope. Anyway, got a little off-track there, which I guess summarises this monstrosity of an object.

It also managed the window and camera/view dimensions and scale:

### > set_game_screen *[scripts/set_game_screen.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/scripts/set_game_screen/set_game_screen.gml#L3-L71)* _

```csharp
/// This was called to re-adjust the WASD/Arrows controls
set_controls();

/// NYKRA is locked to 60 frames per second.
/// Which was really stemmed from how GameMaker worked, and
/// honestly I prefer a fixed rate rather than delta-time anyway.
/// It makes timers and animations a lot easier, not having to
/// worry about somewhat-complex delta-time math. These days most
/// computers could actually run an app/game at or more than 120fps on
/// the CPU, but are either locked to the GPU (typically 30 or 60fps)
game_set_speed(60,gamespeed_fps);
room_speed = 60;

/// config_get() involves reading an external file, which isn't the best,
/// along with bool(real()) for some reason.
var _full = bool(real(config_get("Settings","Fullscreen",1)));

/// The following monstrosity is some attempt of getting the best scalar
/// for the window to scale into the display (...)
if _full {window_set_fullscreen(1); scale = 1;} else {window_set_fullscreen(0); scale = 2;};
var scl = floor(display_get_height()/360)*2;
repeat(4) {
	if floor(frac(scl/2)*10)<=0 {
		scl /= 2;
	}
	else break;
}

/// (...) AND THEN I DON'T EVEN USE IT
var scll = scl;
scl = (display_get_height()/180);
scll = scale;

var scrn = scl/(scl/scale);
if (scale==0) scrn = scl;
globalvar cam;

/// Many weeks were spent trying to get the camera and view system
/// working the way I wanted it to. And then I ended up making it
/// super simple anyway. By "simple" I mean still rather complex
/// and messy, but it was minimal in comparison to what I used to
/// have going for this.
cam = camera_create();
cam_scale = scl;
cam_scale_d = scl;
camera_set_view_size(cam,floor((display_get_width()/scl)/2)*2,floor((display_get_height()/scl)/2)*2);

view_camera[0] = cam;
view_wport[0] = display_get_width()/scrn;
view_hport[0] = display_get_height()/scrn;

window_set_size(floor((display_get_width()/scrn)/2)*2,floor((display_get_height()/scrn)/2)*2);
display_set_gui_size(display_get_width(),display_get_height());

/// but for some reason I comment out window_center()
/// because centering a window wasn't good...?
/// it's interesting because I never wrote a reason anywhere for
/// adding comments, so I just have to think back really hard and
/// try to remember why i did it.

//window_center()
application_surface_draw_enable(0);
application_surface_enable(0);

/// I set the depth to -1000 every single time, too
depth = -1000;

/// And then I reset the camera via the existence of the player.
/// I remember encountering many issues with the camera, and instead
/// of fixing the camera I just chucked wild blocks of code like this.
if instance_number(oPlayer)>=1 {
	if instance_number(oCamera)<=0 instance_create_depth(x,y,0,oCamera);
	if instance_exists(oCamera) {
		oCamera.x = oPlayer.x;
		oCamera.y = oPlayer.y;
		oCamera.xx = oPlayer.x;
		oCamera.yy = oPlayer.y;
		oCamera.mv = 0;
		oCamera.mh = 0;
		camera_set_view_pos(cam,oCamera.x-(camera_get_view_width(cam)/2),oCamera.y-(camera_get_view_height(cam)/2));
	}
}
else
{
	if instance_number(oCamera)<=0 instance_create_depth(camera_get_view_x(cam)+(camera_get_view_width(cam)/2),
	camera_get_view_y(cam)+(camera_get_view_height(cam)/2),0,oCamera);
	if instance_exists(oCamera) {
		oCamera.mv = 0;
		oCamera.mh = 0;
	}
};

/// To top it all off, I set depth-buffer stuff and
/// then flush the texture and draw systems.
/// Which isn't something you should do very frequently...
gpu_set_zwriteenable(0);
gpu_set_ztestenable(0);
draw_texture_flush();
draw_flush();

};
```

This is a function oControl called very often; opening/closing a save, and even every single time you enter a new room! It would just call this chunky script a few times to make sure you were in the right window mode… It wasn't the best system. But looking back, I can really see what I was *trying* to do. I always had such vast intentions, and really tried my best to make everything “just work” as much as I could make it. Something that dawned on me near the end of development was that making a game is a lot harder than people may think, and the sheer depth I, as one person, had to go just to make something functional was absurd. I was so deeply tired every time I touched the project, even after months of recovery from burn out. It spawned a lot of thinking about what I was capable of, and if constructing such a large manifestation was such a good idea after all… Now that I’m a lot older (and 6 months into working professionally with a studio!) I look back with great empathy and melancholy - not to get all dramatic and emotional. So many large parts of the game involved young 16-20 year old me just trying to make a vision real, and after countless weeks/months/years things kinda started to come together. As it goes, I know older me will look at this too in a certain way.

---

# oPlayer

NYKRA’s iterations always began with an “oPlayer” object, which would contain some controller system and collision system. It’s interesting because I associate my protagonist Keu as “oPlayer” in my head more often, and I considered many times to change the object to “oKeu”… But it never happened. Regardless, the way this object came together over the years was rather strange. Many components that could have been their own thing just became part of the player, and it ended up becoming one of the most complex objects in the project.

The way it drew Keu’s sprites, too, was so strange, and didn’t involve a state-machine at all really. It had a part of one, but I kept on layering up the if()s - which made it a bit of a mess.

### > draw states *[oPlayer/Draw_0.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/oPlayer/Draw_0.gml#L1-L119)* _

```csharp
/// I'm pretty sure I wrote "draw = 0;" as a comment so I could
/// uncomment it to make the player not be drawn during testing...

//draw = 0;

/// This line is amusing because planet number 6 is Iiedakama which
/// makes everything a silhouette.
/// The fastest way I could think of that makes anything drawn
/// as a solid colour was to set the fog to black - but this method
/// is extremely hacky, but allowed me to do things like this:
if CURRENT_PLANET==6 gpu_set_fog(1,0,0,0);

/// iirc this if{ section is for the entire draw event, meaning if I
/// would set draw to 0 then literally nothing drew - which is useful
if draw {
draw_set_colour(c_white);
draw_set_alpha(1);

/// Gotta love the "if 1==0 {", which, for those who don't code, means
/// this draw function will never happen, and I could just delete it.
if 1==0 && has_telarod && telarod==0 && telarod_an==0 {
	//draw_sprite_ext(sTelarod_player,0,((mean(x,xprevious)-(facing*2))-(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])))-(facing),-1+yprevious-abs(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])),1,1,0,merge_colour(c_ltgray,make_colour_rgb(76,74,84),2/3),1);
	draw_sprite_ext(sTelarod_player,0,
	(1+(mean(x,xprevious)-(facing*2)))-round(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n])),
	-1+yprevious-round(abs(lengthdir_x(1,(360*(frame/sprite_get_number(state)))+270)*(state==RUN[state_n]))),
	-1,-1,0,c_white,1);
}

/// Now we get into the player "states", which was actually just
/// which sprite to draw - and I don't know why I didn't change it.
/// Since the telarod (Keu's tool-weapon) barely came out, I made
/// it the first state that could be overridden.
if has_telarod==1 && telarod_an==1 {
	telarod_ant += ((1/6)*1.5);
	state = sPlayer_telarod_grab;
	telarod_ant = clamp(telarod_ant,0,10);
	anim = floor(telarod_ant);
	control = 0;
}

/// To anyone that is reading this and learning how to program;
/// please, I beg of you, USE SWITCH{CASE:BREAK;} statements!
/// It makes code like this a lot easier to read a lot more legible
/// to go through mentally when looking for bugs/issues
if dlg_anim!=0 {
	if dlg_anim==1 {
		state = sPlayer_pain1;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==2 {
		state = sPlayer_wave;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==3 {
		state = sPlayer_earpiece;
		anim = 0;
	}
	else
	if dlg_anim==4 {
		state = sPlayer_happy;
		anim = (round(tick*10));
	}
	else
	if dlg_anim==5 {
		state = sPlayer_peer;
		anim = 0;//(round(tick*10));
	}
	else
	if dlg_anim==6 {
		state = sPlayer_necklace;
		necklace_anim = clamp(necklace_anim+(1/6),0,8);
		anim = floor(necklace_anim);//(round(tick*10));
		//necklace_anim = 0;
		control = 0;
	}
	else
	if dlg_anim==7 {
		state = sPlayer_idleThink;
		/// As you can see in most of these, I set anim to 0.
		/// having to do such a thing within a structure like a
		/// if{}else{} or switch{case:break;} is a sign of a poorly
		/// designed system - which is a given! I did not know what the
		/// ways were to make such a system at the time.
		anim = 0;
	}
	else
	if dlg_anim==8 {
		state = sPlayer_idleWorry;
		anim = 0;
	}
	else
	if dlg_anim==9 {
		state = sPlayer_idleHips;
		anim = 0;
	}
	else
	if dlg_anim==10 {
		state = sPlayer_bg;
		anim = 0;
	}
	else
	if dlg_anim==11 {
		state = sPlayer_shock;
		anim = 0;
	}
}

if (necklace_anim>0) && dlg_anim!=6 {
	state = sPlayer_necklace;
	necklace_anim = clamp(necklace_anim-(1/6),0,9);
	anim = floor(necklace_anim);
	control = 0;
	if floor(necklace_anim)<=0 {
		necklace_anim = 0;
		dlg_anim = 0;
		//control = 1;
		//state = sPlayer_idle;
	};
};

/// I sat here for a second thinking "player hang...?" unsure
/// what it was referencing.
/// And then I remembered! NYKRA had a climbing mechanic! and I
/// remember it working rather well, but I chose not to use it
/// because it made the level design completely different. I had
/// to choose to make the player climb anywhere or climb in certain
/// locations (like how some games have a blue/yellow ledge), and
/// I guess I ended upchoosing to make them not climb at all.
/// I would really love to explore the climbing aspect I originally
/// had for NYKRA, since Keu was always "designed to be athletic"
if grab!=0 {
	state = sPlayer_hang;
	anim = 0;
}
var aenox_ant = aenox_an;
if aenox_use==1 {
	aenox_an += ((1/6)*1.75);
	control = 0;
	state = sPlayer_Aenox;
	anim = floor(aenox_an);
	if aenox_an>=11 {aenox_use=0; aenox_an=0;};
}

/// This section is odd because I actually allowed for other
/// objects and external systems to set the players state and anim.
/// but only if set_sprite was set to 1
/// It was never really used, but it ended up causing lots of little
/// problems...
if set_sprite==1 {
	state = set_state;
	anim = set_anim;
	set_sprite = 0;
}

/// Oh! ...And I also had a system to allow the player to have OTHER TOOLS
/// Keu originally held a torch, and you got to switch to different
/// tools as you found more.
/// I had a phase where I trimmed the entire scope, and I think this
/// was part of the culled features. I really wanted to have
/// many tools and weapons, but it was just too much to put together.
if tool==1 {
	if state==IDLE[state_n] {
		state = sPlayer_idle_torch;
	}
}
```

---

# oEo

EO is the floating companion that you encounter late in the game, and is one of the most complex designed things I’ve ever had to think about. Which is mostly because NYKRA had decreasingly less combat/action and more of a focus on story. You may notice the object’s name being “oEo” with a lowercase ‘o’, which caused many problems because renaming an object in GameMaker sucked and I kept on typing “oEO”.

EO started off as an over-the-shoulder energy cannon of sorts, but then progressively became more and more “AI-like” with complex movement behaviours involving machine-learning, and a much more elaborate position in the story. I wish I was able to get EO to where I wanted it to go, but it fell short on many aspects. The later idea was that EO would get better and better at defending you, but it was hard to really grasp the scope.

### > pixelate *[oEo/Draw_0.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/oEo/Draw_0.gml#L21-L38)* _

```csharp
/// EO was originally just drawn and rotated sprites, but I remember at
/// the time there was a lot of discussion around rotated pixels/mixels
/// and I decided to do soemthing different.
/// I ended up making EO draw to a 32x32 surface, which pixelated it as
/// it rotated! I remember being rather excited about this, because I
/// think I was about to put this together in a day - which was rare for
/// younger me.
/// Most improvements I made would take weeks/months to develop
if surface_exists(_surf) {
surface_set_target(_surf);
draw_clear_alpha(0,0);

/// This is for the 3 parts of EO that would render behind the main sphere.
/// It would only draw "if oControl.GAME_CHAPTER[1,5]==1", which was used
/// during the cutscene of EO being put together.
if oControl.GAME_CHAPTER[1,5]==1 {
	draw_sprite_ext(sEo,0,16,16,1,__rel,rddir-(45*__rel),c_white,1);
	draw_sprite_ext(sEo,2,16-lengthdir_x(punch,rddir),16-lengthdir_y(punch,rddir),1,__rel,rddir,c_white,1);
	draw_sprite_ext(sEo,3,16,16,1,__rel,rddir,c_white,1);
}
/// Sprite index 1 was EO's main sphere body:
draw_sprite(sEo,1,16,16);
surface_reset_target();
} else _surf=surface_create(32,32);
if surface_exists(_surf) draw_surface_ext(_surf,(x-15),(y-15),1,1,0,c_white,draw);
//surface_free(_surf);
//_surf = 0;
draw_set_alpha(1);

/// I really enjoyed using additive blendmodes, it made *adding* glows
/// to the world really fun. Pun intended.
gpu_set_blendmode(bm_add);
/// Since it's a gradient circle (more a disc) that's 'c_edgbbb'
/// (which is blue lmao) to black at the edges, it would become a glow
/// via the additive blendmode!
draw_circle_color(x,(y),8+lengthdir_x(1,tick*77),merge_colour(c_black,merge_colour(c_edgbbb,c_black,0.666),1-fade_in),c_black,0);
draw_circle_color(x,(y),2.5+lengthdir_x(0.5,tick*123),merge_colour(c_black,merge_colour(c_edgbbb,c_black,0.666),1-fade_in),c_black,0);
```

---

# parDialogue

Just like many other major components of NYKRA, the Dialogue system went through huge changes as the game evolved. I couldn’t think of the best parts to point out within the Dialogue rendering system, since it’s a really chunky and complex pile of code. One part near the end of one of the draw events caught my eye though as I was sifting through it all. It involves reading a string of text that was connected to the current dialogue block, which could contain little “commands” to make objects do things. I would use it to change the animation state of an object - like making Keu “think”, or Taff pointing. More is explained below in the code block:

### > command via string *[parDialogue/Draw_73.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/parDialogue/Draw_73.gml#L567-L624)* _

```csharp
/// I was apparently very worried about dlg_t being negative.
/// there's lots of memories
if t_dlg_t!=dlg_t && dlg_t!=-1 && sign(dlg_t)>=0 && dlg_t!=undefined && dlg_t!=noone {
	//alarm[0] = -1;
	if dlg[dlg_t,3]!="" {
		var __c = "";
		for(var k=1; k<=string_length(dlg[dlg_t,3]); k++) {
			__c = string_char_at(dlg[dlg_t,3],k);
			if __c=="s" {cam_shake=real_string(string_char_at(dlg[dlg_t,3],k+1));}
			if __c=="a" {
				var ___ttt = floor(real_string(string_char_at(dlg[dlg_t,3],k+1)));
				if (___ttt==1) {
					if string(floor(real_string(string_char_at(dlg[dlg_t,3],k+2))))!="" {
						___ttt = floor(real_string(string_copy(dlg[dlg_t,3],k+1,2)));
					};
				};
				(dlg[dlg_t,6]).dlg_anim=___ttt;//real(string_char_at(dlg[dlg_t,3],k+1));
				dlg_anim_id=dlg[dlg_t,6];
			}
			if __c=="f" {
				if instance_number(oEo)>=1 && string_char_at(dlg[dlg_t,3],k+1)=="e" {oPlayer.facing=1; if oEo.x<x oPlayer.facing=-1; oEo.look_id=oPlayer;}
				if string_char_at(dlg[dlg_t,3],k+1)=="d" {dlg[dlg_t,6].facing=1; if dlg[dlg_t,6].x>x dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="p" {dlg[dlg_t,6].facing=1; if dlg[dlg_t,6].x>oPlayer.x dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="k" {
					if string_char_at(dlg[dlg_t,3],k+2)=="0" {oPlayer.facing=-1}
					else
					if string_char_at(dlg[dlg_t,3],k+2)=="d" {oPlayer.facing=-1; if oPlayer.x<x oPlayer.facing=1}
					else oPlayer.facing=1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="l" {dlg[dlg_t,6].facing=-1;}
				if string_char_at(dlg[dlg_t,3],k+1)=="r" {dlg[dlg_t,6].facing=1;}
			};
			if __c=="t" {alarm[0]=round(real_string(string_char_at(dlg[dlg_t,3],k+1)+string_char_at(dlg[dlg_t,3],k+2)+string_char_at(dlg[dlg_t,3],k+3)))};
			if __c=="h" {
				if string_char_at(dlg[dlg_t,3],k+1)=="-" {
				dlg[dlg_t,6].hsp -= round(real_string(string_char_at(dlg[dlg_t,3],k+2)));}
				else
				dlg[dlg_t,6].hsp += round(real_string(string_char_at(dlg[dlg_t,3],k+1)));
			};
			if __c=="v" {
				if string_char_at(dlg[dlg_t,3],k+1)=="-" {
				dlg[dlg_t,6].vsp -= round(real_string(string_char_at(dlg[dlg_t,3],k+2)));}
				else
				dlg[dlg_t,6].vsp += round(real_string(string_char_at(dlg[dlg_t,3],k+1)));
			};
			//if __c=="v" {play_sound_pos(voice[real(string_char_at(dlg[dlg_t,3],k+1))],10,0,mean(1,1,random_range(0.9,1.1)),1,0,x,y);}
		}
	}
	//if dlg[@ dlg_t,16]!=-1 play_sound_pos(dlg[@ dlg_t,16],10,0,mean(1,1,random_range(0.9,1.1)),1,0,dlg[@ dlg_t,17].x,dlg[@ dlg_t,17].y);
	if dlg[@ dlg_t, 18] != 0 {
		switch(dlg[@ dlg_t,19]) {
			case 0:
				instance_create_depth(mean(dlg[@ dlg_t,18].x,(dlg[@ dlg_t,18].bbox_right+4))+1,dlg[@ dlg_t,18].bbox_top-2,99,oEmote_exclaim);
			break;
			
			case 1:
				instance_create_depth(mean(dlg[@ dlg_t,18].x,(dlg[@ dlg_t,18].bbox_right+4))+1,dlg[@ dlg_t,18].bbox_top-2,99,oEmote_question);
			break;
		}
	}
}
```

---

# LIGHTING

LIGHTING.

Apparently this object had to not only be in all caps, but also doesn’t have an ‘o’ at the start. It’s very similar to oControl in many ways, and yet I decided it had to be LIGHTING. ***LIGHTING I TELL YOU, LIGHTING!***

This object would use draw_circle_colour() so many times in one frame, and yet it never really had any huge performance issues. All it really involved was to draw a block texture on top of the screen and blend it via a multiply blendmode:

`gpu_set_blendmode_ext(bm_zero,bm_subtract);`

I just made it use an additive blendmode on the black surface, and draw anything I wanted as lights or lighting. Actually not a bad technique! The only issue was if you had something like outside sky lighting, which wasn’t easily drawn to the lighting surface. Which is mostly why NYKRA doesn’t have day/night cycles… I just couldn’t figure out how to make it look good without shaders - because I didn’t learn shaders until NYKRA was mostly complete.

Here’s a section on a few different lights that were drawn to the specific objects:

### > LIGHTING *[LIGHTING/Draw_73.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/LIGHTING/Draw_73.gml#L569-L613)* _

```csharp
if instance_number(parGnarcier)>=1 {
	with(parGnarcier) {
		var COL = $4400ff;
		if anim==0 COL = $ffff00;

		/// The line below this one is really quite something.
		/// I had very specific needs for the circles haha
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

/// NYKRA may have had a moment where Keu had a gun...
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
```

---

# oCamera

When I think about the camera in NYKRA, I get transported back to the years when I started learning about how games were actually made. Despite my terrible memory, I do actually remember the moment when I started realising that a game can be made up of simple components that can be described in the real world. Even if it was 2D or designed in a weird way, a lot of the time you can distinguish that there is at least a `control`, a `camera`, a `player`, and a `world` of some kind. There’s typically a ***lot*** more components involved in a game, but you can do a lot with very little. And even those parts themselves come in an extreme range of forms.

This ties into one of my favourite parts of games that I like to make: the concept of “how is the person experiencing this program?” and the way it can be expressed; which in many terms starts with the camera. In NYKRA’s case, every later iteration it had started with the Control, Camera, Player, and then everything else from there. The lighting and dialogue aren’t important at all for a game in such an early stage. Once you have a very reliable / fun / unique / whatever-your-project-requires `control`, `camera`, `player`, (and consequently a `world` of some kind), then the rest of the project can come together. The foundation must be set, before the structures are built.

A lot of that rambling above is now me wishing I could have told myself this when I was younger. It takes so much trial and error to actually get to a point where it not only works, but you’re comfortable with it.

The code below is where I was trying to figure out a way to have “camera points”, that had a radius which when the player enters will make the camera pan over and look somewhere between the player and the point… depending on how close you are to the point. It’s a little complex, but the effect came out really amazing, and I have so many new ways to go further with this that I’d love to experiment with one day.

### > look at *[oCamera/Step_2.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/oCamera/Step_2.gml#L15-L46)* _

```csharp
/// The x and y variables are the real position of the middle
/// of the camera view. So, I used the wonderfully named xx and yy
/// variables as a sort of "buffer position" that would be moved
/// around - in this case towards the 'follow' object's position
/// with reach_tween(), which just lerps using the distance
/// divided by something, like 3.
/// In the yy line though, I'm moving the camera up an amount -
/// which is apparently an average between 16, and the camera
/// height divided by 4, multiplied by if the object exists to
/// make the camera go higher... and then multiply that by 0.825
/// How oddly specific.
xx = reach_tween(xx,(follow.x+(follow.hsp)),3);
yy = reach_tween(yy,((follow.y-11)+follow.vsp)-(mean(16,ch/4)*instance_exists(oCamera_high)*0.825),3);
var weak = 0;
var cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point);
if cp!=noone {

	/// Max radius of 100 hardcoded into the camera for another object
	if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=100 cp=noone;
}
else {cp = instance_nearest(oPlayer.x,oPlayer.y,oCamera_Point_Weak); if cp!=noone {
	weak = 1;

	/// I'm pretty certain that this is the other kind of
	/// camera point that is just less interacting. More of a soft
	/// nudge for the camera. Again, I'm impressed 15-16y.o me
	/// thought of this, despite how absolutely insane it is.
	if point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)>=70 cp=noone;
	}};
//if (oPlayer.onsolid==0 || oPlayer.p_onsolid<=0) cp=noone
if cp!=noone || (cp==noone && an<1) {
	if cp!=noone {
		cpx = lerp(cp.x,xx,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
		cpy = lerp(cp.y,yy,(max(point_distance(oPlayer.x,oPlayer.y,cp.x,cp.y)-(weak?40:70),0)/30));//,10);
		an = reach_tween(an,0,22);
	} else {cpx=xx; cpy=yy;};

	/// Yoyo Games, it was a mistake to allow mulitple arguments
	/// for the mean() function...
	x = lerp(mean(cpx,cpx,cpx,cpx,xx),xx,(an));//(mean(cpx,cpx,cpx,cpx,xx)*(1-an))+(xx*an);
	y = lerp(mean(cpy,cpy,cpy,cpy,yy),yy,(an));//(mean(cpy,cpy,cpy,cpy,yy)*(1-an))+(yy*an);
	if weak {
		x = mean(xx,x,x);
		y = mean(yy,y,y);
	};
}

if cp==noone {
	if an>=1 {
		x = xx;
		y = yy;
	}
	an = reach_tween(an,1,22);
};
```

---

# parNote

There was a pivotal moment in NYKRA’s history when I realised I wanted to pursue story telling, since I actually had a lot of stories and moments I wanted to tell! But there was a major issue, that still affects me a lot to this day… I basically failed English in High School - I’m really not that great at writing, and along with my ADHD, dyslexia runs in my family. So no wonder I’m obsessed with: `shapes`, `7`, `collecting obsidian`; they’re things that don’t really involve words or talking. I drew weird glyphs and alien languages for fun, how was I supposed to come up with some big story? Spoilers, I wasn’t able to in the end. I actually struggled so much that I refer to it as torture occasionally, when people question about how NYKRA went in the final moments. The story is damaged and shattered while telling an adventure about a damaged and shattered individual running through a damaged and shattered universe. Maybe *(says my therapist)* I’m a little damaged and shattered myself, which would explain a lot. Regardless, in the end I am left with a lot of hindsight. I see so much now, I have become the observer I wrote about. All very meta. Oh wait, fuck that word now. Why did that weird zuckerman have to choose such a name… I digress.

I chose this draw event below in particular because it has some really amusing code in it that I wrote when I was a lot younger:

### > note drawing *[parNote/Draw_73.gml](https://github.com/ENDESGA/NYKRA_Before/blob/main/parNote/Draw_73.gml#L2-L48)* _

```csharp
/// Pretty boring stuff to start...
if oControl.mode!=3 {
	draw_set_colour(c_aqua)
	draw_set_alpha(1);
	draw_text(x,y,string(text)+"\n"+string(page));
};

if instance_number(oPlayer)>=1 {
if on==0 {
	interact_arrow(x,y,17,c_aqua);
	if anim7==0 {
		gpu_set_blendmode(bm_add);

		/// This draws itself as an additive layer to glow on top of the
		/// lighting- *ahem* LIGHTING layer. It pulsed as well, which
		/// actually looks really cool, and I'll use it again
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_ink,0.5+lengthdir_x(0.5,(tick*300)+sqr(xstart)+sqr(ystart)+x+y));
		gpu_set_blendmode(bm_normal);
	}
}

/// oh god there it is...
var cx = camera_get_view_x(cam), cy = camera_get_view_y(cam), cw = camera_get_view_width(cam), ch = camera_get_view_height(cam);
var cmx = (cx+(cw/2)), cmy = (cy+(ch/2));
/// WHAT IS THIS?!
/// After some calculating, apparently the alternate form would be:
/// cmx -= pow(anim1, 32.) / 30064771072.;
/// cmy -= pow(anim1, 32.) / 18501397582.;
/// Which tbh are very strange curves, since it's basically a right
/// angle... but maybe that was my intention!
cmx -= ((sqr(sqr(sqr(sqr(sqr(anim1/2))))*4)/7)/4);
cmy -= ((sqr(sqr(sqr(sqr(sqr(anim1/2))))*6.5)/7)/4);

if anim1>0 {
	draw_rectangle_view(c_black,anim1/3.5);
	//draw_rectangle_view(c_black,anim1/3.5);

	/// This draws the back of the note itself
	draw_sprite_ext(sNote,page,cmx+((sqr(sqr(sqr(sqr(sqr(anim1/2))))*4)/7)/1.25),cmy+((sqr(sqr(sqr(sqr(sqr(anim1/2))))*6.5)/7)/1.25),anim1/2,anim1/2,0,merge_colour(c_black,c_blackink,0.5),sqr(anim1/3)/2);
	draw_sprite_ext(sNote,page,cmx,cmy,anim1/2,anim1/2,0,c_white,anim1/2);
	
	draw_set_colour(merge_colour($000000,make_colour_rgb(107,105,111),0.5));
	draw_set_font(FONT_MAIN);
	draw_set_alpha(sqr(anim1/2));
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if align==1 draw_set_halign(fa_left);
	draw_text_transformed(cmx-((40*anim1*(align==1))/2),cmy,display_text,anim1/4,anim1/4,0); // display_text
	
	if top_t!="" {
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(FONT_MAIN);
		draw_set_alpha(sqr(anim1/2)/2);
		draw_text_transformed(lerp(cmx-36,cmx,(1-(anim1/2))),lerp(cmy-50,cmy,(1-(anim1/2))),top_t,anim1/4,anim1/4,0);
	}
	gpu_set_blendmode(bm_add);
	draw_ui_arrow(0,CMX,mean(CMY+50,CY+CH)+1,0,merge_color(c_black,$0080ff,sqr(anim1/2)));
	gpu_set_blendmode(bm_normal);
}
}
```

---

Talking about NYKRA:

[https://clips.twitch.tv/GleamingKawaiiClintmullinsBrainSlug](https://clips.twitch.tv/GleamingKawaiiClintmullinsBrainSlug)

Gamedev in a nutshell:

[https://m.twitch.tv/clip/BrightColorfulWallabySoonerLater](https://m.twitch.tv/clip/BrightColorfulWallabySoonerLater)

Making a language:

[https://m.twitch.tv/clip/IgnorantZealousCheddarSeemsGood](https://m.twitch.tv/clip/IgnorantZealousCheddarSeemsGood)

Average endesga stream:

[https://m.twitch.tv/clip/TangentialCrazyGoshawkKappaRoss](https://m.twitch.tv/clip/TangentialCrazyGoshawkKappaRoss)

---

Awards:

[https://twitter.com/ENDESGA/status/987639110083854337?s=20&t=9a82zAggZtHTyBriq8iamg](https://twitter.com/ENDESGA/status/987639110083854337?s=20&t=9a82zAggZtHTyBriq8iamg)

Evolution of Keu:

[https://twitter.com/ENDESGA/status/867592735145865217?s=20&t=7q9VfLgR5I7uVp6bo7xewg](https://twitter.com/ENDESGA/status/867592735145865217?s=20&t=7q9VfLgR5I7uVp6bo7xewg)

---
---
---

# post mortem, ante vitam

It's quite interesting to think back on what I had made. The things I had accomplished.
Since I released the game it has left a bit of a scar. It never really became what I wanted.
But the interesting thing about this is that it was mostly due to my lack of skill. It's quite profound how much better of a developer I am, even from writing this older post.
A few days ago was my birthday, and it feels weird to think it's been more than 7 years since the Kickstarter... Time moves very fast, and it's hard to keep up.
The past couple years have involved a lot of growth, I've learned a lot, and have a few more mountains I'm still climbing. It's worth it though, the struggle to learn such complex things like Vulkan.
The future of NYKRA, hence the "ante vitam" part of the title (which means "before life"), is going to involve a much more thoughtful approach.
I was reading up on Tolkien's life, and I really do love the amount of time and care he put into everything. He finished TLotR books in his late 50s, which makes me feel a lot better haha.
When I was younger I had this insane rush to make Nykra (lowercase, since I mean the galaxy, not the game), but as I've gotten older I realised I want to pick at it for way longer.
What if I released the remake when I'm 77 years old? ... I'm kidding. But that'd be amusing.
I'm 27, and I have a LOT ahead of me. Can't wait for 37-me to read back on this and go "wow, I knew nothing".

I wish I had more to write about, but I really have just taken time over the past couple years to detach from NYKRA (the game this time) so I can assess what would be needed for it.
Despite that though, I've got a new full-time job. And I need to focus on that to fuel my future endeavours. It's amazing to be with a team again, and I can't wait to make cool things.

Onwards.

-edg
