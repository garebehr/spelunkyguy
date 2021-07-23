
      if (attack == AT_NSPECIAL && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && window > 1) {
          unsafeitemgettimer -= 0.1;
          if unsafeitemgettimer < 0 { unsafeitemgettimer = 0; }
    if (itemselect > 0 && itemselect < 500){
            draw_sprite_ext(sprite_get("items"), 2, x, y -100, 1, 1, 0, c_white, unsafeitemgettimer);
   }  else if (itemselect > 500 && itemselect < 1000){
            draw_sprite_ext(sprite_get("items"), 3, x, y - 100, 1, 1, 0, c_white, unsafeitemgettimer);
   } 
          } else { unsafeitemgettimer = 0; }
