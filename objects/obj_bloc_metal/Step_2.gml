/// @desc

if obj_menu.mode = MENU_MODE.JEU 
{
	if magnis_cible && !obj_joueur.magnis_actif  magnis_cible = false

	if magnis_cible && abs(obj_joueur.x-x) <= 48 && abs(obj_joueur.y-y) <= 48
	{
		vsp = obj_joueur.vsp;
		hsp = obj_joueur.hsp;
	}			

	//deplacement horizontal
	while (place_meeting(x+hsp,y,objp_master_nongel) && hsp != 0)
	{
		hsp = scr_approche(hsp,0,1);
	}
	x = x + hsp;
	
	if abs(obj_joueur.x-x) && magnis_cible > 48 x = x - hsp;
	
	//deplacement vertical
	while (place_meeting(x,y+vsp,objp_master_nongel) && vsp != 0)
	{
		vsp = scr_approche(vsp,0,1);
	}
	y = y + vsp;
	
	if abs(obj_joueur.y-y) && magnis_cible > 48 y = y - vsp;
	
}