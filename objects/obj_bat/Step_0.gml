/// @desc Déplacement et action du perso

if obj_menu.mode = MENU_MODE.JEU && room_origine_x = obj_joueur.room_current_x && room_origine_y = obj_joueur.room_current_y && !cryo
{
		

	// application du mouvement
	hsp = dcos(dir_vol)*vitesse_marche*vitesse;
	vsp = dsin(dir_vol)*vitesse_marche*vitesse;

	//déplacement
	scr_deplacement_vol();
	
	//gestion vitesse
	
	dir_vol += rotation;
	
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
	
	
	
	
	//animation	
	if mode != MODE_BAT.REPOS
	{
	image_speed = vitesse;
	if hsp != 0
	{
		sprite_index = spr_right;
		image_xscale = sign(hsp);
	}
	
	if vsp < -abs(hsp) 
	{
		sprite_index = spr_up;
		image_xscale = 1;
	}
	
	if vsp > abs(hsp) 
	{
		sprite_index = spr_down;
		image_xscale = 1;
	}
	}
	else
	{
		sprite_index = spr_down;
		image_xscale = 1;
		image_speed = 0;
	}
	
	//attaque
	scr_attaque_monstre();
}
