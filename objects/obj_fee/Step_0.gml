/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y
{
		

	// application du mouvement
	hsp = dcos(dir_bat)*vitesse_marche*vitesse;
	vsp = dsin(dir_bat)*vitesse_marche*vitesse;

	//déplacement
	scr_deplacement_vol();
	
	//gestion vitesse
	
	dir_bat += rotation;
	
	if mode = MODE_BAT.DECOLAGE
	{
		vitesse += 0.01	
		if vitesse == 1 mode = MODE_BAT.VOL
		{
			alarm[0] = irandom_range(120,300);
		}
	}
	
	if mode = MODE_BAT.ATTERRISSAGE
	{
		vitesse -= 0.01	
		if vitesse == 0 mode = MODE_BAT.REPOS
		{
			alarm[0] = irandom_range(40,120);
		}
	}
	
	
	

//	image_speed = vitesse;

}
