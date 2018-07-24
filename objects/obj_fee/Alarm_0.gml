/// @desc choix d'une direction
if mode = MODE_BAT.REPOS
{
	mode = MODE_BAT.DECOLAGE
	vitesse = 0;
	dir_vol = irandom_range(0,359);
}
else
{
	mode = MODE_BAT.ATTERRISSAGE	
}




