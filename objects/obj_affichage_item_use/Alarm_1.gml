/// @desc son

if sprite_index = spr_cryo
{
	audio_sound_pitch(son_hurt_cryo,random_range(0.8,1.2));
	audio_play_sound(son_hurt_cryo,2,0);	
}

if sprite_index = spr_flammes
{
	audio_sound_pitch(son_hurt_burn,random_range(0.8,1.2));
	audio_play_sound(son_hurt_burn,2,0);	
}
