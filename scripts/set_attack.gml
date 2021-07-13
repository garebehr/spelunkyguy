

//===========================================
//Holding a bomb = any attack is a bomb toss
if (holding_bomb_id != noone)
{
    attack = AT_DSPECIAL; exit;
}
//===========================================


if (attack == AT_USPECIAL && ropestock == 0){
    attack = AT_USPECIAL_2;
}


