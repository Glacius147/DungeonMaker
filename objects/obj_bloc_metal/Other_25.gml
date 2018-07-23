/// @desc Bloc poussé par le joueur

if !place_meeting(x,y,obj_gel) || (hsp == 0 && vsp == 0) 
{
	hsp = temp_hsp;
	vsp = temp_vsp;
}



if collision == obj_joueur.id && actif
{
	
		while (place_meeting(x+hsp,y,objp_master_nongel) && hsp != 0)
		{
			hsp = scr_approche(hsp,0,1);
		}
		x = x + hsp;


		//deplacement vertical
		while (place_meeting(x,y+vsp,objp_master_nongel) && vsp != 0)
		{
			vsp = scr_approche(vsp,0,1);
		}
		y = y + vsp;

}