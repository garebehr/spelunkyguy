//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

if (attack == AT_NSPECIAL){
    if (window == 3){
        if (special_pressed){
            window = 1;
            window_timer = 0;
        }
    }
}

if (attack == AT_FSPECIAL){
    if (window == 2){
        if (special_pressed){
            window = 3;
            window_timer = 0;
            destroy_hitboxes();
        }
    }
    can_fast_fall = false;
}


if (attack == AT_USPECIAL && window == 2 && window_timer == 1){
    ropestock -= 1;
}

if (attack == AT_USPECIAL && window == 2 && special_down){
    set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -6);
set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_USPECIAL, 3, AG_WINDOW_TYPE, 7);
    
}
//==================================================================
//Bomb stuff
if (attack == AT_DSPECIAL)
{
    if (window == 1 && window_timer == 1) && (holding_bomb_id == noone)
    {
        //try grabbing a bomb first
        var found_bomb = collision_circle(x, y+12, 40, obj_article2, false, true)
        if (found_bomb != noone)  //found something
        && (found_bomb.player_id.url == url) //its a spelunky article2
        && (found_bomb.can_pick_up) //and it's ready for pickup
        {
            holding_bomb_id = found_bomb;
            holding_bomb_id.bufferedstate = 1; //Held
            holding_bomb_id.can_pick_up = false; //THIS IS MINE NOW
            holding_bomb_id.last_held_by_id = self; //last held by ME!
            
            window = 3; //put grab animation here
            window_timer = 0;
        }
    }
    if (window == 2 && window_timer == 1)
    {
        if (holding_bomb_id == noone)
        {
            //Note: the following block could very well be moved into window 1
            if (bombstock > 0)
            {
                //create a new bomb if you dont have one
                holding_bomb_id = instance_create(x, y-24, "obj_article2");
                bombstock--; //consumes one stock
            }
            else 
            {
                //bombless DSPECIAL
                set_attack(AT_DSPECIAL_2);
            }
        }
        
        if instance_exists(holding_bomb_id)
        {
            var throw_hsp = 5;
            var throw_vsp = -6;
            //Examples of what to do to give a thrown bomb a new trajectory depending on joystick
            //if (!free && down_down)
            //{
            //    throw_hsp = 2;
            //    throw_vsp = 0;
            //}
            //else if (!joy_pad_idle)
            //{
            //    throw_hsp = lengthdir_x(8, joy_dir);
            //    throw_vsp = lengthdir_y(8, joy_dir);
            //}
            
            //throw that bomb
            holding_bomb_id.bufferedstate = 2; //throw state
            holding_bomb_id.vsp = throw_vsp;
            holding_bomb_id.hsp = throw_hsp * spr_dir;
            holding_bomb_id.depth = depth - 1; //to draw in front of you
            holding_bomb_id = noone;
        }
    }
}