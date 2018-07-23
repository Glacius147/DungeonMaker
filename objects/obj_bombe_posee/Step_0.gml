/// @desc clignotement puis caboom

image_speed = scr_approche(image_speed,1,0.005);

if image_speed = 1 
{
	audio_sound_pitch(son_explosion,random_range(0.8,1.2));
	audio_play_sound(son_explosion,2,0);
	instance_change(obj_bombe_explose,true);
}

