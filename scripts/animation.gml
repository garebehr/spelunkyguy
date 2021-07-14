//when you are crawling, it plays the crawling animation. it's that simplelist
if (state == PS_CROUCH && hsp != 0){
	if(is_crawling == true){
		sprite_index = sprite_get("crawl");
		image_index = state_timer / 10;
	}
}