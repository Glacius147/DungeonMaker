/// @desc Gestion des versions

if item_version = 1 
{
	activant_on = true;
	event_user(5);
	alarm[0] = 1;
}	
else 
{
	activant_on = false;
	event_user(6);
}