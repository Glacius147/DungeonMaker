/// @desc Gestion de version

image_angle = 90*item_version;

if obj_menu.mode = MENU_MODE.JEU
{
	mask_index = spr_back_victoire;
	with instance_create_layer(x,y,"salles",obj_bordure)
	{
		visible = false;
		image_angle = other.image_angle;
	}
	with instance_create_layer(x,y,"salles",obj_bordure)
	{
		visible = false;
		image_angle = other.image_angle - 90;
	}
}