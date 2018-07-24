/// @descr Actualisation de la version en fonction de item_version

degats = 0.5;

switch item_version
{
	//eau
	case 0 :
	{
		spr_right = spr_blop_right;
		spr_up = spr_blop_up;
		spr_down = spr_blop_down;	
		break;
	}
	//glace
	case 1 :
	{
		spr_right = spr_blop_right_glace;
		spr_up = spr_blop_up_glace;
		spr_down = spr_blop_down_glace;		
		break;
	}
	//feu
	case 2 :
	{
		spr_right = spr_blop_right_feu;
		spr_up = spr_blop_up_feu;
		spr_down = spr_blop_down_feu;		
		break;
	}
	//elec
	case 3 :
	{
		spr_right = spr_blop_right_elec;
		spr_up = spr_blop_up_elec;
		spr_down = spr_blop_down_elec;	
		degats = 1;
		break;
	}
}

visible = true;

if obj_menu.mode != MENU_MODE.JEU sprite_index = spr_down;
	