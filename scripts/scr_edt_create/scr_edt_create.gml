/// @desc crée un nouvel objet pour l'éditeur 
/// @arg x
/// @arg y
/// @arg type

//debug(ds_list_size(obj_list),nb_obj)

var x_ = argument[0];
var y_ = argument[1];
var type_ = argument[2];
var layer_ = global.map_item_layer[? string(type_)];

//Suppression d'un autre escalier avec la meme item_version
if type_==obj_escalier
{
	flag_dejacree = noone
	with obj_escalier
	{
		debug(item_version,other.item_version)
		if x<4096 and item_version == other.item_version
		{
			other.flag_dejacree = id  	
		}	
	}
	if flag_dejacree != noone {scr_edt_delete(flag_dejacree);}
}

var new_item = instance_create_layer(x_,y_,layer_,type_)

//malheureusement à recalculer parce qu'on ne cree pas toujours dans la room courante
t_room_x = x_ div 256
t_room_y = y_ div 176
t_r_x = t_room_x * 256
t_r_y = t_room_y * 176
//obj_list[| nb_obj].sprite_index = spr_dragon_edt
new_item.room_origine_x = t_room_x;
new_item.room_origine_y = t_room_y;
new_item.item_version = item_version;

//Spécificités
// dragon : mise des dégats à 0 pour qu'il ne tue pas les trucs à sa portée.
// Ne devrait pas être nécessaire
if (type_ == obj_dragon) {new_item.degats = 0;}



//mur et mur explosables : changement de la sprite
if type_ == obj_mur or type_ == obj_mur_explosable
{
	if ((x_ - t_r_x) = 16*8) {new_item.image_index = (y_ - t_r_y - 3 * 8) div (8*8);}
	if ((y_ - t_r_y) = 11*8) {new_item.image_index = 1 + ( (x_ - t_r_x - 3*8) div (13*8));}
}

if type_ == obj_porte or type_ == obj_porte_bloquee or type_ == obj_porte_fermee
{
	if ((x_ - t_r_x) = 16*8) {new_item.image_angle = 90*((y_ - t_r_y - 3*8) div (8*8));}
	if ((y_ - t_r_y) = 11*8) {new_item.image_angle = 90*( 1 + ((x_ - t_r_x - 3*8) div (13*8)) );}
}
//Changement du mask des portes et escaliers
if type_ == obj_porte or type_ == obj_escalier
{
	new_item.mask_index = spr_bloc	
}

// TODO : objp_contours salle : gestion de t_deco
if object_is_ancestor(type_,objp_contour_salle)
{
	
}

if type_ == obj_dependance
{
	new_item.origine_id = begin_arrow
	new_item.destination_id = item
	debug(item)
}




with new_item {event_user(7);}



if (type_ == obj_joueur)
{
	if (obj_list[| 0] != noone) {	instance_destroy(obj_list[| 0]);} else {nb_obj++;}
	obj_list[| 0] = new_item
} else
{
	ds_list_add(obj_list,new_item);
	nb_obj ++;
}
debug(new_item.nom,nb_obj)