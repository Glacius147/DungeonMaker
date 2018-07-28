/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();


if (item_version<3) 
{
	destination = item_version;

}
else 
{
	destination = 3+(item_version-3)/2
}

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
	image_index = item_version+3			
}