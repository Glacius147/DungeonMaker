/// @descr interface en jeu

if mode = MENU_MODE.JEU || mode = MENU_MODE.UP || mode = MENU_MODE.DOWN || mode = MENU_MODE.PAUSE || mode = MENU_MODE.CHANGEMENT_SALLE
{
	//correction bug d'affichage
	draw_set_color(c_black);
	draw_rectangle(x_b + 254,y_b - 176 ,x_b + 256,y_b + 176,false);

	//cadres map	
	draw_set_color(c_blue);
	draw_rectangle(x_b + 6,y_b + 6,x_b + 75,y_b + 59,false);
	scr_mini_map();
	
	
	//affichages des objets touches A et B
	scr_9box(spr_9box,x_b + 114, y_b + 22, x_b + 114 + 30, y_b + 22 + 38);
	scr_9box(spr_9box,x_b + 148, y_b + 22, x_b + 148 + 30, y_b + 22 + 38);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);	
	draw_set_color(c_yellow);
	draw_text(x_b + 129,y_b + 15,"B");
	draw_text(x_b + 163,y_b + 15,"N");
	draw_set_valign(fa_top);
	if instance_exists(obj_joueur) 
	{
		draw_sprite(obj_joueur.objet_a,0,x_b + 129,y_b + 40);
		if obj_joueur.objet_b != 0 draw_sprite(obj_joueur.objet_b,0,x_b + 163,y_b + 40);
	}

	//affichage choix objet & contour map
	scr_9box(spr_9box,x_b + 100, y_b -150, x_b + 230, y_b -112);
	
	draw_set_color(c_blue);
	draw_rectangle(x_b + 50, y_b -110, x_b + 230, y_b -10, false);

	//placement des coeurs
	/// @desc affiche le niveau de PV du joueur
	if instance_exists(obj_joueur) 
	{
		pv = obj_joueur.pv;
		pv_max = obj_joueur.pv_max;
	}
	else 
	{
		pv = 0;
		pv_max = 0;
	}

	for (i = 1; i <= min(pv_max,5); i++)
	{
		if pv >= i im_coeur = 0;
		if pv = i - 0.5 im_coeur = 1;
		if pv < i - 0.5 im_coeur = 2;
		draw_sprite(spr_coeur,im_coeur,x_b + 185 + 13*(i-1),y_b + 18);
	}
	
	for (i = 6; i <= min(pv_max,10); i++)
	{
		if pv >= i im_coeur = 0;
		if pv = i - 0.5 im_coeur = 1;
		if pv < i - 0.5 im_coeur = 2;
		draw_sprite(spr_coeur,im_coeur,x_b + 185 + 13*(i-6),y_b + 33);
	}	
	
	
	
	// placement des clefs et des bombes
	draw_sprite(spr_clef,0,x_b + 90,y_b + 20);
	draw_sprite(spr_bombe,0,x_b + 90,y_b + 40);
	draw_set_font(font_hub);
	draw_set_color(c_yellow);
	if instance_exists(obj_joueur)
	{
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);	
	draw_text(x_b + 95,y_b + 20,"x" + string(obj_joueur.clef));
	draw_text(x_b + 95,y_b + 40,"x" + string(obj_joueur.bombes));
	draw_set_valign(fa_top);
	}
}



//gestion caméras
if mode = MENU_MODE.JEU || mode = MENU_MODE.UP || mode = MENU_MODE.DOWN || mode = MENU_MODE.PAUSE
{
	if view_current == 0
	{
	camera_set_view_size(view_camera[0], zone_jeu_w,zone_jeu_h*(1-percent));
	view_set_hport(view_current,3*zone_jeu_h*(1-percent));
	}
	else
	{
	camera_set_view_size(view_camera[1], zone_jeu_w, zone_jeu_h*(percent)+64);
	camera_set_view_pos(view_camera[1],4097 ,2752 - zone_jeu_h * (percent));
	}
}


//gestion selection objet
if mode = MENU_MODE.PAUSE && instance_exists(obj_joueur) 
{
	scr_obj_selection();
	scr_map();
}
