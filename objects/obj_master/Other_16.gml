/// @desc Objet activant desactive !

for (i = 0; i < array_length_1d(objets_dependants); i++)
{
	objets_dependants[i].actif = false;
}

activant_on = false;