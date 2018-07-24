/// @desc Activation des bloc elementaires

alarm[2] = irandom_range(120,180);


if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y
{
	switch item_version 
	{
		//glace
		case 1 :
			{
				with instance_create_layer(x,y,"mob",obj_affichage_item_use) 
				{
					sprite_index = spr_cryo;
					image_xscale = 1.5;
					image_yscale = 1.5;
					son = false;
				}
				break;
			}
		//feu
		case 2 :
			{
				with instance_create_layer(x,y,"mob",obj_affichage_item_use) 
				{
					sprite_index = spr_flammes;
					image_xscale = 1.5;
					image_yscale = 1.5;
					son = false;
				}
				break;
			}
	}
}