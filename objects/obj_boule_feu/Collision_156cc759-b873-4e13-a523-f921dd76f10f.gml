/// @desc LE FEU CA BRULE !

with other 
{
	if !invulnerable
	{
		invulnerable = true;
		alarm[1] = frames_invulnerable;
		pv -= degats;
		blink = 6;
		event_user(0);
	}
}
instance_destroy();