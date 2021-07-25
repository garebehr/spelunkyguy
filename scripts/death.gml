killarticles = true;
shoulddie = true;

ropestock = 4;
bombstock = bombstock_max;

//=========================================
//NSPECIAL STUFF
    unsafe_itemgettimer = 0;
    can_wall_cling = false;
    char_height = 52;
    jump_sound = sound_get("jump");
    jump_speed = 12;

//=========================================
//dropping the bomb
if (holding_bomb_id != noone)
{
    instance_destroy(holding_bomb_id);
    holding_bomb_id = noone;
}