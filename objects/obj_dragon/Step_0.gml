// regarde le joueur


if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && !cryo && mode != MODE_DRAKE.MORT
{
	dir_joueur = floor(scr_wrap( 90 + point_direction(x,y,obj_joueur.x,obj_joueur.y),-180,180));
	
	if dir_joueur < -45 
	{
		image_index = 0;
	}
	
	if -45 < dir_joueur && dir_joueur < -15 
	{
		image_index = 1;
	}
	
	if -15 < dir_joueur && dir_joueur  < 15 
	{
		image_index = 2;
	}
	
	if 15 < dir_joueur && dir_joueur  < 45 image_index = 3;
	
	if 45 < dir_joueur image_index = 4;
	

	
}

scr_attaque_monstre();