/// @desc crée un nouvel objet pour l'éditeur 
/// @arg x
/// @arg y
/// @arg type
/// @arg layer ?

var x_ = argument[0];
var y_ = argument[1];
var type_ = argument[2];
var layer_ = argument[3];


var new_item = instance_create_layer(x_,y_,layer_,type_)
//obj_list[| nb_obj].sprite_index = spr_dragon_edt
new_item.room_origine_x = current_room_x
new_item.room_origine_x = current_room_x
new_item.item_version = item_version;

//Spécificités
if (type_ == obj_dragon) {new_item.degats = 0;}
//if object_is_ancestor(type_,objp_t) and 

with new_item {event_user(7);}

ds_list_add(obj_list,new_item);
nb_obj ++;

debug(new_item.nom,nb_obj)