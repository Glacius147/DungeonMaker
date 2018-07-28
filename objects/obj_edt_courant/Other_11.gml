/// @description load lvl
// You can write your code in this editor

obj_menu.mode = MENU_MODE.CONSTRUCTION

file = obj_select.file

//Vidange de l'éditeur
//TODO : comprendre pourquoi nb_obj ne marche pas ici
for (var i = 0; i < ds_list_size(obj_list); ++i) {
	instance_destroy(obj_list[| i])
}
obj_list = ds_list_create();;
nb_obj = 0

//pas encore de joueur créé
ds_list_add(obj_list,noone)


//Chargement
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
			created_room[i , j] = true
		}else
		{
			created_room[i , j] = false
		}
	}
}


var origines;
var destinations;

origines[0]=noone;
destinations[0] = noone;
var count=0;


var size;
size = ds_map_size(map);
nb_obj = size

for (i = 0; i < size; i++;)
{
	item_ = map[? "item"+string(i)];
	item_type = real(global.list_item[item_[? "type"]]);
	item_x = item_[? "x"];
	item_y = item_[? "y"];
	item_sprite = item_[? "sprite"];
	item_version = item_[? "item_version"];
	if item_type == (obj_mur_salle){
		scr_edt_create(item_x,item_y,item_type)
		salle_x = item_x div 256;
		salle_y = item_y div 176;
		obj_menu.t_deco = item_sprite;
		created_room[salle_x,salle_y] = true
	}
	else if item_type == (obj_dependance)
	{
		origines[count] = item_[? "origine"];
		destinations[count] = item_[? "destination"];
		count++
		begin_arrow = obj_list[| item_[? "origine"]];
		item = obj_list[| item_[? "destination"]];
		scr_edt_create(item_x,item_y,item_type)
		begin_arrow = noone
		item = noone
	}
	else
	{
			scr_edt_create(item_x,item_y,item_type)
	}

	
}
/*

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
	item_version = item[? "item_version"];
	//if is_undefined(item_version) {item_version = 0;}
	if item_type == string(obj_mur_salle){
		var new_item = instance_create_layer(item_x,item_y,"salles",item_type)
		salle_x = round(item_x/256);
		salle_y = round(item_y/176);
		obj_menu.t_deco = item_sprite;
		created_room[salle_x,salle_y] = true
	} else if object_is_ancestor(item_type, objp_contour_salle)
	{
		var new_item = instance_create_layer(item_x,item_y,"mur_exploses",item_type)
	} else if item_type == string(obj_dependance)
	{
		origines[count] = item[? "origine"];
		destinations[count] = item[? "destination"];
		count++
		var new_item = instance_create_layer(item_x,item_y,"Instances_dep",item_type);
		new_item.origine_id = obj_list[| item[? "origine"]];
		new_item.destination_id = obj_list[| item[? "destination"]];
	} else
	{
		var new_item = instance_create_layer(item_x,item_y,"Instances",item_type)
	}
	if item_type == string(obj_escalier)
	{
		new_item.destination = item[? "destination"];
		//Modifs temporaires pour backward compatibility
		if new_item.destination <3 {new_item.item_version = new_item.destination;}
		else {new_item.item_version = 3+round((new_item.destination-3)*2);}
	}
	
	if item_type ==string(obj_porte){
		new_item.mask_index = spr_bloc
	}
	if new_item != noone
	{
	new_item.image_index = item_sprite;
	new_item.image_angle = item_angle;
	new_item.room_origine_x = item_px;
	new_item.room_origine_y = item_py;
	new_item.item_version = item_version;
	with new_item{
		event_user(7)	
	}
								
	}
	ds_list_add(obj_list,new_item)
	if item_type == string(obj_joueur){	
		current_player = new_item
	}
}

*/

id_bg = layer_background_get_id("Backgrounds")
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
sprite_index = spr_joueur_down
current_type = obj_joueur
item_version = 0
former_sprite_index = spr_joueur_down
former_current_type = obj_joueur

scr_edt_mode(EDITEUR_MODE.NORMAL)