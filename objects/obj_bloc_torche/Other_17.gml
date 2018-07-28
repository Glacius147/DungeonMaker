/// @desc Gestion des versions

if obj_menu.mode = MENU_MODE.CONSTRUCTION
{
	image_index = item_version
	if item_version = 1 
	{
		activant_on = true;
	}	
	else 
	{
		activant_on = false;
	}
}
else
{
	if item_version = 1 
	{
		activant_on = true;
		event_user(5);
		alarm[0] = 1;
	}	
	else 
	{
		activant_on = false;
		event_user(6);
	}
}