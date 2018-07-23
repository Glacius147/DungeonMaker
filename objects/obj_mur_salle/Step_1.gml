/// @description ?

if !pose_sur_mur && obj_menu.mode = MENU_MODE.CHANGEMENT_SALLE
{
	with instance_create_depth(x,y,-100,obj_mur_salle_up) image_index = other.image_index;	
	pose_sur_mur = true;
}