sprite_change_offset("idle", 32, 76);
sprite_change_offset("looking_up", 32, 76);
sprite_change_offset("hurt", 32, 62);
sprite_change_offset("crouch", 32, 76);
sprite_change_offset("crawl", 32, 76);
sprite_change_offset("walk", 32, 76);
sprite_change_offset("walkturn", 32, 62);
sprite_change_offset("dash", 32, 68);
sprite_change_offset("dashstart", 32, 62);
sprite_change_offset("dashstop", 32, 62);
sprite_change_offset("dashturn", 32, 62);

sprite_change_offset("jumpstart", 38, 76);
sprite_change_offset("jump", 38, 76);
sprite_change_offset("doublejump", 32, 62);
sprite_change_offset("walljump", 32, 62);
sprite_change_offset("pratfall", 32, 62);
sprite_change_offset("land", 32, 62);
sprite_change_offset("landinglag", 32, 62);

sprite_change_offset("parry", 32, 62);
sprite_change_offset("roll_forward", 32, 62);
sprite_change_offset("roll_backward", 32, 62);
sprite_change_offset("airdodge", 32, 62);
sprite_change_offset("waveland", 38, 76);
sprite_change_offset("tech", 32, 62);

sprite_change_offset("jab", 60, 88);
sprite_change_offset("dattack", 64, 94);
sprite_change_offset("ftilt", 32, 62);
sprite_change_offset("dtilt", 66, 88);
sprite_change_offset("utilt", 64, 94);
sprite_change_offset("nair", 54, 90);
sprite_change_offset("fair", 64, 94);
sprite_change_offset("bair", 64, 94);
sprite_change_offset("uair", 64, 94);
sprite_change_offset("dair", 64, 94);
sprite_change_offset("fstrong", 64, 94);
sprite_change_offset("ustrong", 64, 158);
sprite_change_offset("dstrong", 64, 94);
sprite_change_offset("nspecial", 64, 94);
sprite_change_offset("fspecial", 64, 94);
sprite_change_offset("uspecial", 64, 94);
sprite_change_offset("dspecial", 64, 94);
sprite_change_offset("taunt", 32, 62);

sprite_change_offset("plat", 64, 94);

sprite_change_offset("nspecial_proj", 64, 94);
sprite_change_offset("ropeproj", 32, 90);
sprite_change_offset("ropeidle", 30, 82);
sprite_change_offset("ropeform", 30, 82);
sprite_change_offset("ropedestroy1", 30, 82);
sprite_change_collision_mask( "ropedestroy1", true, 0, 0, 0, 0, 0, 0 );
sprite_change_collision_mask( "ropedestroy2", true, 0, 0, 0, 0, 0, 0 );
sprite_change_offset("ropedestroy2", 30, 82);
sprite_change_offset("bombidle", 35, 40);
sprite_change_offset("bombmask", 35, 40);
sprite_change_offset("bombexplode", 35, 40);

set_victory_theme( sound_get( "victory" ));
