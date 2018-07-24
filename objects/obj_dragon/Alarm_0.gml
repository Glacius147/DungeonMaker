/// @desc burst !
if mode != MODE_DRAKE.MORT 
{
	alarm[2] = irandom_range(180,360);
	mode = MODE_DRAKE.BURST;
	sprite_index = spr_dragon_feu;
	alarm[3] = 60;
}


