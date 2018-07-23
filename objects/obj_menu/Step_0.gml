/// @description Gestion affichage du cadre

scr_input();

if mode = MENU_MODE.VICTOIRE scr_victoire()

if mode = MENU_MODE.MENU
{
	//arrivée progressive du menu à l ecran
	menu_x += (menu_x_target - menu_x)/menu_speed;

	//controls clavier
	if menu_control
	{
		//deplacement dans le menu
		if k_up && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur + 1, 0 , menu_item - 1); 
			touche_enfoncee = true;
		}
		
		if k_down && !touche_enfoncee
		{
			menu_curseur = scr_wrap(menu_curseur - 1, 0 , menu_item - 1);
			touche_enfoncee = true;

		}
		
		//pour eviter un deplacement par frame quand on laisse apuyé sur haut/bas
		if !k_down && !k_up 			touche_enfoncee = false;
		
		//validation d'un item
		if k_attaque || k_start
		{
			menu_x_target = w + 200;
			menu_selection = menu_curseur;
			menu_control = false;	
		}
	}
	
		//changement de room
	if (menu_x > w + 150) && (menu_selection != -1)
	{
		switch menu_selection
		{
			case 1 : default: scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 0 : game_end(); break;
			//case 1 : scr_transition(TRANS_MODE.GOTO,room_jeu);
			//mode = MENU_MODE.JEU;
			//break;
			case 2 : default: scr_transition(TRANS_MODE.GOTO,room_select);
			mode = MENU_MODE.SELECT_LOAD;
			break;
		}
		menu_selection = -1;
	}	
}

if mode = MENU_MODE.JEU && k_start mode = MENU_MODE.UP;
if mode = MENU_MODE.PAUSE && k_start mode = MENU_MODE.DOWN;

		//gestion des transitions
if mode != MENU_MODE.JEU
{
	if mode = MENU_MODE.FADE || mode = MENU_MODE.DOWN
	{
		percent = max(0,percent - 0.01);		
	}
	
	if mode = MENU_MODE.INTRO || mode = MENU_MODE.UP
	{
		percent = min(1,percent + 0.01);		
	}
	
	if (percent = 0) or (percent = 1)
	{
		switch mode
		{
			//transition du menu de depart avec ecran noir
			case MENU_MODE.INTRO:
			{
				mode = MENU_MODE.PAUSE
				break;
			}
			case MENU_MODE.FADE:
			{
				mode = MENU_MODE.JEU;
				break;
			}	
			//transitions de la pause en jeu
			case MENU_MODE.UP:
			{
				mode = MENU_MODE.PAUSE;
				break;
			}
			case MENU_MODE.DOWN:
			{
				mode = MENU_MODE.JEU;
				break;
			}
		}
	}
}

if mode = MENU_MODE.CHANGEMENT_SALLE
{
	percent2 = min(1,percent2 + 0.01);	
	
	

	if view_current == 0
	{
	camera_set_view_pos(view_camera[0], x_cam_depart + percent2*x_to* 256,y_cam_depart + percent2*y_to* 176)
	}

		obj_joueur.x = x_joueur_depart + percent2*x_to*64;
		obj_joueur.y = y_joueur_depart + percent2*y_to*64;
	
	if percent2 = 1
	{
		obj_joueur.room_current_x += x_to;
		obj_joueur.room_current_y += y_to;
		
		obj_joueur.x_origine_salle = obj_joueur.x;
		obj_joueur.y_origine_salle = obj_joueur.y;
		
		mode = MENU_MODE.JEU
	}
}

