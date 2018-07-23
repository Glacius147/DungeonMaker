///@desc cryo

if !invulnerable
{
	invulnerable = true;
	alarm[1] = frames_invulnerable;
	pv -= 1;
	blink = 6;
	
	cryo = true;
	alarm[11] = 120;
	
	event_user(0);
}