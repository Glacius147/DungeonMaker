/// @description Gestion affichage du cadre

scr_input();

if mode = MENU_MODE.VICTOIRE scr_victoire()



#region //menu
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
		if kp_attaque || kp_start
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
			case 0 : game_end(); break;
			case 1 : scr_transition(TRANS_MODE.GOTO,room_editeur); break;
			case 2 : {	scr_transition(TRANS_MODE.GOTO,room_select);
					mode = MENU_MODE.SELECT_LOAD;
					break; }
		}
		menu_selection = -1;
	}	
}
#endregion


//activation de la pause (et sortie de la pause)
if mode = MENU_MODE.JEU && kp_start mode = MENU_MODE.UP;
if mode = MENU_MODE.PAUSE && kp_start mode = MENU_MODE.DOWN;

#region //gestion des transitions (menu depart et pause en jeu)
if mode != MENU_MODE.JEU
{
	if mode = MENU_MODE.FADE || mode = MENU_MODE.DOWN
	{
		percent = max(0,percent - 0.02);		
	}
	
	if mode = MENU_MODE.INTRO || mode = MENU_MODE.UP
	{
		percent = min(1,percent + 0.02);		
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
#endregion

#region //gestion caméras
if mode = MENU_MODE.JEU || mode = MENU_MODE.UP || mode = MENU_MODE.DOWN || mode = MENU_MODE.PAUSE
{
	
	{
	//La hauteur de la camera 0
	var ch = floor(zone_jeu_h*(1-percent));
	
	//Changement des paramètres de la cam 0 et du viewport associé
	camera_set_view_size(view_camera[0], zone_jeu_w,ch);
	view_set_hport(0,3*ch);
	view_set_yport(0,720-3*ch); // C'est ça qui manquait ! du coup il y avait overlap entre les viewport et WTF ensued
	
	
	//Changement des paramètres de la cam 0 et du viewport associé
	camera_set_view_size(view_camera[1], zone_jeu_w, 240-ch);
	camera_set_view_pos(view_camera[1],4097 ,2816-(240-ch));
	view_set_hport(1,720-3*ch);
	}
}
#endregion

#region //gestion scroling caméra et obj_joueur pour les changement de salle
if mode = MENU_MODE.CHANGEMENT_SALLE
{
	percent2 = min(1,percent2 + 0.01);	
	
	camera_set_view_pos(view_camera[0], x_cam_depart + percent2*x_to* 256,y_cam_depart + percent2*y_to* 176);
	

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
#endregion

