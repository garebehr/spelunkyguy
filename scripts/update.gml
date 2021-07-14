//crawling
if(state == PS_CROUCH){
	can_move = true;
	if(right_down){  // moving right
		spr_dir = 1;
		hsp = 1;
		is_crawling = true; 
	}
	
	if(left_down){  // moving left
		spr_dir = -1;
		hsp = -1;
		is_crawling = true; 
	}
	
	if(joy_pad_idle){ // making sure you don't move while you aren't crawling
		hsp = 0;
		is_crawling = false; 
	}
}
else{
	is_crawling = false;
}


//ROPES

if (state != PS_ATTACK_GROUND)
{
   // found_rope is the rope you are currently touching
   var found_rope = noone
   with (obj_article1) if (player_id == other)
    {
        if state == 3 {
            closetorope = false;
        } else if place_meeting(x,y,other) {
      //maybe check for closest rope directly?
     {
         found_rope = self;
         break;
      }
   }}
    closetorope = (noone != found_rope)
} 
else 
{
    closetorope = false;
}


if ((state == PS_IDLE_AIR || state == PS_IDLE || state == PS_WALK || state == PS_DASH || state == PS_FIRST_JUMP || state == PS_DOUBLE_JUMP || state == PS_WALL_JUMP) && state != PS_PRATFALL && closetorope = true && ropetimeractive = false && (down_down || up_down))
{
   hsp = 0;
   vsp = 0;
   x = found_rope.x;
   ropeclimb = true;
} 



if state == PS_PRATFALL || state == PS_HITSTUN {
    ropeclimb = false;
}

if ropeclimb = true {
    hsp = 0;
    vsp = 0;
} 

if closetorope = false {
    ropeclimb = false;
}


 if jump_pressed && ropeclimb = true {
    ropeclimb = false;
    vsp -= 7.5;
    ropetimeractive = true;
}

if ropetimeractive = true {
    ropetimer += .1;
    closetorope = false;
    ropeclimb = false;
}

if ropetimer > 2.75 {
 ropetimeractive = false;
 ropetimer = 0;
}

if ropeclimb = true && ropetimeractive = false {
    if up_down {
        vsp -= 3.5;
    } if down_down {
        vsp += 3.5;
    }
}

//==================================
//Bomb stuff
if (holding_bomb_id != noone)
{
    if (instance_exists(holding_bomb_id))
    {
        //move the bomb with you (adjust offsets if required)
        holding_bomb_id.x = x + 12 * spr_dir;
        holding_bomb_id.y = y - 24;
        
        if (state_cat == SC_HITSTUN)
        {
            //drop bomb on hit?
            //holding_bomb_id.bufferedstate = 0; //idle
            //holding_bomb_id = noone;
        }
    }
    else
    {
        //somehow lost a bomb
        holding_bomb_id = noone;
    }
}
//==================================