///@desc Plouf

with other
{
	show_debug_message(string(x));
	show_debug_message(string(y));
	show_debug_message(string(other.x));
	show_debug_message(string(other.y));
	
	
	x = x_origine_salle;	
	y = y_origine_salle;
	
	
	invulnerable = true;
	alarm[1] = 60;
	pv -= 1;
	blink = 60;
	event_user(0);	
	
	
}

