/// @descr degats joueur


with collision
{
	if !invulnerable
	{
		invulnerable = true;
		alarm[1] = frames_invulnerable;
		pv -= other.degats;
		blink = 6;
		event_user(0);
		audio_sound_pitch(son_hurt,random_range(0.8,1.2));
		audio_play_sound(son_hurt,2,0);
	}
}
