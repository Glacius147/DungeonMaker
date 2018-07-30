/// @desc Mort si PV = 0;

//if pv <= 0 game_restart();

if pv <=0 and obj_menu.mode == MENU_MODE.JEU
{
	debug("test")
	obj_menu.mode = MENU_MODE.DEFEAT;
	obj_menu.alarm[5] = 180;
	obj_joueur.sprite_index = spr_defeat;	
}