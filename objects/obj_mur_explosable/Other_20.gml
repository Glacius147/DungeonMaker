/// @desc caboom
image_angle = 90 * image_index;

mask_index = spr_masque_test;
with instance_place(x,y,obj_mur_explosable) 	
{
	image_angle = 90 * image_index;
	instance_change(obj_mur_casse,true);	
}

instance_change(obj_mur_casse,true);
