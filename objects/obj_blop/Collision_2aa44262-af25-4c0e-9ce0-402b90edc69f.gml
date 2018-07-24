/// @description ?

if item_version = 1
{
	with other event_user(11);
}

if item_version = 2
{
	with other event_user(12);
}

if item_version = 3
{
	//vérifie si il y a le joueur 
with instance_place(x,y,obj_joueur)
{
	if !invulnerable && !other.invulnerable
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


}

if item_version = 0
{
	//vérifie si il y a le joueur 
with instance_place(x,y,obj_joueur)
{
	if !invulnerable && !other.invulnerable
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


}