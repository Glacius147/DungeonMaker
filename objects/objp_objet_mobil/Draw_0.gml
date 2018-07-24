///@desc Affichage du blink

draw_self()

//affichage en blanc si touché
if blink > 0 
{
	shader_set(shader_blink);
	draw_self();
	shader_reset();
	blink --;
}



