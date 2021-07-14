if (get_player_color(player) == 3){
for(i = 0; i < 7; i++){
set_character_color_shading(i, 0);
}
}

if (get_player_color(player) == 30){
for(i = 0; i < 7; i++){
set_character_color_shading(i, 0);
}
}

if (get_player_color(player) == 6){
set_character_color_shading(0, -1);
}

if (get_player_color(player) == 13){
set_character_color_shading(3, 2);
}