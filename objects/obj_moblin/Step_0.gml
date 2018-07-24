/// @desc Déplacement et action du perso
nb = 0;

if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && !cryo
{
		

	// application du mouvement
	hsp = (k_right - k_left)*vitesse_marche;
	vsp = (k_down - k_up)*vitesse_marche;


	//déplacement
	scr_deplacement();
	
	if (hsp + vsp = 0 || random(1)<0.01) && marche  scr_random_direction();
	
	
	
	
	//animation
	scr_animation();
	
	//attaque
	scr_attaque_monstre();
}
