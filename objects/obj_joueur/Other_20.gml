/// @desc degats d'explosion

if !invulnerable
{
	invulnerable = true;
	alarm[1] = frames_invulnerable;
	pv -= 1;
	blink = 6;
	event_user(0);
}
