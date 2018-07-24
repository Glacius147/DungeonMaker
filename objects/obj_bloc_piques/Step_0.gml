/// @description ?
if instance_exists(obj_joueur) && obj_menu.mode = MENU_MODE.JEU
{

if mode = MODE_PIC.REPOS 
{
	if abs(obj_joueur.x-x) < 20
	{
		vsp = vitesse_marche * sign(obj_joueur.y-y);
		hsp = 0;
		mode = MODE_PIC.CHARGE;		
		hsp_base = hsp;
		vsp_base = vsp;	
	}
	if abs(obj_joueur.y-y) < 20
	{
		hsp = vitesse_marche * sign(obj_joueur.x-x);
		vsp = 0;
		mode = MODE_PIC.CHARGE;	
		hsp_base = hsp;
		vsp_base = vsp;
	}
}

if mode = MODE_PIC.RETOUR
{
	//deplacement horizontal
	while (place_meeting(x+hsp,y,obj_master) && hsp != 0)
	{
		if place_meeting(x+hsp,y,objp_objet_mobil)
		{
			collision = instance_place(x+hsp,y,objp_objet_mobil)
			event_user(1);
		}
		hsp = scr_approche(hsp,0,1);
	}
	x = scr_approche(x,xstart,abs(hsp));
	
	//deplacement vertical
	while (place_meeting(x,y+vsp,obj_master) && vsp != 0)
	{
		if place_meeting(x,y+vsp,objp_objet_mobil)
		{
			collision = instance_place(x,y+vsp,objp_objet_mobil)
			event_user(1);
		}
		vsp = scr_approche(vsp,0,1);
	}
	y = scr_approche(y,ystart,abs(vsp));
	
		vsp = - vsp_base/2;
		hsp = - hsp_base/2;

	if x = xstart && y = ystart mode = MODE_PIC.REPOS
}


if mode = MODE_PIC.CHARGE
{
	//deplacement horizontal
	while (place_meeting(x+hsp,y,obj_master) && hsp != 0)
	{
		if place_meeting(x+hsp,y,objp_objet_mobil)
		{
			collision = instance_place(x+hsp,y,objp_objet_mobil)
			event_user(1);
		}
		hsp = scr_approche(hsp,0,1);
	}
	x = x + hsp;
	
	//deplacement vertical
	while (place_meeting(x,y+vsp,obj_master) && vsp != 0)
	{
		if place_meeting(x,y+vsp,objp_objet_mobil)
		{
			collision = instance_place(x,y+vsp,objp_objet_mobil)
			event_user(1);
		}
		vsp = scr_approche(vsp,0,1);
	}
	y = y + vsp;
	
	if vsp == 0 && hsp == 0 
	{
		mode = MODE_PIC.RETOUR
		vsp = - vsp_base/2;
		hsp = - hsp_base/2;
	}
}


}


