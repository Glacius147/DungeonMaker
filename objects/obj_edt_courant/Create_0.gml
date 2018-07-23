/// @description init de l'éditeur
// You can write your code in this editor
enum EDITEUR_MODE{
	NORMAL,
	DEPENDANCE_1,
	DEPENDANCE_2,
	ERASER,
	ERASER_DEP
};



sprite_index = spr_joueur_down
current_type = obj_joueur
image_speed = 0


current_player = noone
mode_edition = EDITEUR_MODE.NORMAL

begin_arrow = noone
current_arrow = noone




//Pour que les objets ne bougent pas.
obj_menu.mode = MENU_MODE.CONSTRUCTION

//Création du tableau des salles créées
var i;
var j;
for (i = 0; i < 17; i += 1)
{
	for (j = 0; j < 16; j += 1)
	{
		if i==16 and j<6
		{
			created_room[i , j] = true
		}else
		{
			created_room[i , j] = false
		}
	}
}

nb_obj = 0
obj_list = ds_list_create();;

//Message d'erreur à afficher & indicateur de progression de la fenetre
error_message = ""
percent_error = 0


