/// @desc Mort si PV = 0;

if pv <= 0 
{
	event_user(1);
	pv = 2;
	scr_loot();
	instance_create_layer(x,y,"mob",obj_mob_mort); 
	visible = false;
	x = -10;
	y = -10;
	image_index = 0; 
	image_speed = 1;
}