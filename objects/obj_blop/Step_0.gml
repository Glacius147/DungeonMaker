/// @desc Déplacement et action du perso

nb = 0;

if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y
{
		

	// application du mouvement
	hsp = (k_right - k_left)*vitesse_marche;
	vsp = (k_down - k_up)*vitesse_marche;


	//déplacement
	mask_index = sprite_index;
	scr_deplacement();
	

	
	if hsp + vsp = 0 scr_random_direction();
	
	
	
	//animation
	scr_animation();
	
	if item_version = 1 || item_version = 2 mask_index = spr_blop_mask;	
}
