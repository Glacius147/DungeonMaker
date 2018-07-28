/// @desc crée un nouvel objet pour l'éditeur 
/// @arg x
/// @arg y
/// @arg type

var x_ = argument[0];
var y_ = argument[1];
var type_ = argument[2];
var layer_ = global.map_item_layer[? type_];


var new_item = instance_create_layer(x_,y_,layer_,type_)
//obj_list[| nb_obj].sprite_index = spr_dragon_edt
new_item.room_origine_x = current_room_x
new_item.room_origine_x = current_room_x
new_item.item_version = item_version;

//Spécificités
// dragon : mise des dégats à 0 pour qu'il ne tue pas les trucs à sa portée.
// Ne devrait pas être nécessaire
if (type_ == obj_dragon) {new_item.degats = 0;}

//mur et mur fissurés : changement de la sprite
if type_ == obj_mur
{
	if ((x_-r_x) = 16*8) {new_item.image_index = (y_-r_y-3*8) div (8*8);}
	if ((y_-r_y) = 11*8) {new_item.image_index =1+( (x_-r_x-3*8) div (13*8));}
}

// TODO : objp_contours salle : gestion de t_deco
if object_is_ancestor(type_,objp_contour_salle)
{
	
}

with new_item {event_user(7);}

ds_list_add(obj_list,new_item);
nb_obj ++;

debug(new_item.nom,nb_obj)