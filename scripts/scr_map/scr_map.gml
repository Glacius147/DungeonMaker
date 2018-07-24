
//contour map
	
	draw_set_color(c_black);

with obj_mur_salle if vu 
{
	x1_t = other.x_b + 68 + room_origine_x * 9;
	x2_t = other.x_b + 68 + room_origine_x * 9 + 6;
	y1_t = other.y_b -100 + room_origine_y * 5 ;
	y2_t = other.y_b -100 + room_origine_y * 5 + 2;

	draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
}


with objp_passage if vu 
{
	x1_t = other.x_b + 68 + room_origine_x * 9;
	y1_t = other.y_b -100 + room_origine_y * 5;
	
	switch scr_wrap(image_angle,0,359)
	{
		case 0 :
		{
			x1_t += 3;
			x2_t = x1_t;
			y1_t -= 1;
			y2_t = y1_t 
			draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
			break;
		}
		case 90 :
		{
			x1_t -= 1;
			x2_t = x1_t;
			y1_t += 1;
			y2_t = y1_t 
			draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
			break;
		}
		case 180 :
		{
			x1_t += 3;
			x2_t = x1_t;
			y1_t += 3;
			y2_t = y1_t 
			draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
			break;
		}
		case 270 :
		{
			x1_t += 7;
			x2_t = x1_t;
			y1_t += 1;
			y2_t = y1_t 
			draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
			break;
		}
		
	}
	

	
}

with obj_joueur 
{
	x1_t = other.x_b + 68 + room_current_x * 9;
	x2_t = other.x_b + 68 + room_current_x * 9 + 6;
	y1_t = other.y_b -100 + room_current_y * 5 ;
	y2_t = other.y_b -100 + room_current_y * 5 + 2;

	draw_set_color(c_red);
	draw_rectangle(x1_t , y1_t , x2_t , y2_t , false);
}

