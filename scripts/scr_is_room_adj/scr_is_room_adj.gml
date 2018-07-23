/// @desc dit si la salle voisine est crée, et si 
/// @arg x
/// @arg y

var x_ = argument[0];
var y_ = argument[1];

var current_room_x = floor(x_/256)
var current_room_y = floor(y_/176)
var result
result[0] = false
result[1] = noone

if (x_-current_room_x*256 > 206){
	var x_to = 1
	var y_to = 0
} else if (x_-current_room_x*256 < 50){
	var x_to = -1
	var y_to = 0
} else if (y_-current_room_y*176 > 126){
	var x_to = 0
	var y_to = 1
} else if (y_-current_room_y*176 < 50){
	var x_to = 0
	var y_to = -1
} else{
 return result
}

if current_room_x+x_to<0 or current_room_y+y_to<0{
	return result
} else if current_room_x+x_to>15 or current_room_y+y_to>15{
	return result
} else
{
	if created_room[current_room_x+x_to,current_room_y+y_to]{
		result[0] = true
		var item = instance_position(current_room_x*256+128 + x_to*(128+3*8),current_room_y*176+88+y_to*(88+3*8),obj_master);
		if item.object_index = obj_dragon{
			result[0] = false
		}
		result[1] = item
		return result
	} else
	{
		return result	
	}
}