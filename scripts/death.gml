killarticles = true;

ropestock = 4;
bombstock = bombstock_max;

//=========================================
//dropping the bomb
if (holding_bomb_id != noone)
{
    instance_destroy(holding_bomb_id);
    holding_bomb_id = noone;
}