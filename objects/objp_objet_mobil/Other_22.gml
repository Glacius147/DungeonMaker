///@desc torche

if !invulnerable
{
	invulnerable = true;
	alarm[1] = frames_invulnerable;
	pv -= 1;
	blink = 6;
	
	alarm[11] = 120;
	audio_sound_pitch(son_hurt_burn,random_range(0.8,1.2));
	audio_play_sound(son_hurt_burn,2,0);
	event_user(0);
}