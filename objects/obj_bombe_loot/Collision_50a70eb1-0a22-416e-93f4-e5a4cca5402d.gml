/// @descr HP ++
if actif
{
	audio_sound_pitch(son_pickup,random_range(0.8,1.2));
	audio_play_sound(son_pickup,2,0);
	obj_joueur.bombes += 4;
	obj_joueur.bombes_possede = true;
	instance_change(obj_master,false);
}