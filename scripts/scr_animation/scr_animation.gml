	/// @desc scr_animation();
	
	//annime le perso dans la direction de son déplacement
	
	//animation de frappe
if attaque || magnis_actif || torche_active
{
	if magnis_actif sprite_index = spr_joueur_magnis 
	else if	torche_active sprite_index = spr_joueur_torche;
	else sprite_index = spr_attaque;
	//choix de la direction
	switch dir_attaque
	{
		case DIR.LEFT :
		{
			image_index = 0;
			image_xscale = -1;
			break;
		}		
		
		case DIR.RIGHT :
		{
			image_index = 0;
			image_xscale = 1;
			break;
		}
				
				
		case DIR.UP :
		{
			image_index = 1;
			image_xscale = 1;
			break;
		}
		
		case DIR.DOWN :
		{
			image_index = 2;
			image_xscale = 1;
			break;
		}
		
	}
}
else
{
	//flag de deplacement
	immobile = true;
	//animation de deplacement
	if hsp < 0 || k_left
	{
		immobile = false;
		sprite_index = spr_right;
		image_xscale = -1;
		image_speed = 1;
	}

	if hsp > 0 || k_right
	{
		immobile = false;
		sprite_index = spr_right;
		image_xscale = 1;
		image_speed = 1;
	}
	
	if vsp < 0 || k_up
	{
		immobile = false;
		sprite_index = spr_up;
		image_xscale = 1;
		image_speed = 1;
	}
	
	if vsp > 0 || k_down
	{
		immobile = false;
		sprite_index = spr_down;
		image_xscale = 1;
		image_speed = 1;
	}
	
	//animation immobile
	if immobile 
	{
		//si fin d'attaque
		if sprite_index = spr_attaque || sprite_index = spr_joueur_magnis || sprite_index = spr_joueur_torche
		{
			switch dir_attaque
			{
				case DIR.LEFT :
				{
					sprite_index = spr_right;
					image_xscale = -1;
					break;
				}		
		
				case DIR.RIGHT :
				{
					sprite_index = spr_right;
					image_xscale = 1;
					break;
				}
				
				
				case DIR.UP :
				{
					sprite_index = spr_up;
					image_xscale = 1;
					break;
				}
		
				case DIR.DOWN :
				{
					sprite_index = spr_down;
					image_xscale = 1;
					break;
				}
		
			}					
		}
		//dans tous les cas, position immobile du sprite
		image_speed = 0;
		image_index = 1;
	}
}	