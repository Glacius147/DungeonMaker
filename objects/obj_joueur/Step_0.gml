/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.JEU && frames_immobile <= 0
{
	scr_input();
	
	if 	magnis_actif && !k_objet magnis_actif = false;
	
	// On ne prend en compte que la direction la plus recente (l autre est dans dir_precedente)
	switch dir_actuelle
	{
		case DIR.LEFT :
		{
		//si la touche est tjs apuyée mais qu'une autre direction est aussi demandée, on ne prend en compte que la nouvelle
			if k_left
			{
				if (k_up || k_down)
				{
					k_left = false;
					break;
				}
			}
		//sinon on prend en compte la seule touche enclenchée.
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		
		case DIR.RIGHT :
		{
			if k_right
			{
				if (k_up || k_down)
				{
					k_right = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		
		case DIR.UP :
		{
			if k_up
			{
				if (k_right || k_left)
				{
					k_up = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}			
		case DIR.DOWN :
		{
			if k_down
			{
				if (k_right || k_left)
				{
					k_down = false;
					break;
				}
			}
			else
			{
				scr_direction_actuelle();
				break;
			}
			
		}
		case DIR.REPOS :
		{
			scr_direction_actuelle();
			break;
		}
	}
	
	// application du mouvement sauf sur le gel
	if !place_meeting(x,y,obj_gel) || (hsp == 0 && vsp == 0) || bottes_fer
	{
		hsp = (k_right - k_left)*vitesse_marche;
		vsp = (k_down - k_up)*vitesse_marche;
	}
	
	if t_salle = TYPE_SALLE.SOUS_TERRE && !position_meeting(x,y,objp_echelles) && !position_meeting(x,y+8,objp_echelles)
	{
		vsp = 1.5;
	}

	// on arrete le mouvement en cas d'attaque
	if (kp_attaque && !attaque) 
	{
		attaque = true;
		alarm[0] = duree_sword;
	}

	if attaque && (!place_meeting(x,y,obj_gel) || bottes_fer)
	{
		hsp = 0;
		vsp = 0;
	}



	if !attaque
	{
		if k_up dir_attaque = DIR.UP;
		if k_down dir_attaque = DIR.DOWN;
		if k_right dir_attaque = DIR.RIGHT;
		if k_left dir_attaque = DIR.LEFT;
		if kp_objet scr_objet_use();
	}

	//déplacement
	if (!magnis_actif && !torche_active) || (place_meeting(x,y,obj_gel)&& !bottes_fer)	scr_deplacement();
	
	//animation
	scr_animation();
	
	// gestion dégats infligés
	if attaque scr_attaque();
	
}
else
{
	if frames_immobile > 0 frames_immobile --;
}

