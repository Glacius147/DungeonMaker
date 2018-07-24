///@desc torche

if !invulnerable
{
	invulnerable = true;
	alarm[1] = frames_invulnerable;
	if id = obj_joueur pv -= 0.5 else pv -= 1;
	blink = 6;
	event_user(0);
}