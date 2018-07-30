/// @desc souterain !
if actif and collision == obj_joueur.id
{
	with obj_escalier_bis {if (destination = other.destination) {other.copine = id;}}

	//sauvegarde de la position de depart
	x_t = obj_joueur.x;
	y_t = obj_joueur.y;

	//affichage de l'ecran noir
	obj_transition.mode = TRANS_MODE.INTRO;
	obj_transition.percent = 1;



	obj_joueur.room_current_x = 16;
	obj_joueur.room_current_y = destination;


	obj_joueur.x = copine.x;
	obj_joueur.y = copine.y + 16;
	obj_joueur.t_salle = TYPE_SALLE.SOUS_TERRE;
	obj_joueur.frames_immobile = 30;

	if view_current == 0
	{
		camera_set_view_pos(view_camera[0], 4096,176 * floor(destination))
}
}