/// @description affiche pinceau/erreurs
// You can write your code in this editor

//Affichage minimap
#region
if view_current == 1
{
	// coordonnées de la camera 1
	var x_hub = camera_get_view_x(view_camera[1])
	var y_hub = camera_get_view_y(view_camera[1])
	
	show_debug_message(string(y_hub) + string(x_hub))
	
	
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
	
	// room courante en rouge
	x1 = 3+4*current_room_x + offset_x
	y1 = 2+3*current_room_y + offset_y
	draw_set_color(c_red);
	draw_rectangle(x1, y1, x1+2, y1+1, false);
	
}
#endregion


if view_current == 0 and obj_menu.mode == MENU_MODE.CONSTRUCTION
{
	if mode_edition = EDITEUR_MODE.NORMAL{
	image_alpha = .5
	//Détermination du type d'objet
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



	item = instance_position(x,y,obj_master);

	if ((x<4096 or y<=1024) and current_type != noone)
	{
	draw_self()
	}
	else if item != noone and (item.object_index == obj_mur or item.object_index == obj_porte or item.object_index == obj_porte_bloquee or item.object_index == obj_porte_fermee)
	{
	
	}

	}
	else if mode_edition = EDITEUR_MODE.DEPENDANCE_2
	{
		image_alpha = 1
		x = begin_arrow.x
		y = begin_arrow.y
		if mouse_x<4096
		{
			draw_self()	
			draw_sprite_ext(spr_fleche_pointe,0,mouse_x,mouse_y,1,1,image_angle,c_white,image_alpha)
		}
	}
	else if mode_edition = EDITEUR_MODE.ERASER or mode_edition = EDITEUR_MODE.ERASER_DEP
	{
			image_alpha = .9
			x=mouse_x
			y=mouse_y
			draw_self()
	}
} 




/*else
{
	
x = round((mouse_x) / 16)*16
y = round((mouse_y) / 16)*16
	
}
*/