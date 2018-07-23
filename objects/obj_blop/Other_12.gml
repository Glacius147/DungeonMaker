/// @descr direction random

nb ++

var i = irandom_range(1,4);

k_left = false;
k_right = false;
k_up = false;
k_down = false;
	

switch i
{
	case 1 : k_left = true; break;
	case 2 : k_right = true; break;
	case 3 : k_up = true; break;
	case 4 : k_down = true; break;
}

//pour eviter les bug si le mob est incapable de bouger
if nb < 10
{
	// application du mouvement
	hsp = (k_right - k_left)*vitesse_marche;
	vsp = (k_down - k_up)*vitesse_marche;


	//déplacement
	scr_deplacement();
	
	if hsp + vsp = 0 event_user(2);
}