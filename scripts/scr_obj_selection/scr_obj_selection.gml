/// @desc gere la selection d'objet


//création liste objet possedé
if obj_joueur.cryo liste[0] = true else liste[0] = false;
if obj_joueur.bombes_possede liste[1] = true else liste[1] = false;
if obj_joueur.magnetis liste[2] = true else liste[2] = false;
if obj_joueur.torche liste[3] = true else liste[3] = false;

taille_liste = 3;



//num de l'item selectionné
objet_b_num = -1;
if obj_joueur.objet_b = spr_cryo objet_b_num = 0;  
if obj_joueur.objet_b = spr_bombe objet_b_num = 1; 
if obj_joueur.objet_b = spr_magnis objet_b_num = 2;  
if obj_joueur.objet_b = spr_torche objet_b_num = 3; 




//icones des objets possédés
if obj_joueur.cryo draw_sprite(spr_cryo,0,x_b + 118,y_b - 133);
if obj_joueur.bombes_possede draw_sprite(spr_bombe,0,x_b + 118 + 30 , y_b - 133);
if obj_joueur.magnetis draw_sprite(spr_magnis,0,x_b + 118 + 60,y_b - 133);
if obj_joueur.torche draw_sprite(spr_torche,0,x_b + 118 + 90 , y_b - 133);


if obj_joueur.map draw_sprite(spr_map,0,x_b + 30 , y_b - 100);
if obj_joueur.bottes_fer draw_sprite(spr_bottes_fer,0,x_b + 30 , y_b - 70);


	
//9 box sur l'item selectionné
if objet_b_num != -1 scr_9box(spr_9box_red,x_b + 104 + 30*objet_b_num, y_b -146, x_b + 132 + 30*objet_b_num, y_b -117); 

scr_input();

if k_left && !touche_enfoncee && objet_b_num != 0 
{
	objet_b_num_t = objet_b_num;
	for (i = 0; i < objet_b_num_t; i++)
	{
		if liste[i] objet_b_num = i;	
	}
	touche_enfoncee = true;
}

if k_right && !touche_enfoncee && objet_b_num != taille_liste
{
	objet_b_num_t = objet_b_num;
	for (i = taille_liste; i > objet_b_num_t; i--)
	{
		if liste[i] objet_b_num = i;	
	}
	touche_enfoncee = true;
}

if !k_right && !k_left touche_enfoncee = false;


//validation de l'objet selectionné
if objet_b_num = 0 obj_joueur.objet_b = spr_cryo;  
if objet_b_num = 1 obj_joueur.objet_b = spr_bombe; 
if objet_b_num = 2 obj_joueur.objet_b = spr_magnis;  
if objet_b_num = 3 obj_joueur.objet_b = spr_torche; 