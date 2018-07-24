/// @desc Objet activant active !
activant_on = true;

for (i = 0; i < array_length_1d(objets_dependants); i++)
{
	 var id_temp = objets_dependants[i];
	 var flag = false;
	 with obj_master
	 {
		 for (j = 0; j < array_length_1d(objets_dependants); j++)
		 {
			if id_temp = objets_dependants[j] && !activant_on flag = true;		 
		 }
	}
	 
	if !flag id_temp.actif = true;
}



if array_length_1d(objets_dependants) > 0 
{
	audio_sound_pitch(son_activation,random_range(0.8,1.2));
	audio_play_sound(son_activation,2,0);
}