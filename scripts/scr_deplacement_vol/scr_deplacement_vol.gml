/// @description scr_deplacement()
//deplacement horizontal
while (place_meeting(x+hsp,y,objp_contour_salle) && hsp != 0)
{
	hsp = scr_approche(hsp,0,1);
	event_user(7);
}
x = x + hsp;

//deplacement vertical
while (place_meeting(x,y+vsp,objp_contour_salle) && vsp != 0)
{
	vsp = scr_approche(vsp,0,1);
	event_user(7);
}
y = y + vsp;
