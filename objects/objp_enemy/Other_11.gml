/// @desc Activation de l'event "tout le monde est mort ici capitaine !"

var flag = false

with objp_enemy
{
	//On vérifie si il reste qq de vivant ici
	if room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && id != other.id
	{
		flag = true
	}
}

if !flag
{
	with obj_fantome
	{
	//On active les objets associés
		if room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y 
		{
			event_user(5);
		}
	}
}