

//========================================
if (my_hitboxID.attack == AT_DSPECIAL && my_hitboxID.hbox_num == 1)
{
    //add to article's hitpause
    var bomb = my_hitboxID.parent_bomb;
    if (bomb.hitstop < my_hitboxID.hitpause)
    { bomb.hitstop = my_hitboxID.hitpause; }
    
    //curently unused. but I could see it being useful
    //...maybe for a "double-donk" easter egg? up to you
    bomb.has_hit = true;
}

if haskapalla = true {
    kapalladamage += my_hitboxID.damage;
}