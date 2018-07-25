/// @desc nombre de mob restant
nb = 0;

with objp_enemy
{
	//On vérifie si il reste qq de vivant ici
	if room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y 
	{
		other.nb ++
	}
}

//show_debug_message(nb)
