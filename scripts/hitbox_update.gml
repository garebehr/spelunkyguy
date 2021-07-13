if (attack == AT_USPECIAL && hitbox_timer == 25)
{
    with (player_id) 
    {
        ropeid = instance_create(other.x,other.y,"obj_article1");
    }
    instance_destroy(); exit;
}

//=========================================================
//Bomb Stuff
if (attack == AT_DSPECIAL && hbox_num == 1)
{
    if (instance_exists(parent_bomb) && parent_bomb.state == 2)
    {
        //set hitbox at the correct position for next frame's bomb position
        //Rivals physics is strange like that
        x = parent_bomb.x + parent_bomb.hsp;
        y = parent_bomb.y + parent_bomb.vsp;
        
        //force hitbox active as long as the article is falling
        hitbox_timer = 0;
        
        in_hitpause = (parent_bomb.hitpause);
    }
    else
    {
        destroyed = true; exit;
    }
}
//=========================================================