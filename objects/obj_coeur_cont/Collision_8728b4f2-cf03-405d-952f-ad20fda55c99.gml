/// @descr HP ++
if actif
{
	other.pv_max = scr_approche(other.pv_max,10,1);
	other.pv = scr_approche(other.pv,10,1);
	audio_sound_pitch(son_pickup_vie,random_range(0.8,1.2));
	audio_play_sound(son_pickup_vie,2,0);
	instance_change(obj_master,false);
}