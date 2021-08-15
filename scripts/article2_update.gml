//article1_update - runs every frame the article exists

/*STATE LIST
--1 (NOT A STATE DO NOT USE)
- 0 Idle
- 1 Held by someone
- 2 Thrown
- 3 Explosion!
- 4 No Explosion...
- 5 Ori's version of HELD
*/
#macro STATE_NONE  -1 
#macro STATE_IDLE   0 
#macro STATE_HOLD   1
#macro STATE_THROW  2
#macro STATE_BOOM   3
#macro STATE_FIZZLE 4
#macro STATE_BASHED 5

// no logic allowed if we're currently in hitstop
if (hitpause) exit;

//Get hurt by opponents' hitbox (NOTE: does not work properly with maxarticles > 1)
// could be of use to knock bomb around?
/*
with (asset_get("pHitBox"))
{
    if (place_meeting(x,y,other.id) && other.player_id != player_id)
    {
        other.hitstop = 10; //Article freeze frames
        hitpause = true;    //Player freeze frames
        hitstop = 10;       //Player freeze frames, cont.
    }
}
*/

print(free);


// Respond to a request to change states
if (bufferedstate != STATE_NONE)
{
	set_state(bufferedstate);
	bufferedstate = STATE_NONE;
}

// Check for death conditions
if (state != STATE_FIZZLE) 
{ 
	check_clairen_field(); 
	check_blast_zone();
}

// Detect Ori's interference
if (getting_bashed && state != STATE_BASHED)
{
    set_state(STATE_BASHED);
}

//update pickup flag for spelunkers
can_pick_up = (state == STATE_IDLE);

//Update
switch (state)
{
//======================================================
	case STATE_HOLD: //Held
	{
		//don't move while being carried
		hsp = 0; vsp = 0;
		//reset bash status
		bashed_id = noone;
	}break;
//======================================================
	case STATE_THROW: //Thrown
	{
					if player_id.haspaste = true && !free {
			hsp = 0;
			vsp = 0;
			sound_play(sound_get("pastestick"));
			set_state(STATE_IDLE);
	} 
		if (state_timer <= 1)
		{
	    	//spawn the throwing hitbox
			state_timer = 1;
			spawn_hitbox(AT_DSPECIAL, 1);
		}
		//apply physics
		do_gravity();
		do_friction();
		do_bounce();

		
		//once we touch the ground, go to IDLE state.
		if (!free) 
		{ 
			set_state(STATE_IDLE);
		}
	}break;
//======================================================
	case STATE_IDLE: //Idle
	{
					if player_id.haspaste = true && !free {
			hsp = 0;
			vsp = 0;
			//sound_play
	} 
			if player_id.haspaste = false {	
		do_gravity();
		do_friction();
		do_bounce(); 
		} else {
		vsp = 0;
		hsp = 0;
		} 
	}break;
//======================================================
	case STATE_BOOM: //Exploding
	{
		hsp = 0; vsp = 0;
		//spawn the explosion
		spawn_hitbox(AT_DSPECIAL, 2);
		sound_play(sound_get("explosion"));
        
        //animation is handled by the Explosion's projectile hitbox
        //article can be deleted.
        instance_destroy(); exit;
	}break;
//======================================================
	case STATE_FIZZLE: //Dying quietly
	{
		//Update
		hsp = 0; vsp = 0;
		if (place_meeting(x, y, asset_get("plasma_field_obj")) && !(state == 3 || state == 2)) {
	    sound_play(asset_get("sfx_clairen_hit_med"));
		}
	    //TODO: get a hitfx here? or animate the article itself?
	    
        //if animation is handled by a hitfx the article can be deleted.
        instance_destroy(); exit;
	}break;
//======================================================
	case STATE_BASHED: //waiting to be thrown (by Ori)
	{
		if (!getting_bashed)
		{
			//stopped getting bashed:
			//return to spelunky
			player_id = orig_player_id;
			//ThrowMs hitbox will consider Ori's bashing to determine who gets hit
			set_state(STATE_THROW);
		}
	}break;
//======================================================
//unknown state -> go to IDLE
	default: set_state(STATE_IDLE); break;
}

//Animation
sprite_index = spr_bomb_idle;
if (bomb_fuse_timer < 50)
{
    //last second flashes through the animation
    image_index = floor((50 - bomb_fuse_timer) / 2);
}
else
{
    image_index = 0;
    //"debug mode": showing which state it is
    if (state == STATE_HOLD) image_index = 0; //small black
    else if (state == STATE_IDLE) image_index = 7; //big black
    else if (state == STATE_THROW) image_index = 8; //red
    else if (state == STATE_BASHED) image_index = 9; //yellow
}
image_angle -= hsp; //rolling effect >:]

//Make time progress
state_timer++;

bomb_fuse_timer--;
// Ori can be bashing the bomb while its trying to explode... 
// just to be safe, explode in his face just after its done
if (bomb_fuse_timer < 0 && (state == STATE_IDLE || state == STATE_HOLD || state == STATE_THROW))
{
    set_state(STATE_BOOM);
}


//=====================================================
// call to make the bomb change states and reset state_timer.
#define set_state(new_state)
{
    state = new_state;
    state_timer = 0;
    has_hit = false;
}
//==============================================================================
// call to make the bomb accelerate down over time.
// vsp is increased by bomb_gravity each frame, but cannot go faster than bomb_terminal_vsp.
#define do_gravity()
{
    if (free && vsp < bomb_terminal_vsp) vsp += bomb_gravity;
}
//==============================================================================
// call to make the bomb slow down over time.
// hsp is reduced depending on bomb_air_friction and bomb_ground_friction.
#define do_friction()
{
	if (hsp != 0)
	{
	    hsp = sign(hsp) * max(0, abs(hsp) - (free ? bomb_air_friction 
	                                              : bomb_ground_friction));
	}
}
//==============================================================================
// call to make the bomb bounce when landing.
// vsp is multiplied by bomb_bounce_percent and pointed upwards.
#define do_bounce()
{
	var bounce_speed = abs(prev_vsp * bomb_bounce_percent)
	//update for next frame
	prev_vsp = vsp;
	
	if (!free && bounce_speed > 3)
	{
		vsp = -bounce_speed;
	}
}
//==============================================================================
// call to check if the bomb is in clairen's no-fun-zone.
#define check_clairen_field()
{
    if (place_meeting(x, y, asset_get("plasma_field_obj"))) 
    {
	    set_state(STATE_FIZZLE);
    }
}
//==============================================================================
// call to check if the bomb fell off the stage.
#define check_blast_zone()
{
    if (y > room_height)
    {
        //fell off the stage 
	    set_state(STATE_FIZZLE);
    }
}
//==============================================================================
// spawns atk's hnum's hitbox at this article's position.
// not... ideal, but hitbox-specific logic happens here.
// NOTE: To use a hitbox properly with an article, it MUST be a projectile! (hitbox type 2)
#define spawn_hitbox(atk, hnum)
{
    var hb = noone;
    //ask the last holder to spawn the hitbox so that it is detected as "theirs"
    with (last_held_by_id) { hb = create_hitbox(atk, hnum, other.x, other.y); }
    hb.spr_dir = spr_dir;
    
    if (hnum == 1) // Bomb Donk
    {
        hb.parent_bomb = self;
        if instance_exists(bashed_id)
        {
        	//hitbox direction is Oris direction
            hb.spr_dir = bashed_id.spr_dir;
            
        	//dont hit the Ori that just threw you
        	hb.can_hit[bashed_id.player] = false;
            hb.can_hit_self = true;
            
            //dont get put in parrystun for parrying a bashed bomb
            hb.projectile_parry_stun = 0;
        }
    }
    else //Explosion: hits everyone
    {
        hb.can_hit_self = true;
    }
    
    return hb;
}