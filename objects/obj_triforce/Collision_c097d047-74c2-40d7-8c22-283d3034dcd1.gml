/// @descr HP ++
if actif
{
	obj_menu.mode = MENU_MODE.VICTOIRE;
	obj_menu.alarm[5] = 180;
	obj_joueur.sprite_index = spr_victoire;
	instance_change(obj_master,false);
}