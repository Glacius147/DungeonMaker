/// @desc Mort si PV = 0;

if pv <= 0 
{
	event_user(1);
	instance_change(obj_mob_mort,true); 
	image_index = 0; 
	image_speed = 1;
	if random(1)<0.5 instance_create_layer(x,y,"items",obj_coeur)
}

