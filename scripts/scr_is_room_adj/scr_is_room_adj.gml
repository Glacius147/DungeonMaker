/// @desc dit si la salle voisine est crée, 
//et si oui renvoie le obj_contour_salle qui matche la porte cliquée et sa corespondante
/// @arg x
/// @arg y

var x_ = argument[0];
var y_ = argument[1];

//var current_room_x = floor(x_/256)
//var current_room_y = floor(y_/176)
var result
result[0] = false
result[1] = noone
result[2] = noone

if (x_-r_x > 206){
	x_to = 1
	y_to = 0
} else if (x_-r_x < 50){
	x_to = -1
	y_to = 0
} else if (y_-r_y > 126){
	x_to = 0
	y_to = 1
} else if (y_-r_y*176 < 50){
	x_to = 0
	y_to = -1
} else{
 return result
}

if (current_room_x+x_to<0 or current_room_y+y_to<0) {return result;}
else if (current_room_x+x_to>15 or current_room_y+y_to>15) {return result;}
else
{
	if created_room[current_room_x+x_to,current_room_y+y_to]{
		has_dragon = false
		with obj_dragon{
			if (other.current_room_x+other.x_to == room_origine_x and other.current_room_y+other.y_to == room_origine_y) {other.has_dragon = true;}
		}
		if has_dragon {return result;}
		result[0] = true
		var item_to = instance_position(r_x+128 + x_to*(128+3*8),r_y+88+y_to*(88+3*8),objp_contour_salle);
		var item_from = instance_position(r_x+128 + x_to*(128-3*8),r_y+88+y_to*(88-3*8),objp_contour_salle);
		result[1] = item_to
		result[2] = item_from
		return result
	} else
	{
		return result	
	}
}