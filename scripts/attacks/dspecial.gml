set_attack_value(AT_DSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("dspecial"));
set_attack_value(AT_DSPECIAL, AG_NUM_WINDOWS, 2);
set_attack_value(AT_DSPECIAL, AG_HAS_LANDING_LAG, 10);
set_attack_value(AT_DSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_DSPECIAL, AG_AIR_SPRITE, sprite_get("dspecial"));
set_attack_value(AT_DSPECIAL, AG_HURTBOX_SPRITE, sprite_get("dspecial_hurt"));

//startup
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);
//set_window_value(AT_DSPECIAL, 1, AG_WINDOW_HSPEED_TYPE, 1);
//set_window_value(AT_DSPECIAL, 1, AG_WINDOW_VSPEED_TYPE, 1);

//throw
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_LENGTH, 25);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));

//grabbing
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));

set_num_hitboxes(AT_DSPECIAL, 0); //all handled by article

//Thown hitbox (overlayed on article)
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL, 1, HG_LIFETIME, 2); //lifetime depends on article, see hitbox_update.gml
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSPECIAL, 1, HG_WIDTH, 30);
set_hitbox_value(AT_DSPECIAL, 1, HG_HEIGHT, 30);
set_hitbox_value(AT_DSPECIAL, 1, HG_PRIORITY, 3);
//set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_GRAVITY, .6);
set_hitbox_value(AT_DSPECIAL, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 65);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, 0.4);
set_hitbox_value(AT_DSPECIAL, 1, HG_VISUAL_EFFECT_X_OFFSET, -16);
set_hitbox_value(AT_DSPECIAL, 1, HG_VISUAL_EFFECT_Y_OFFSET, -16);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITPAUSE_SCALING, 0.55);
set_hitbox_value(AT_DSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_shovel_hit_light1"));
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_ANIM_SPEED, .25);
//set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_HSPEED, 8);
//set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_VSPEED, -4);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_DESTROY_EFFECT, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_SPRITE, asset_get("empty_sprite")); //not visible
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_MASK, -1); //uses HG_SHAPE (default 0, circle hitbox)
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_UNBASHABLE, 1); //the article is bashed instead
set_hitbox_value(AT_DSPECIAL, 1, HG_PROJECTILE_PLASMA_SAFE, 1); //the article is killed instead

//Explosion hitbox (visible)
set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL, 2, HG_LIFETIME, 20);
set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSPECIAL, 2, HG_WIDTH, 80);
set_hitbox_value(AT_DSPECIAL, 2, HG_HEIGHT, 80);
set_hitbox_value(AT_DSPECIAL, 2, HG_PRIORITY, 3);
set_hitbox_value(AT_DSPECIAL, 2, HG_DAMAGE, 15);
set_hitbox_value(AT_DSPECIAL, 2, HG_ANGLE, 65);
set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DSPECIAL, 2, HG_KNOCKBACK_SCALING, 1.1);
set_hitbox_value(AT_DSPECIAL, 2, HG_VISUAL_EFFECT, 143);
set_hitbox_value(AT_DSPECIAL, 2, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_DSPECIAL, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_HITPAUSE, 4.25);
set_hitbox_value(AT_DSPECIAL, 2, HG_HITPAUSE_SCALING, 0.55);
set_hitbox_value(AT_DSPECIAL, 2, HG_HIT_SFX, asset_get("sfx_ell_fist_explode"));
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_ANIM_SPEED, .5);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_DESTROY_EFFECT, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_SPRITE, sprite_get("bombexplode"));
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_PROJECTILE_PLASMA_SAFE, 1); //an explosion touching the field doesnt destroy it