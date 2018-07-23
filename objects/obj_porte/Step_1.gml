/// @description ?

if !pose_sur_mur && obj_menu.mode = MENU_MODE.CHANGEMENT_SALLE
{
	with instance_create_depth(x,y,-120,obj_porte_haut) 
	{
		image_index = other.image_index;	
		image_angle = other.image_angle;
	}
	pose_sur_mur = true;
}