/// @description Detecte clic slot
// You can write your code in this editor


if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{
	if menu_selection == -1
	{
		menu_control = true	
	}
	scr_input();
	//controls clavier
	if menu_control
	{
		//deplacement dans le menu
		if k_down && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur + 1, 0 , menu_item - 1); 
			touche_enfoncee = true;
		}
		
		if k_up && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur - 1, 0 , menu_item - 1);
			touche_enfoncee = true;

		}
		
		//pour eviter un deplacement par frame quand on laisse appuyé sur haut/bas
		if !k_down && !k_up 			touche_enfoncee = false;
		
		if mouse_check_button_released(mb_left){
			if mouse_x <350 and mouse_x > 176 and mouse_y>176-2-menu_itemheight*.75 and mouse_y<176+9.5*menu_itemheight
			{
				menu_curseur = floor((mouse_y-176+2+.75*menu_itemheight)/(1.5*menu_itemheight))
				k_start = true	
			}
		}
		//validation d'un item
		if k_attaque || k_start
		{
			menu_selection = menu_curseur;
			if menu_selection = 6
			{
				if mode_sel == MODE_SELECT.NORMAL
				{	
					mode_sel = MODE_SELECT.DELETE
					offset_color = c_red
					menu_selection = -1
				} else
				{
					mode_sel = MODE_SELECT.NORMAL
					offset_color = c_white
					menu_selection=-1
				}
			} else 
			{
				if mode_sel == MODE_SELECT.NORMAL
				{	
					if obj_menu.mode == MENU_MODE.SELECT_LOAD or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
					{
						if file_exists("svg_slot"+string(menu_selection)+".json")
						{
							menu_control = false
						} else
						{
							menu_selection = -1	
						}
					} else 
					{
						menu_control = false	
					}
				} else
				{
					if file_exists("svg_slot"+string(menu_selection)+".json")
					{
						file_delete("svg_slot"+string(menu_selection)+".json")
						menu[menu_selection] = "SLOT " + string(menu_selection+1) + " (VIDE)" 
						
						mode_sel = MODE_SELECT.NORMAL
						offset_color = c_white
						menu_selection = -1
					}
					
				}
			}
			
		}
	}
	
		//changement de room
		/*
	if (menu_x > w + 150) && (menu_selection != -1)
	{
		switch menu_selection
		{
			case 2 : default: scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 0 : game_end(); break;
			case 1 : scr_transition(TRANS_MODE.GOTO,room_jeu);
			mode = MENU_MODE.JEU;
			break;
			case 3 : default: scr_transition(TRANS_MODE.GOTO,room_select);
			mode = MENU_MODE.SELECT_LOAD;
			break;
		}
		menu_selection = -1;
	}*/	
}

if menu_selection != -1 and (obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT)
{
	//if mouse_check_button_released(mb_left)
	{
		//slot = floor(mouse_x/256)+3*floor(mouse_y/360)	
		slot = menu_selection ;
		menu_selection = -1;
		
		if obj_menu.mode == MENU_MODE.SELECT_LOAD and file_exists("svg_slot"+string(slot)+".json")
		{
	
			obj_menu.mode = MENU_MODE.JEU
			file =  "svg_slot"+string(slot)+".json";
			scr_transition(TRANS_MODE.GOTO,room_charge)

		}

		if obj_menu.mode == MENU_MODE.SELECT_SAVE
		{
			temps = date_current_datetime();
			minutes = date_get_minute(temps)
			heures = date_get_hour(temps)
			jour = date_get_day(temps)
			mois = date_get_month(temps)
			annee = date_get_year(temps)
			time = string(heures)+"h"+string(minutes)+" le "+string(jour)+"/"+string(mois)+"/"+string(annee)
			ini_open("data.ini")
			ini_write_string("save", "save"+string(slot), time);
			ini_close()
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
	
		if obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH
		{
	
			temps = date_current_datetime();
			minutes = date_get_minute(temps)
			heures = date_get_hour(temps)
			jour = date_get_day(temps)
			mois = date_get_month(temps)
			annee = date_get_year(temps)
			time = string(heures)+"h"+string(minutes)+" le "+string(jour)+"/"+string(mois)+"/"+string(annee)
			ini_open("data.ini")
			ini_write_string("save", "save"+string(slot), time);
			ini_close()
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
		if obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT and file_exists("svg_slot"+string(slot)+".json")
		{
	
			file =  "svg_slot"+string(other.slot)+".json";
			room_goto(room_editeur)

		}
		
	
	}
}


