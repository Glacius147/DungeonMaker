/// @desc Objet activant desactive !

for (i = 0; i < array_length_1d(objets_dependants); i++)
{
	 objets_dependants[i].actif = false;
}

/*
if array_length_1d(objets_dependants) > 0 
{
	audio_sound_pitch(son_activation,random_range(0.8,1.2));
	audio_play_sound(son_activation,2,0);
}

