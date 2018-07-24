/// @desc Ne s'affiche que si activé

if actif 
{
	draw_self();
	mask_index = sprite_index;
}
else
{
	mask_index = spr_back_victoire;
}
