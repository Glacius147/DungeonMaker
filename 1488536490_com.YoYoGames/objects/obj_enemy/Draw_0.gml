//Draw sprite
draw_self();
//Draw white flash sprite if recently hit (uses "hit" for alpha/transparency)
draw_sprite_ext(spr_enemy_flash,0,x,y,image_xscale,image_yscale,image_angle,c_white,hit);
