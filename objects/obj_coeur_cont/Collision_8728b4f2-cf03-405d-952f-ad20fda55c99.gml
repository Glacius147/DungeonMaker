/// @descr HP ++
if actif
{
	obj_joueur.pv_max = scr_approche(obj_joueur.pv_max,10,1);
	obj_joueur.pv = scr_approche(obj_joueur.pv,10,1);
	audio_sound_pitch(son_pickup_vie,random_range(0.8,1.2));
	audio_play_sound(son_pickup_vie,2,0);
	instance_change(obj_master,false);
}