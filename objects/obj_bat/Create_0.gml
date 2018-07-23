/// @desc lancement de l'alarm

enum MODE_BAT
{
	REPOS,
	DECOLAGE,
	VOL,
	ATTERRISSAGE
}


mode = MODE_BAT.REPOS;
alarm[0] = irandom_range(40,120);
alarm[2] = irandom_range(200,400);