/// @descr Changement de musique celon les modes d'obj_menu et obj_joueur

#region//musique par menu
if obj_menu.mode != mode
{
	mode = obj_menu.mode
	
	switch mode
	{
		case MENU_MODE.JEU :
		{
			if t_salle = TYPE_SALLE.SURFACE	scr_musique_change(son_musique)
				
			if t_salle = TYPE_SALLE.SOUS_TERRE	scr_musique_change(son_musique_under);
			break;	
		}
		case MENU_MODE.CONSTRUCTION :
		{
			scr_musique_change(son_musique_under)
			break;
		}
	}
	
}
#endregion

#region //musique par mode du joueur
if instance_exists(obj_joueur)
{
	if obj_joueur.t_salle != t_salle
	{
		t_salle = obj_joueur.t_salle
	
		switch t_salle
		{
			case TYPE_SALLE.SURFACE :
			{
				scr_musique_change(son_musique)
				break;	
			}	
			case TYPE_SALLE.SOUS_TERRE :
			{
				scr_musique_change(son_musique_under);
				break;	
			}	
		}
	}	
}
#endregion
