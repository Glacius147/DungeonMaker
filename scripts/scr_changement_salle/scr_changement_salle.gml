/// @desc scr_changement_salle(x_to,y_to)
/// @arg x_destination
/// @arg y_destination

var x_to = argument0;
var y_to = argument1;



with obj_joueur
{
	if !place_meeting(x + x_to * 64,y + y_to * 64,objp_solide)
	{
		obj_menu.percent2 = 0;

		obj_menu.x_to = x_to;
		obj_menu.y_to = y_to;
		obj_menu.x_cam_depart = camera_get_view_x(view_camera[0]);
		obj_menu.y_cam_depart = camera_get_view_y(view_camera[0]);
		obj_menu.x_joueur_depart = obj_joueur.x;
		obj_menu.y_joueur_depart = obj_joueur.y;

		obj_menu.mode = MENU_MODE.CHANGEMENT_SALLE;
		
		//reset de la salle d'arrivée
		with obj_master
		{
			if room_origine_x = obj_joueur.room_current_x + x_to && room_origine_y = obj_joueur.room_current_y + y_to && id != obj_joueur.id
			{
				x = xstart;
				y = ystart;
				event_user(7);
			}	
		}

	}
}
