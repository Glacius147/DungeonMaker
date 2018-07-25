/// @descr HP ++
if actif
{
	audio_sound_pitch(son_pickup_vie,random_range(0.8,1.2));
	audio_play_sound(son_pickup_vie,2,0);
	obj_joueur.pv = scr_approche(obj_joueur.pv, obj_joueur.pv_max, 5);
	instance_change(obj_master,false);
}