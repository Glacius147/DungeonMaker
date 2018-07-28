/// @description 
// You can write your code in this editor

//Ne devrait pas être nécessaire
//nb_obj = ds_list_size(obj_list)

var m_x = mouse_x
var m_y = mouse_y

r_x = camera_get_view_x(view_camera[0])
r_y = camera_get_view_y(view_camera[0])

current_room_x = r_x div 256;
current_room_y = r_y div 176;

pos_mouse = scr_pos_edt(m_x,m_y)

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
	//Curseur magnétique suivant le type d'objet en mode normal.
	#region
	if pos_mouse == EDITEUR_POSITION.SALLE and mode_edition = EDITEUR_MODE.NORMAL
	{
		//Cas du dragon
		if (current_type == obj_dragon)
		{		
			x = 256 * current_room_x + 128
			y = 176 * current_room_y + 3*8
		} else //Cas par défaut
		{
			x = round((mouse_x-8) / 16)*16+8;
			y = round((mouse_y-8) / 16)*16+8;
		}
		
	} else	{x = m_x; y = m_y}// par defaut, match le curseur
	#endregion

	//clic minimap : tous modes
	#region
	if mouse_check_button_released(mb_left) and pos_mouse == EDITEUR_POSITION.MINIMAP// (c_x>4096+6 and c_x<4096+73 and c_y>1760)
	{
			
			var d_x = mouse_x - camera_get_view_x(view_camera[1]) - 6
			var d_y = mouse_y - camera_get_view_y(view_camera[1]) - 4
			
			var current_room_x_t = d_x div 4
			var current_room_y_t = d_y div 3
			
			//TODO : deplacer dans scr_pos_edt pour une detection + fine de  EDITEUR_POSITION.MINIMAP
			//dans la dernière colonne, seules les salles souteraines sont accessibles
			if ((current_room_x_t == 16) and (current_room_y_t>5)) {current_room_x_t=-1}
			
			//Si on est trop loin
			if (current_room_y_t>15) {current_room_x_t = -1;}
			
			//si le clic est légal, maj de la room courante
			if (current_room_x_t!=-1) {current_room_x = current_room_x_t; current_room_y= current_room_y_t;}
			
			debug("salle crée",current_room_x_t,current_room_y_t)
			//deplacement de la caméra 0
			camera_set_view_pos(view_camera[0],current_room_x*256 ,current_room_y*176);
	}
	#endregion
	
	//selection d'un item dans le panel : peu importe le mode, provoque un retour au mode normal
	#region
	if mouse_check_button_pressed(mb_left) and (pos_mouse = EDITEUR_POSITION.PALETTE)
	{
		item = instance_position(m_x,m_y,obj_master)
			if item != noone
			{
				//Changement du feeling : DONE
				if item.object_index == obj_mur_salle
				{
					#region
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
					#endregion
				}
				else
				{
					//Selection d'un objet : DONE
					#region
					//Changement de mode
					scr_edt_mode(EDITEUR_MODE.NORMAL)
					sprite_index = item.sprite_index
					image_index = item.image_index
					current_type = item.object_index
					item_version = item.item_version
					
					#endregion
				}
			}
	}
	#endregion
	
	
	//Clic dans une salle crée : DONE (dragon/teleport escalier/poser un item)
	#region
	if mouse_check_button_released(mb_left) and pos_mouse == EDITEUR_POSITION.SALLE and mode_edition == EDITEUR_MODE.NORMAL and created_room[current_room_x , current_room_y] // (c_x>4096+6 and c_x<4096+73 and c_y>1760)
	{
		//On regarde si il y a déjà un objet (au centre de la case !)
		item = instance_position(x,y,obj_master);
		if item != noone // Si il y a conflit d'objet, on pose pas sauf dragon sur mur
		{
			//Cas particulier du dragon TODO : Empecher de poser plusieurs dragons dans une salle !
			//Le check (item.image_index mod 4 ==0) est normalement superflu, comme le dragon est magnétisé
			if item.object_index == obj_mur and (item.image_index mod 4 ==0) and current_type = obj_dragon
			{
				scr_edt_create(x,y,current_type)
			} 
			else if item.object_index == obj_escalier // Teleport escalier
			{
				with obj_escalier_bis
				{	//on cherche celui avec la meme destination & on change la camera
					if destination == other.item.destination {camera_set_view_pos(view_camera[0],room_origine_x*256 ,176*room_origine_y);}
				}
			}
		} else
		{
		//Rien sur la case en question, on crée gaiement :
			scr_edt_create(x,y,current_type)
		}
	}
	#endregion
	
	//Clic dans un souterrain : DONE
	#region
	if mouse_check_button_released(mb_left) and pos_mouse == EDITEUR_POSITION.SOUTERRAIN and created_room[current_room_x , current_room_y] // (c_x>4096+6 and c_x<4096+73 and c_y>1760)
	{
		//On regarde si il y a déjà un objet (au centre de la case !)
		item = instance_position(x,y,obj_master);
		if item != noone // Si il y a conflit d'objet, on pose pas.
		{
			if item.object_index == obj_escalier_bis // Teleport escalier
			{
				with obj_escalier
				{
					//on cherche celui avec le meme id dans une salle
					if (x<4096 and destination == other.item.destination) {camera_set_view_pos(view_camera[0],room_origine_x*256 ,176*room_origine_y);}
				}
			}
		} else
		{
			//Rien sur la case en question, on crée gaiement si c'est un item autorisé dans un souterrain :
			if (object_is_ancestor(current_type.object_index,objp_item) or current_type.object_index = obj_bat)
			{
				scr_edt_create(x,y,current_type)
			}
		}
	}
	#endregion

	//creation de salle : tous modes provoque un retour au mode normal
	#region
	if (pos_mouse == EDITEUR_POSITION.SALLE) and mouse_check_button_released(mb_left) and !created_room[current_room_x,current_room_y]
	{
		//Changement de MODE
		scr_edt_mode(EDITEUR_MODE.NORMAL)
		//nb_obj = ds_list_size(obj_list)
		scr_edt_create(r_x,r_y,obj_mur_salle)
		created_room[current_room_x,current_room_y] = true;
		
		//Ajout de 4 murs
		
		scr_edt_create(r_x+16*8,r_y+3*8,obj_mur);
		scr_edt_create(r_x+3*8,r_y+11*8,obj_mur);
		scr_edt_create(r_x+16*8,r_y+19*8,obj_mur)
		scr_edt_create(r_x+29*8,r_y+11*8,obj_mur);
		
		//Et un trigger pour les monstres morts
		scr_edt_create(r_x+8,r_y+8,obj_fantome)
		
		//TODO : Ajout d'une lanterne ?
		
	}
	#endregion
	
	//Gestion du clic droit dans une salle/un souterrain en mode normal : DONE
	#region
	if mouse_check_button_released(mb_right) and mode_edition = EDITEUR_MODE.NORMAL and (pos_mouse == EDITEUR_POSITION.SALLE or pos_mouse == EDITEUR_POSITION.SOUTERRAIN)  
	{
		//On checke l'item cliqué
		item = instance_position(x,y,obj_master);
		if item != noone // Il faut qu'il y ai quelque chose
		{// placement des portes & changement d'item_version
			#region
			//DONE : Sur un mur dans une salle //TODO : vérifier qu'il n'y a pas un dragon de l'autre coté
			if object_is_ancestor(item.object_index,objp_contour_salle) and pos_mouse == EDITEUR_POSITION.SALLE
			{
				nextroom = scr_is_room_adj(x,y)
				has_nextroom = nextroom[0];
				item = nextroom[2]
				var flag_change_mirror = true
				if has_nextroom 
				{
					if item.object_index == obj_mur {next_type = obj_porte;}
					if item.object_index == obj_porte {next_type = obj_porte_bloquee;}
					if item.object_index == obj_porte {flag_change_mirror = false;}
					if item.object_index == obj_porte_bloquee {next_type = obj_porte_fermee;}
					if item.object_index == obj_porte_fermee {next_type = obj_mur_explosable;}
					if item.object_index == obj_mur_explosable {next_type = obj_mur;}
					
					
					new_x = item.x
					new_y = item.y
					scr_edt_delete(item)
					scr_edt_create(new_x,new_y,next_type)
					if flag_change_mirror
					{
						item = nextroom[1]
						new_x = item.x
						new_y = item.y
						scr_edt_delete(item)
						scr_edt_create(new_x,new_y,next_type)
					}
				} 
			} else if  item.object_index != obj_escalier//Sur un objet pour changement de version. Sauf escalier
			{
				item.item_version = (item.item_version + 1) mod (item.item_nombre_version)
				with item
				{
					event_user(7)	
				}	
			}
			#endregion
		}
		
	}
	#endregion
	
	//Gestion du clic droit dans la palette : peu importe le mode, remet en mode normal
	#region
	if mouse_check_button_released(mb_right) and pos_mouse == EDITEUR_POSITION.PALETTE  
	{
		//On checke l'item cliqué
		item = instance_position(x,y,obj_master);
		if item != noone // Il faut qu'il y ai quelque chose
		{
			//Changement de MODE
			scr_edt_mode(EDITEUR_MODE.NORMAL)
			//changement d'item_version
			item.item_version = (item.item_version + 1) mod (item.item_nombre_version)
			with item
			{
				event_user(7)	
			}
			if item.object_index == obj_mur_salle
			{
				#region
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
				#endregion
			}
			else
			{
				//Selection d'un objet : DONE
				#region
				sprite_index = item.sprite_index
				image_index = item.image_index
				current_type = item.object_index
				item_version = item.item_version
				#endregion
			}
		}
		
	}
	#endregion



//Mode dépendance1
#region
if mode_edition = EDITEUR_MODE.DEPENDANCE_1{
	//1e pression :

	if mouse_check_button_pressed(mb_left) and pos_mouse == EDITEUR_POSITION.SALLE
	{
		item = instance_position(m_x,m_y,obj_master);
		//debug(item.nom)
		//Permet de cliquer la salle pour trouver l'objet fantome
		if item != noone and item.object_index = obj_mur_salle
		{
			item = instance_position(m_x,m_y,obj_fantome);
		}
	
		//On vérifie qu'on a bien cliqué sur un activant
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
#endregion


//Mode dépendance2 (1er clic pour fleche réalisé)
#region
if mode_edition = EDITEUR_MODE.DEPENDANCE_2{
	//Relachement sur l'item suivant
	
	x = begin_arrow.x
	y = begin_arrow.y
	image_angle =  point_direction(begin_arrow.x, begin_arrow.y, m_x, m_y);
	image_xscale = point_distance(begin_arrow.x, begin_arrow.y, m_x, m_y)/16
	if mouse_check_button_released(mb_left) and pos_mouse == EDITEUR_POSITION.SALLE
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
		
		image_angle =0
		image_xscale = 1
		item = instance_position(m_x,m_y,obj_master);
		if item != noone and item.activable and item.id != begin_arrow.id
		{
			new_item =  scr_edt_create(begin_arrow.x,begin_arrow.y,obj_dependance);
		}
		
	}
	
}
#endregion

//Mode effaceur
#region
if  mode_edition = EDITEUR_MODE.ERASER
{
	#region
	if mouse_check_button_released(mb_left) and (pos_mouse == EDITEUR_POSITION.SALLE or pos_mouse == EDITEUR_POSITION.SOUTERRAIN)
	{
		item = instance_position(m_x,m_y,obj_master);
		//On ne peut pas détruire certains trucs.
		if item != noone and item.object_index != obj_fantome and  item.object_index != obj_escalier_bis and item.object_index !=obj_mur_sousterrains and item.object_index !=obj_mur_sousterrains2 and !object_is_ancestor(item.object_index,objp_contour_salle) and !object_is_ancestor(item.object_index,objp_echelles) 
		{
			scr_edt_delete(item)
		} else if  item != noone and item.object_index == obj_mur_salle
		{
			//Destruction d'une salle
			#region
			var flag = true
			//On checke que la salle est vide.
			//nb_obj = ds_list_size(obj_list)
			for(var i = 0; i < ds_list_size(obj_list); i++) 
			{
				var c_item = obj_list[| i];
				if c_item != noone {debug(c_item.nom,c_item.room_origine_x,c_item.room_origine_y);}
				if c_item != noone and c_item.room_origine_x == current_room_x and c_item.room_origine_y == current_room_y and c_item.object_index != obj_mur_salle and c_item.object_index != obj_mur and c_item.object_index != obj_fantome
				{
					flag = false;
					break;
				}
			}

			if flag // On détruit les trucs qui sont restés dans la salle et la salle elle-meme normalement
			{
				with (obj_master)
				{
					if room_origine_x == other.current_room_x and room_origine_y == other.current_room_y
					{
						scr_edt_delete(id)
					}
				}
				//et finalement on détruit la salle
				created_room[current_room_x,current_room_y] = false
			}
			#endregion
		}
	}
	#endregion
} else if mode_edition = EDITEUR_MODE.ERASER_DEP
{
	if mouse_check_button_released(mb_left)
	{
		item = instance_position(mouse_x,mouse_y,obj_dependance);
		if item != noone 
		{
			scr_edt_delete(item)
		}
	}
	
}
#endregion


} else if obj_menu.mode == MENU_MODE.PAUSE_EDT
{
	scr_input()
	if kp_start
	{
		obj_menu.mode = MENU_MODE.CONSTRUCTION
	} else{
		percent_error = min(percent_error+0.02,1)	
	}
	
}

//Trucs en cours de suppression
#region
/*
#region
//Mode d'édition normal
if mode_edition == EDITEUR_MODE.NORMAL
	{
	#region
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
					item_version = item.item_version
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
			//Si la salle est vide on la créé
			if c_x<=4096 and !created_room[current_room_x,current_room_y]//current_type == obj_mur_salle
			{
				x = current_room_x*256
				y = current_room_y*176
				//nb_obj = ds_list_size(obj_list)
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
						obj_list[| nb_obj].item_version = item_version;
						obj_list[| nb_obj].degats = 0
						with obj_list[| nb_obj]{
							event_user(7)	
						}
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
							new_item.item_version = item_version;
							with new_item{
								event_user(7)	
							}
						
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
								new_item.item_version = item_version;
								
								with new_item{
									event_user(7)	
								}
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
							new_item = ds_list_add(obj_list,instance_create_layer(x,y,"Instances",current_type));
							new_item.room_origine_x = current_room_x
							new_item.room_origine_x = current_room_x
							new_item.item_version = item_version
							if current_type == obj_joueur//Cas du joueur non deja crée
							{
								current_player = obj_list[| nb_obj]
							}
							
							with new_item
							{
								event_user(7)	
							}
							nb_obj ++;
						}
					} 
				}
			}	
		}
	}
	#endregion

	if mouse_check_button_released(mb_right)
	{
		x = round((mouse_x-8) / 16)*16+8;
		y = round((mouse_y-8) / 16)*16+8;
		item = instance_position(mouse_x,mouse_y,obj_master);
		if item != noone
		{

			item.item_version = (item.item_version + 1) mod (item.item_nombre_version)
			with item
			{
				event_user(7)	
			}
			
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

#endregion
*/
#endregion