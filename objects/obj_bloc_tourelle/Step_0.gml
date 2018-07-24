/// @desc tir

/// @desc tir une boule de feu



if room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && !magnis_cible && obj_menu.mode = MENU_MODE.JEU && !actif
{
	alarm_0 --
	
	if alarm_0 <= 0
	{
		alarm_0 = irandom_range(240,300);
	
		with instance_create_layer(x,y-13,"mob",obj_boule_feu)
		{
			direction = point_direction(x,y,obj_joueur.x,obj_joueur.y);
		}
	}
}


