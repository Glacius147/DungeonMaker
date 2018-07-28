/// @desc lancement de l'alarm

enum MODE_BAT
{
	REPOS,
	DECOLAGE,
	VOL,
	ATTERRISSAGE
}


mode = MODE_BAT.REPOS;

if obj_menu.mode != MENU_MODE.CONSTRUCTION{
alarm[0] = irandom_range(40,120);
alarm[2] = irandom_range(200,400);
}