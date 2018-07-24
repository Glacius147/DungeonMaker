
//mini map

	
	//draw_rectangle(x_b + 6,y_b + 6,x_b + 75,y_b + 59,false);
	
	draw_set_color(c_black);

with obj_mur_salle if vu 
{
	x1_t = other.x_b + 10 + room_origine_x * 4;
	x2_t = x1_t + 2;
	y1_t = other.y_b + 9 + room_origine_y * 3 ;
	y2_t = y1_t + 1;

	draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
}



with obj_joueur
{
	x1_t = other.x_b + 10 + room_current_x * 4;
	x2_t = x1_t + 2;
	y1_t = other.y_b + 9 + room_current_y * 3 ;
	y2_t = y1_t + 1;

	draw_set_color(c_red);
	draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
}