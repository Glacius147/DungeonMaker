/// @desc scr_attaque_monstre();
	
//vérifie si il y a qq dans la direction de l'épée


with instance_place(x,y,obj_joueur)
{
	if !invulnerable && !other.invulnerable
	{
		toto1 = x;
		toto2 = y;
		toto3 = other.x;
		toto4 = other.y;
		
		invulnerable = true;
		alarm[1] = frames_invulnerable;
		pv -= other.degats;
		blink = 6;
		event_user(0);
		audio_sound_pitch(son_hurt,random_range(0.8,1.2));
		audio_play_sound(son_hurt,2,0);
	}
}

