/// @description change le mode en revenant de l'ecran de selection
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH
{
	obj_menu.mode = MENU_MODE.JEU
	room_goto(room_charge)	
} else 
{
	obj_menu.mode = MENU_MODE.CONSTRUCTION
}
