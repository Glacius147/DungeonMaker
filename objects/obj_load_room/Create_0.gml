/// @description Charge un lvl sauvegardé
// You can write your code in this editor

//

file = obj_select.file

var buff = buffer_load(file);
map = json_decode(buffer_read(buff, buffer_text));
buffer_delete(buff);

//table des salles crées
var i;
var j;
for (i = 0; i < 17; i += 1)
{
	for (j = 0; j < 16; j += 1)
	{
		if i==16 and j<6
		{
			obj_menu.created_room[i , j] = true
		}else
		{
			obj_menu.created_room[i , j] = false
		}
	}
}


var origines;
var destinations;

origines[0]=noone;
destinations[0] = noone;
var count=1;
var list_obj;

var size;
size = ds_map_size(map);

//Création du joueur en premier
#region
for (i = 0; i < size; i++;)
{
	item = map[? "item"+string(i)];
	item_type = global.list_item[item[? "type"]];
	if item_type == string(obj_joueur)
	{
		
		item_x = item[? "x"];
		item_y = item[? "y"];
		item_px = item[? "piece x"];
		item_py = item[? "piece y"];
		item_sprite = item[? "sprite"];
		item_angle = item[? "angle"];
		var item_version = item[? "item_version"];
		if is_undefined(item_version) {item_version = 0;}
		var new_item = instance_create_layer(item_x,item_y,"mob",item_type)
		{
		new_item.image_index = item_sprite;
		new_item.image_angle = item_angle;
		new_item.room_origine_x = item_px;
		new_item.room_origine_y = item_py;
		new_item.item_version = item_version;
		}
		list_obj[i] = new_item
		with new_item{
			event_user(7)	
		}

	}
}
#endregion


for (i = 0; i < size; i++;)
	{
	item = map[? "item"+string(i)];
	item_type = global.list_item[item[? "type"]];
	item_x = item[? "x"];
	item_y = item[? "y"];
	item_px = item[? "piece x"];
	item_py = item[? "piece y"];
	item_sprite = item[? "sprite"];
	item_angle = item[? "angle"];
	var item_version = item[? "item_version"];
	if is_undefined(item_version) {item_version = 0;}
	if item_type == string(obj_mur_salle){
		var new_item = instance_create_layer(item_x,item_y,"salles",item_type)
		salle_x = round(item_x/256)
		salle_y = round(item_y/176)
		obj_menu.t_deco = item_sprite;
		obj_menu.created_room[salle_x,salle_y] = true
	} else if (item_type == string(obj_eau) or item_type == string(obj_gel) or item_type == string(obj_escalier) or item_type == string(obj_bloc_inter) or item_type == string(obj_mur) or item_type == string(obj_mur_explosable))
	{
		var new_item = instance_create_layer(item_x,item_y,"mur_exploses",item_type)
	}
	else if object_is_ancestor(item_type, objp_objet_mobil) and item_type != string(obj_joueur)
	{
		var new_item = instance_create_layer(item_x,item_y,"mob",item_type)
	} else if item_type == string(obj_dependance)
	{
		origines[count] = item[? "origine"];
		destinations[count] = item[? "destination"];
		count++
		var new_item = noone;
	} 
	else
	{
		var new_item = instance_create_layer(item_x,item_y,"items",item_type)
	}
	if item_type == string(obj_escalier)
	{
		new_item.destination = item[? "destination"];	
	}
	if new_item != noone and item_type != string(obj_joueur) // pour les dépendances et les joueur deja créé
	{
	new_item.image_index = item_sprite;
	new_item.image_angle = item_angle;
	new_item.room_origine_x = item_px;
	new_item.room_origine_y = item_py;
	new_item.item_version = item_version;
	list_obj[i] = new_item
	with new_item{
		event_user(7)	
	}
	}
}

for (var i = 1; i < array_length_1d(origines); ++i) {
    list_obj[origines[i]].objets_dependants[array_length_1d(list_obj[origines[i]].objets_dependants)] = list_obj[destinations[i]]
	list_obj[destinations[i]].actif = false;
}

id_bg = layer_background_get_id("Background")
if obj_menu.t_deco = TYPE_DECO.BOTW
{
	layer_background_change(id_bg,spr_sol)
} else if obj_menu.t_deco = TYPE_DECO.GLACE
{
						
	layer_background_change(id_bg,spr_sol_glace)
}else if obj_menu.t_deco = TYPE_DECO.DESERT
{
						
	layer_background_change(id_bg,spr_sol_desert)
}

with obj_joueur
{
	event_user(1);
}