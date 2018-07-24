/// @desc Bloc poussé par le joueur

hsp = temp_hsp;
vsp = temp_vsp;


if collision == obj_joueur.id && actif && deplacement_effectue < sprite_height
{
	// On enregistre la direction du 1° deplacement
	if hsp_ini == 0 and vsp_ini == 0 and !place_meeting(x+hsp,y+vsp,obj_master) 
	{
		hsp_ini = hsp;
		if hsp = 0 vsp_ini = vsp;
	}
	
	//Si on déplace dans le même sens qu'au départ
	if sign(hsp_ini) = sign(hsp) && sign(vsp_ini) = sign(vsp)	
	{
		//deplacement horizontal
		
		while (place_meeting(x+hsp,y,obj_master) && hsp != 0)
		{
			hsp = scr_approche(hsp,0,1);
		}
		x = x + hsp;


		//deplacement vertical
		while (place_meeting(x,y+vsp,obj_master) && vsp != 0)
		{
			vsp = scr_approche(vsp,0,1);
		}
		y = y + vsp;

		deplacement_effectue += abs(hsp) + abs(vsp);
		if deplacement_effectue >= sprite_height event_user(5);
	}
}