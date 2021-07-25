hurtbox_spr = asset_get("ex_guy_hurt_box");
crouchbox_spr = asset_get("ex_guy_crouch_box");
air_hurtbox_spr = -1;
hitstun_hurtbox_spr = -1;

char_height = 52;
idle_anim_speed = .15;
crouch_anim_speed = .1;
walk_anim_speed = .15;
dash_anim_speed = .25;
pratfall_anim_speed = .25;

walk_speed = 2.75
walk_accel = 0.175;
walk_turn_time = 6;
initial_dash_time = 10;
initial_dash_speed = 7.5;
dash_speed = 6.5;
dash_turn_time = 10;
dash_turn_accel = 1.5;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .5;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 12;
short_hop_speed = 8;
djump_speed = 12;
leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 7; //the maximum hsp you can have when jumping from the ground
air_max_speed = 7; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = .85; //multiplier of air_accel while in pratfall
air_friction = .02;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 7;
walljump_vsp = 11;
walljump_time = 32;
can_wall_cling = false;
max_fall = 13; //maximum fall speed without fastfalling
fast_fall = 16; //fast fall speed
gravity_speed = .65;
hitstun_grav = .5;
knockback_adj = 1.0; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 4; //normal landing frames
prat_land_time = 3;
wave_land_time = 8;
wave_land_adj = 1.35; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .04; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 2;
crouch_active_frames = 1;
crouch_recovery_frames = 2;

//parry animation frames
dodge_startup_frames = 1;
dodge_active_frames = 1;
dodge_recovery_frames = 3;

//tech animation frames
tech_active_frames = 3;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 2
techroll_active_frames = 2;
techroll_recovery_frames = 2;
techroll_speed = 10;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 2;
air_dodge_recovery_frames = 3;
air_dodge_speed = 7.5;

//roll animation frames
roll_forward_startup_frames = 2;
roll_forward_active_frames = 4;
roll_forward_recovery_frames = 2;
roll_back_startup_frames = 2;
roll_back_active_frames = 4;
roll_back_recovery_frames = 2;
roll_forward_max = 9; //roll speed
roll_backward_max = 9;

land_sound = sound_get("land");
landing_lag_sound = sound_get("land");
waveland_sound = sound_get("sfx_waveland_zet");
jump_sound = sound_get("jump");
djump_sound = sound_get("jump_cape");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

//crawl
is_crawling = false;


// looking up
looking_up_startup_frames = 2;
looking_up_active_frames = 1;
looking_up_recovery_frames = 2;

looking_up = false;

killarticles = false;

//================================
//ropes stuff
ropestock = 4;

closetorope = false;
ropeclimb = false;
ropeid = noone;
ropetimeractive = false;
ropetimer = 0;

//================================
//bombs stuff
bombstock_max = 4;
bombstock = bombstock_max;
holding_bomb_id = noone;  //the bomb you're currently holding (if any)


//================================
// NSPECIAL Item data
items_sprite = sprite_get("items");
                                       //name, weight, sprite, subimage, animation 
nspecial_itemlist[0] = make_nspecial_item("bomb bag", 10, items_sprite, 2, 1);
nspecial_itemlist[1] = make_nspecial_item("bomb box",  3, items_sprite, 3, 1);
nspecial_itemlist[2] = make_nspecial_item("rope",     10, items_sprite, 7, 1);
nspecial_itemlist[3] = make_nspecial_item("spring shoes",     5, items_sprite, 12, 1);
nspecial_itemlist[4] = make_nspecial_item("royal jelly",     3, items_sprite, 16, 1);
nspecial_itemlist[5] = make_nspecial_item("climbing gloves",     5, items_sprite, 14, 1);

itemselect = 0;
unsafe_itemgettimer = 0; //WARNING! runs in draw-time, not game-time. NEVER USE ON GAMEPLAY STUFF or INSTANT DESYNC
itemgettimer_max = 10;

//================================================
#define make_nspecial_item(name, weight, sprite, image, anim_frames)
{
    return { name: name, 
             base_weight: weight, 
             weight: weight, 
             image: image,
             sprite: sprite,
             anim_frames: anim_frames
           }
}
//=================================================