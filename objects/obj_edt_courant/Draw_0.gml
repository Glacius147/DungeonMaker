/// @description affiche pinceau/erreurs
// You can write your code in this editor



//Affichage minimap : DONE
#region
if view_current == 1
{
	// coordonnées de la camera 1
	var x_hub = camera_get_view_x(view_camera[1])
	var y_hub = camera_get_view_y(view_camera[1])
	
	//show_debug_message(string(y_hub) +" " +string(x_hub))
	
	
	//petite marge en noir
	var offset_x = x_hub+3
	var offset_y = y_hub+2
	
	//Chaque salle est repr par un rectangle 3*2 avec 
	//1 pixel entre chaque rectangle
	// total en abscisse : 3+17*(3+1)+3 = 74
	// (marge + 17 * (taille rect+marge) + marge
	// total en ordonnée : 2+16*(2+1)+2 = 52
	// (marge + 17 * (taille rect+marge) + marge
	draw_set_color(c_blue);
	draw_rectangle( offset_x, offset_y,offset_x + 74, offset_y+52,false);

	//Affichage des salles créées
	for (var i = 0; i < 16; i++)
	{
		for (var j = 0; j < 16; j++)
		{
			
			if created_room[i,j] 
			{
				x1 = 3+4*i + offset_x
				y1 = 2+3*j + offset_y
				draw_set_color(c_black);
				draw_rectangle(x1, y1, x1+2, y1+1, false);
			}
			
			//draw_set_color(c_black);
			//draw_rectangle(x1, y1, x1+12, y1+9, true);
		}
	}
	//Affichage des souterrains créés
	for (var j = 0; j < 6; j ++)
	{
		
		if created_room[16,j] 
		{			
			x1 = 3+4*i + offset_x
			y1 = 2+3*j + offset_y
			draw_set_color(c_black);
			draw_rectangle(x1, y1, x1+2, y1+1, false);
		}
			
		//draw_set_color(c_black);
		//draw_rectangle(x1, y1, x1+12, y1+9, true);
	}
	
	// room courante en rouge
	x1 = 3+4*current_room_x + offset_x
	y1 = 2+3*current_room_y + offset_y
	draw_set_color(c_red);
	draw_rectangle(x1, y1, x1+2, y1+1, false);
	
}
#endregion

// Affichage de l'item courant
//La condition sur la position n'est pas vraiment nécessaire vu qu'il y a une condiction sur view_current
#region
if view_current == 0 and obj_menu.mode == MENU_MODE.CONSTRUCTION and (pos_mouse = EDITEUR_POSITION.SALLE or pos_mouse = EDITEUR_POSITION.SOUTERRAIN)
{
	if mode_edition = EDITEUR_MODE.NORMAL
	{
		image_alpha = .5
		if (current_type != noone)
		{
			//show_debug_message(x)
			draw_self()
		}
	//Détermination du type d'objet -> transféré step
	/*
	if current_type == obj_mur_salle.object_index
		{
			//Si c'est une salle, placement en haut à gauche
			x = floor((mouse_x) / 256)*256
			y = floor((mouse_y) / 176)*176
		} else // par défaut, arrondi au bloc près, centré.
		{
			x = round((mouse_x-8) / 16)*16+8
			y = round((mouse_y-8) / 16)*16+8
		}
	*/
	
	

	//item = instance_position(x,y,obj_master);

	}
	else if mode_edition = EDITEUR_MODE.DEPENDANCE_2 and pos_mouse = EDITEUR_POSITION.SALLE
	{
		//Affichage de la fleche non terminée
		image_alpha = 1
		//x = begin_arrow.x
		//y = begin_arrow.y
		
		draw_self()	
		draw_sprite_ext(spr_fleche_pointe,0,mouse_x,mouse_y,1,1,image_angle,c_white,image_alpha)
		
	}
	else if mode_edition = EDITEUR_MODE.ERASER or mode_edition = EDITEUR_MODE.ERASER_DEP
	{
			//Affichage de la gomme
			image_alpha = .9
			draw_self()
	}
} 
#endregion



