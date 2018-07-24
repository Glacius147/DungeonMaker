/// @desc utilisation des objets

//on chope la direction

//vérifie si il y a qq dans la direction du regard

var x_t1 = x;
var y_t1 = y;
	
//Coordonnées de l action
switch dir_attaque
{
	case DIR.RIGHT :
	{
		x_t1 += 16;
		break;
	}
	case DIR.LEFT :
	{
		x_t1 -= 16;			
		break;
	}
	case DIR.UP :
	{
		y_t1 -= 16;
		break;
	}
	case DIR.DOWN :
	{
		y_t1 += 16;
		break;
	}
}



switch objet_b
{
	case spr_bombe :
	{
		if bombes > 0
		{
			bombes --;
			instance_create_layer(x,y,"items",obj_bombe_posee);	
			break;
		}
	}
	case spr_cryo :
		{
			with instance_create_layer(x_t1,y_t1,"mob",obj_affichage_item_use) 
			{
				sprite_index = spr_cryo;
			}
			break;
		}
	case spr_magnis :
		{
			with instance_create_layer(x_t1,y_t1,"mob",obj_affichage_item_use) 
			{
				sprite_index = spr_magnis;
			}
			magnis_actif = true;
			break;
		}
	case spr_torche :
		{
			with instance_create_layer(x_t1,y_t1,"mob",obj_affichage_item_use) 
			{
				sprite_index = spr_flammes;
			}
			torche_active = true;
			alarm[0] = 20;
			break;
		}
}