//when you are crawling, it plays the crawling animation. it's that simplelist
if (state == PS_CROUCH && hsp != 0){
	if(is_crawling == true){
		sprite_index = sprite_get("crawl");
		image_index = state_timer / 10;
	}
}

// looking up
if (sprite_index == sprite_get("idle") && up_down){
	looking_up = true;
	sprite_index = sprite_get("looking_up");
}
else{
	looking_up = false;
}

if(looking_up == true){
	image_index = sprite_index;
	
	if(image_index >= 2 && up_down){
		image_index = 2;	
	}
	
	if(joy_pad_idle){
		image_index = 3;
		image_index++;
	}
	
}