/// @desc Mort si PV = 0;

if pv <= 0 
{
	event_user(1);
	pv = 2;
	scr_loot();
	visible = false;
	x = -10;
	y = -10;
	image_index = 0; 
	image_speed = 1;
}