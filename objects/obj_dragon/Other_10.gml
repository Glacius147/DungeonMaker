/// @desc Mort si PV = 0;

if pv <= 0 
{
	event_user(1);
	mode = MODE_DRAKE.MORT;
	sprite_index = spr_dragon_mort;
}

