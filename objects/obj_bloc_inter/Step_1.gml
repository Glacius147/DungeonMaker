//appuyé ?

if place_meeting(x,y,obj_joueur) || place_meeting(x,y,obj_bloc_metal)
{
	image_index = 1;
	if !enclenche 
	{
		enclenche = true;
		event_user(5);
	}
}
else
{
	image_index = 0;	
	if enclenche 
	{
		enclenche = false;
		event_user(6);
	}
}