//@desc On sort du sous-terrain
copine = noone;

with obj_escalier if destination = other.destination other.copine = id

if copine != noone
{

	obj_transition.mode = TRANS_MODE.INTRO;
	obj_transition.percent = 1;


	obj_joueur.room_current_x = copine.room_origine_x;
	obj_joueur.room_current_y = copine.room_origine_y;

	obj_joueur.x = copine.x;
	obj_joueur.y = copine.y;
	obj_joueur.t_salle = TYPE_SALLE.SURFACE;
	obj_joueur.frames_immobile = 30;

	with copine  instance_change(obj_escalier_remonte,false);

	if view_current == 0
	{
		camera_set_view_pos(view_camera[0], 256*obj_joueur.room_current_x ,176 *obj_joueur.room_current_y )
	}

}