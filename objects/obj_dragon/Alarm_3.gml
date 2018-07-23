/// @desc Tir !

if mode = MODE_DRAKE.BURST
{
	alarm[3] = 30;
	
	x_t = x;
	y_t = y;
	
	switch image_index
	{
		case 0 :
		{
			x_t += -60;
			y_t += 32;
			break;
		}
		case 1 :
		{
			x_t += -26;
			y_t += 44;
			break;
		}
		case 2 :
		{
			x_t += 0;
			y_t += 56;
			break;
		}
		case 3 :
		{
			x_t += 37;
			y_t += 46;
			break;
		}
		case 4 :
		{
			x_t += 60;
			y_t += 32;
			break;
		}
	}
	with instance_create_layer(x_t,y_t,"mob",obj_boule_feu)
	{
		direction = random_range(-15,15) + point_direction(x,y,obj_joueur.x,obj_joueur.y);
		vitesse_marche = 1.5;
	}
	
}