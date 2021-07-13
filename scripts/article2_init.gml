//article2_init - runs once, when the article is created

//=============================================================================
//sprites in use
spr_bomb_idle = sprite_get("bombidle");
spr_bomb_explode = sprite_get("bombexplode");

spr_collision_mask = sprite_get("bombmask");
//=============================================================================

//Sprite and direction
sprite_index = spr_bomb_idle;     //The sprite that the article will (initially) use. 
mask_index = spr_collision_mask;  //Collision sprite for the article.
image_index = 0;                  //The frame in the animation the article should start at. 0 = beginning of animation
spr_dir = player_id.spr_dir;      //The direction the article should face when it spawns. Here I have it set to face the same way as the character
uses_shader = true;               //Whether or not the article is recolored according to the character's color.gml and costume.

//State
state = 0;        //The behavior state the article should start in.
state_timer = 0;  //The point in time during that state the article should start in. (0 = beginning)
hitstop = 0;      //The frames remaining in hitpause. Hitpause automatically prevents movement

//State buffering (for if the article is busy when you send it a state command)
bufferedstate = -1;     //The state fed to the article by the player. Set this in your character's code, and the article will set itself to the requested state as long as it's available within 20 frames of the input

//Physics
hsp = 0;
vsp = 0;
prev_vsp = 0; //used to detect landing & compute bounce

//Terrain behavior
can_be_grounded = true;  //Determines if the article follows platforms when free == false.
ignores_walls = false;   //Determines if the article goes through walls.
free = true;             //Whether the article is in the air or not.
hit_wall = false;        //If the article moves into a wall on its own, this variable will be true.

//Ori's compat (built-in variables, but not in the manual... thanks Dan)
unbashable = 0;
getting_bashed = false;
bashed_id = noone;

//=============================================================================
//balance constants
// if you need to change attributes of the article, this is where to go
bomb_gravity = 0.45;         //change in vsp per frame
bomb_terminal_vsp = 12;      //gravity stops accelerating if you go faster
bomb_bounce_percent = 0.4;   // % of vsp kept when bouncing
bomb_air_friction = 0.01;    //change in hsp per frame
bomb_ground_friction = 0.25; //change in hsp per frame (grounded)

bomb_fuse_time_max = 150;      //time until boom (in frames)

//=============================================================================

//useful flags
last_held_by_id = player_id;          //id of the player that last held this bomb
bomb_fuse_timer = bomb_fuse_time_max; //if this reaches zero, bomb explodes.
can_pick_up = false;                  //if true, can be picked up by any spelunky player
has_hit = false;                      //to check if a target was hit in the throw
