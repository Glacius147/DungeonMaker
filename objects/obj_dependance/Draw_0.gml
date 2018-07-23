/// @description Insert description here
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
image_angle = point_direction(origine_id.x, origine_id.y, destination_id.x, destination_id.y);

image_xscale=point_distance(origine_id.x, origine_id.y, destination_id.x, destination_id.y)/16

draw_self()

draw_sprite_ext(spr_fleche_pointe,0,destination_id.x,destination_id.y,1,1,image_angle,c_white,image_alpha)
}