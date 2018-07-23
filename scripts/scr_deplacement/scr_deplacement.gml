/// @description scr_deplacement()
//deplacement horizontal
while (place_meeting(x+hsp,y,objp_solide) && hsp != 0)
{
	with instance_place(x+hsp,y,objp_solide)
	{
	collision = other.id;
	temp_hsp = other.hsp;
	event_user(15);
	}
	hsp = scr_approche(hsp,0,1);
}
x = x + hsp;

//deplacement vertical
while (place_meeting(x,y+vsp,objp_solide) && vsp != 0)
{
	with instance_place(x,y+vsp,objp_solide)
	{
	collision = other.id;
	temp_vsp = other.vsp;
	event_user(15);
	}
	vsp = scr_approche(vsp,0,1);
}
y = y + vsp;
