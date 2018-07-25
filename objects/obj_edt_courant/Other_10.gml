/// @description Sauvegarde
// You can write your code in this editor


file = obj_select.file



nb_obj = ds_list_size(obj_list)

var i_map = ds_map_create();
var i ;
for (i = 0; i<nb_obj; i++)
{
	//if obj_list[i].object_index == obj_mur_salle
	{
	item_map_ds = ds_map_create();
	converted_type = global.map_item_index[? string(obj_list[| i].object_index)];
	ds_map_add(item_map_ds, "type",converted_type);
	ds_map_add(item_map_ds, "x",obj_list[| i].x);
	ds_map_add(item_map_ds, "y",obj_list[| i].y);
	p_x = floor(obj_list[| i].x/256)
	p_y = floor(obj_list[| i].y/176)
	ds_map_add(item_map_ds, "piece x",p_x);
	ds_map_add(item_map_ds, "piece y",p_y);
	ds_map_add(item_map_ds, "piece y",p_y);
	ds_map_add(item_map_ds, "item_version",obj_list[| i].item_version);
	ds_map_add(item_map_ds, "sprite",obj_list[| i].image_index);
	//if obj_list[| i].object_index==obj_mur_salle{
	//show_debug_message(string(obj_menu.t_deco) + " "+string(obj_list[| i].image_index))	
	//}
	ds_map_add(item_map_ds, "angle",obj_list[| i].image_angle);
	if obj_list[| i].object_index == obj_dependance
	{
		var position_o = ds_list_find_index(obj_list,obj_list[| i].origine_id)
		var position_d = ds_list_find_index(obj_list,obj_list[| i].destination_id)
		ds_map_add(item_map_ds, "origine",position_o);
		ds_map_add(item_map_ds, "destination",position_d);
	} else if obj_list[| i].object_index == obj_escalier
	{
		ds_map_add(item_map_ds, "destination",obj_list[| i].destination);
	}
	ds_map_add_map(i_map, "item"+string(i), item_map_ds);
			
	}
}

var str = json_encode(i_map);
ds_map_destroy(i_map);

var buff = buffer_create(string_byte_length(str), buffer_fixed, 1);
buffer_write(buff, buffer_text, str);
buffer_save(buff, file);
buffer_delete(buff)

