/// @description 
// You can write your code in this editor


nb_obj = ds_list_size(obj_list)

var c_x = mouse_x
var c_y = mouse_y
var current_room_x = c_x div 256
var current_room_y = c_y div 256

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{

	//clic minimap
	if mouse_check_button_released(mb_left) && (c_x>4096 and c_x<4096+15 and c_y>1024){



	}

/*
//Mode d'édition normal
if mode_edition == EDITEUR_MODE.NORMAL
	{
	if mouse_check_button_released(mb_left)
	{
		c_x = mouse_x
		c_y = mouse_y
		current_room_x = floor(c_x/256)
		current_room_y = floor(c_y/176)
		if c_x>(4096+5*16) and c_y>1024 // on est dans la barre de selection
		{
			item = instance_position(c_x,c_y,obj_master)
			if item != noone
			{
				if item.object_index == obj_mur_salle
				{
					obj_menu.t_deco = (obj_menu.t_deco+1) mod obj_menu.nb_deco
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
				}
				else
				{
					sprite_index = item.sprite_index
					image_index = item.image_index
					current_type = item.object_index
					if current_type == obj_escalier
					{
						dest = item.destination	
					}
				}
			}
		}
		else if c_x>4096 and c_y>1024 // On est dans la minimap
		{
			//Position de la souris dans la caméra de l'interface
			c_y = mouse_y - camera_get_view_y(view_camera[1]) - 6
			c_x = mouse_x - camera_get_view_x(view_camera[1]) - 15
			col = floor(c_x/4)
			row = floor(c_y/3)
			camera_set_view_pos(view_camera[0],col*256 ,row*176);
	
		}
		else  // On clique pour poser l'objet
		{
			//Si la salle est vide on la crée
			if c_x<=4096 and !created_room[current_room_x,current_room_y]//current_type == obj_mur_salle
			{
				x = current_room_x*256
				y = current_room_y*176
				nb_obj = ds_list_size(obj_list)
				ds_list_add(obj_list,instance_create_layer(x,y,"salles",obj_mur_salle));
				created_room[current_room_x,current_room_y] = true;
				nb_obj ++;
				//Ajout de 4 murs
				ds_list_add(obj_list,instance_create_layer(x+3*8,y+11*8,"salles",obj_mur));
				obj_list[| nb_obj].image_index = 1;
				nb_obj ++;
				ds_list_add(obj_list,instance_create_layer(x+29*8,y+11*8,"salles",obj_mur));
				obj_list[| nb_obj].image_index = 3;
				nb_obj ++;
				ds_list_add(obj_list,instance_create_layer(x+16*8,y+3*8,"salles",obj_mur));
				obj_list[| nb_obj].image_index = 0;
				nb_obj ++;
				ds_list_add(obj_list,instance_create_layer(x+16*8,y+19*8,"salles",obj_mur));
				obj_list[| nb_obj].image_index = 2;
				nb_obj ++;
				ds_list_add(obj_list,instance_create_layer(x+8,y+8,"Instances",obj_fantome));
				nb_obj ++;
			
			} else
			{	
				
				x = round((mouse_x-8) / 16)*16+8;
				y = round((mouse_y-8) / 16)*16+8;
				item = instance_position(x,y,obj_master);
				if item != noone // Si il y a conflit d'objet, on pose pas sauf pt dragon
				{
					//Check des teleports escaliers
					if item.object_index == obj_escalier
					{
						with obj_escalier_bis
						{
							if destination == other.item.destination{ //on cherche celui avec le meme id
								camera_set_view_pos(view_camera[0],room_origine_x*256 ,176*room_origine_y);
							}
						}
					} //Si on clic un escalier retour
					else if item.object_index == obj_escalier_bis
					{
						with obj_escalier
						{
							if x<4096 and destination == other.item.destination{ //on cherche celui avec le meme id
								camera_set_view_pos(view_camera[0],room_origine_x*256 ,176*room_origine_y);
							}
						}
					} else if item.object_index == obj_mur and (item.image_index mod 4 ==0) and current_type = obj_dragon
					{//Cas particulier du dragon
						ds_list_add(obj_list,instance_create_layer(x,y,"Instances",current_type));
						//obj_list[| nb_obj].sprite_index = spr_dragon_edt
						obj_list[| nb_obj].room_origine_x = current_room_x
						obj_list[| nb_obj].room_origine_x = current_room_x
						obj_list[| nb_obj].degats = 0
						nb_obj ++;
					}
				} 
				
				else // pas de conflit d'objet
				{
					if current_type == obj_joueur and current_player !=noone
					{
						if created_room[current_room_x,current_room_y]
						{
							new_item = instance_create_layer(x,y,"Instances",current_type);
							old_position = ds_list_find_index(obj_list,current_player)
							ds_list_replace(obj_list,old_position,new_item)
							instance_destroy(current_player)
							current_player = new_item
						}
					}
					else if current_type == obj_escalier //cas de l'escalier ou il faut vérifier si deja créé
					{
						if created_room[current_room_x,current_room_y]
						{
							flag_dejacree = noone
							with obj_escalier
							{
								if x<4096 and destination == other.dest
								{
									other.flag_dejacree = id  	
								}
							}
						
							if flag_dejacree == noone //tout va bien
							{
								new_item = instance_create_layer(x,y,"Instances",current_type);
								new_item.destination = dest
								new_item.mask_index = spr_bloc;
								ds_list_add(obj_list,new_item)
								nb_obj++
							} else //deja créé
							{
								flag_dejacree.x = x;
								flag_dejacree.y = y;
								flag_dejacree.room_origine_x = current_room_x
								flag_dejacree.room_origine_y = current_room_y
								flag_dejacree.actif = true
								with (obj_dependance)
								{
									if destination_id == other.flag_dejacree
									{
										pos = ds_list_find_index(other.obj_list,id);
										ds_list_delete(other.obj_list,pos);
										other.nb_obj--
										instance_destroy(id);
									}
								} 
							}
						}
						
					}
					else if current_type != noone and ((x<4096 and current_type != obj_dragon) or (object_is_ancestor(current_type.object_index,objp_item) or current_type.object_index = obj_bat  ))
					{
						if created_room[current_room_x,current_room_y]
						{
							nb_obj = ds_list_size(obj_list)
							ds_list_add(obj_list,instance_create_layer(x,y,"Instances",current_type));
							obj_list[| nb_obj].room_origine_x = current_room_x
							obj_list[| nb_obj].room_origine_x = current_room_x
							if current_type == obj_joueur//Cas du joueur non deja crée
							{
								current_player = obj_list[| nb_obj]
							} 
							nb_obj ++;
						}
					} 
				}
			}	
		}
	}


	if mouse_check_button_released(mb_right)
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone
		{
			test = item.object_index
			test2 = obj_mur
			test3 = obj_porte
			nextroom = scr_is_room_adj(x,y)
			has_nextroom = nextroom[0];
			var flag_cycle = false
			var flag_change_mirror = true
			if has_nextroom and item.object_index == obj_mur
			{
				flag_cycle = true
				var next_type = obj_porte
			} else if has_nextroom and item.object_index == obj_porte
			{
				flag_cycle = true
				flag_change_mirror = false
				var next_type = obj_porte_bloquee
			} else if has_nextroom and item.object_index == obj_porte_bloquee
			{
				flag_cycle = true
				var next_type = obj_porte_fermee
			} else if has_nextroom and item.object_index == obj_porte_fermee
			{
				flag_cycle = true
				var next_type = obj_mur_explosable
			} else if has_nextroom and item.object_index == obj_mur_explosable
			{
				flag_cycle = true
				var next_type = obj_mur
			} 
			if flag_cycle
			{
	
				new_x = item.x
				new_y = item.y
				new_item =  instance_create_layer(new_x,new_y,"Instances",next_type);
				if next_type == obj_mur_explosable
				{
					new_item.image_index = round(item.image_angle/90)
				} else if next_type == obj_mur
				{
					new_item.image_index = item.image_index	
				} else if next_type == obj_porte
					new_item.image_angle = 90*item.image_index
				else {
					new_item.image_angle = item.image_angle
				}
				new_item.mask_index = spr_mur
				old_position = ds_list_find_index(obj_list,item)
				ds_list_replace(obj_list,old_position,new_item)
				//obj_list = scr_array_replace(obj_list,item,new_item)
				with (obj_dependance)
				{
					if destination_id == other.item
					{
						pos = ds_list_find_index(other.obj_list,id);
						ds_list_delete(other.obj_list,pos);
						other.nb_obj--
						instance_destroy(id);
					}
				}
				instance_destroy(item)
				if flag_change_mirror
				{
					item = nextroom[1]
					new_x = item.x
					new_y = item.y
					new_item =  instance_create_layer(new_x,new_y,"Instances",next_type);
					//show_debug_message(new_item.room_origine_x)
					if next_type == obj_mur_explosable
					{
						new_item.image_index = round(item.image_angle/90)
					} else if next_type == obj_mur
					{
						new_item.image_index = item.image_index	
					} else if next_type == obj_porte
						new_item.image_angle = 90*item.image_index
					else {
						new_item.image_angle = item.image_angle
					}
					new_item.mask_index = spr_mur
					old_position = ds_list_find_index(obj_list,item)
					ds_list_replace(obj_list,old_position,new_item)
					//obj_list = scr_array_replace(obj_list,item,new_item)
					with (obj_dependance)
					{
						if destination_id == other.item
						{
							pos = ds_list_find_index(other.obj_list,id);
							ds_list_delete(other.obj_list,pos);
							other.nb_obj--
							instance_destroy(id);
						}
					}
					instance_destroy(item)
				}
			}
		}
	}
}
*/

if mode_edition = EDITEUR_MODE.DEPENDANCE_1{
	//1er pression :

	if mouse_check_button_pressed(mb_left)
	{
		//On vérifie qu'on a bien cliqué sur un activant
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone and item.object_index = obj_mur_salle
		{
			item = instance_position(mouse_x,mouse_y,obj_fantome);
		}
		if item != noone and item.activant
		{	//Changement de mode & d'opacité.
			mode_edition = EDITEUR_MODE.DEPENDANCE_2
			with obj_master
			{
				if activant{
					image_alpha = 0.5
				} else if activable
				{
					image_alpha = 1	
				}
			}
		sprite_index = spr_fleche1
		begin_arrow = item
		}
	}
}

if mode_edition = EDITEUR_MODE.DEPENDANCE_2{
	//Relachement sur l'item suivant
	image_angle =  point_direction(begin_arrow.x, begin_arrow.y, mouse_x, mouse_y);
	image_xscale = point_distance(begin_arrow.x, begin_arrow.y, mouse_x, mouse_y)/16
	if mouse_check_button_released(mb_left)
	{
		//Dans tous les cas on revient en mode 1
		mode_edition = EDITEUR_MODE.DEPENDANCE_1
		with obj_master
			{
				if !activant{
					image_alpha = .5
				} else
				{
					image_alpha = 1	
				}
			}
		
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		image_angle =0
		image_xscale = 1
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone and item.activable and item.id != begin_arrow.id
		{
			new_item =  instance_create_layer(begin_arrow.x,begin_arrow.y,"Instances_dep",obj_dependance);
			new_item.origine_id = begin_arrow
			new_item.destination_id = item
			/*new_item.image_angle = point_direction(begin_arrow.x, begin_arrow.y, item.x, item.y);
			image_xscale=point_distance(origine_id.x, origine_id.y, destination_id.x, destination_id.y)/16

			draw_self()
			draw_sprite(spr_fleche_pointe,0,destination_id.x,destination_id.y)
			with begin_arrow
			{
				other.new_item.image_xscale = distance_to_point(other.item.x,other.item.y)/32
			}*/
			//image_xscale = distance_to_point(mouse_x,mouse_y)/32;
			ds_list_add(obj_list,new_item)
			nb_obj++
		}
		
	}
	
}

if  mode_edition = EDITEUR_MODE.ERASER
{
	if mouse_check_button_released(mb_left) and (mouse_x<4096 or mouse_y<1024)
	{
		item = instance_position(mouse_x,mouse_y,obj_master);
		//On ne peut pas détruire certains trucs.
		if item != noone and item.object_index != obj_fantome and  item.object_index != obj_escalier_bis and !object_is_ancestor(item.object_index,objp_contour_salle) 
		{
			pos = ds_list_find_index(obj_list,item)
			ds_list_delete(obj_list,pos)
			with (obj_dependance)
			{
				if origine_id == other.item or destination_id == other.item{
					pos = ds_list_find_index(other.obj_list,id);
					ds_list_delete(other.obj_list,pos);
					other.nb_obj--
					instance_destroy(id);
				}
			}
			if item.object_index == obj_joueur
			{
				current_player = noone	
			}
			nb_obj--
			instance_destroy(item)
		} else if  item != noone and item.object_index == obj_mur_salle
		{
			var flag = true
			//On checke que la salle est vide.
			nb_obj = ds_list_size(obj_list)
			for(var i = 0; i < nb_obj; i++) 
			{
				var c_item = obj_list[| i];
				//show_debug_message(string(c_item.room_origine_x) + " " +string(c_item.room_origine_y))
				//show_debug_message("id joueur" +string(obj_joueur.object_index))
				//show_debug_message("id objet" +string(c_item.object_index))
				if c_item.room_origine_x == current_room_x and c_item.room_origine_y == current_room_y and c_item.object_index != obj_mur_salle and c_item.object_index != obj_mur and c_item.object_index != obj_fantome
				{
					flag = false;
					break;
				}
			}
			if flag // On détruit les trucs qui sont restés dans la salle
			{
				pos = ds_list_find_index(obj_list,item)
				ds_list_delete(obj_list,pos)
				with (obj_master)
				{
					if room_origine_x == other.current_room_x and room_origine_y == other.current_room_y
					{
						pos = ds_list_find_index(other.obj_list,id);
						ds_list_delete(other.obj_list,pos);
						other.nb_obj--
						instance_destroy(id);
					}
				}
				//et finalement on détruit la salle
				nb_obj--
				created_room[current_room_x,current_room_y] = false
				instance_destroy(item)
			}	
		}
	}
} else if mode_edition = EDITEUR_MODE.ERASER_DEP
{
	if mouse_check_button_released(mb_left)
	{
		item = instance_position(mouse_x,mouse_y,obj_dependance);
		if item != noone 
		{
			pos = ds_list_find_index(obj_list,item)
			ds_list_delete(obj_list,pos)
			nb_obj--
			instance_destroy(item)
		}
	}
	
}

} else if obj_menu.mode == MENU_MODE.PAUSE_EDT
{
	scr_input()
	if k_start
	{
		obj_menu.mode = MENU_MODE.CONSTRUCTION
	} else{
		percent_error = min(percent_error+0.02,1)	
	}
	
	
}