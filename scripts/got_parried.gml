//got_parried.gml


//========================================
if (my_hitboxID.attack == AT_DSPECIAL && my_hitboxID.hbox_num == 1)
{
    //bomb hitbox can't reflect, needs to reflect its article!
    my_hitboxID.parent_bomb.hsp *= -1;
    my_hitboxID.parent_bomb.vsp *= -1;
    my_hitboxID.can_hit_self = true;
}