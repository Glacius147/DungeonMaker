/// @description Initialisation variables

randomize();



gui_margin = 64;

w = display_get_gui_width();
h = display_get_gui_height();

x1 = room_width/2;
x2 = x1;
y1 = room_height/2;
y2 = y1;

menu_x = w + 200;

menu_y = h - gui_margin;
menu_x_target = w - gui_margin;
menu_speed = 25; //lower is faster
menu_font = font_menu;
menu_itemheight = font_get_size(font_menu);
menu_selection = -1;
menu_control = true;

touche_enfoncee = false;

enum TYPE_DECO
{
	BOTW,
	DESERT,
	GLACE
}

nb_deco = 3
t_deco = TYPE_DECO.BOTW;

enum MENU_MODE
{
	JEU,
	PAUSE,
	FADE,
	INTRO,
	MENU,
	CONSTRUCTION,
	UP,
	DOWN,
	CHANGEMENT_SALLE,
	SELECT_SAVE,
	SELECT_SAVENLAUNCH,
	SELECT_LOAD,
	SELECT_LOAD_EDT,
	PAUSE_EDT,
	VICTOIRE
}




mode = MENU_MODE.MENU;

percent = 0;

menu[2] = "Chargement d'un donjon";
menu[1] = "Création d'un donjon";
//menu[1] = "Exploration d'un donjon";
menu[0] = "Quitter";

menu_item = array_length_1d(menu);
menu_curseur = 2;



#region // Table correspondance id objet/id sauvegarde/layers

global.list_item[0] = string(obj_mur_salle);
global.layer_item[0] = "salles"

global.list_item[1] = string(obj_joueur);
global.layer_item[1] = "mob"

global.list_item[2] = string(obj_bloc);
global.layer_item[2] = "items"

global.list_item[3] = string(obj_blop);
global.layer_item[3] = "mob"

global.list_item[4] = string(obj_mur);
global.layer_item[4] = "mur_exploses"

global.list_item[5] = string(obj_porte);
global.layer_item[5] = "mur_exploses"

global.list_item[6] = string(obj_porte_bloquee);
global.layer_item[6] = "mur_exploses"

global.list_item[7] = string(obj_porte_fermee);
global.layer_item[7] = "mur_exploses"

global.list_item[8] = string(obj_porte);
global.layer_item[8] = "mur_exploses"

global.list_item[9] = string(obj_clef);
global.layer_item[9] = "items"

global.list_item[10] = string(obj_bombe_loot);
global.layer_item[10] = "items"

global.list_item[11] = string(obj_coeur);
global.layer_item[11] = "items"

global.list_item[12] = string(obj_moblin);
global.layer_item[12] = "mob"

global.list_item[13] = string(obj_bloc_explosable);
global.layer_item[13] = "items"

global.list_item[14] = string(obj_mur_explosable);
global.layer_item[14] = "mur_exploses"

global.list_item[15] = string(obj_dependance);
global.layer_item[15] = "Instances_dep"

global.list_item[16] = string(obj_fantome);
global.layer_item[16] = "items"

global.list_item[17] = string(obj_escalier);
global.layer_item[17] = "mur_exploses"

global.list_item[18] = string(obj_bat);
global.layer_item[18] = "mob"

global.list_item[19] = string(obj_map);
global.layer_item[19] = "items"

global.list_item[20] = string(obj_triforce);
global.layer_item[20] = "items"

global.list_item[21] = string(obj_master_sword);
global.layer_item[21] = "items"

global.list_item[22] = string(obj_cryo_loot);
global.layer_item[22] = "items"

global.list_item[23] = string(obj_magnis_loot);
global.layer_item[23] = "items"

global.list_item[24] = string(obj_fee);
global.layer_item[24] = "mob"

global.list_item[25] = string(obj_eau);
global.layer_item[25] = "mur_exploses"

global.list_item[26] = string(obj_coeur_cont);
global.layer_item[26] = "items"

global.list_item[27] = string(obj_torche_loot);
global.layer_item[27] = "items"

global.list_item[28] = string(obj_bloc_metal);
global.layer_item[28] = "items"

global.list_item[29] = string(obj_bloc_piques);
global.layer_item[29] = "mob"

global.list_item[30] = string(obj_bloc_statue);
global.layer_item[30] = "items"

global.list_item[31] = string(obj_bloc_torche);
global.layer_item[31] = "items"

global.list_item[32] = string(obj_bloc_tourelle);
global.layer_item[32] = "mob"

global.list_item[33] = string(obj_gel);
global.layer_item[33] = "mur_exploses"

global.list_item[34] = string(obj_dragon);
global.layer_item[34] = "mob"

global.list_item[35] = string(obj_bottes_fer);
global.layer_item[35] = "items"

global.list_item[36] = string(obj_bloc_inter);
global.layer_item[36] = "mur_exploses"

global.list_item[37] = string(obj_bloc_im);
global.layer_item[37] = "items"

global.list_item[38] = string(obj_bordure);
global.layer_item[38] = "mur_exploses"

global.list_item[39] = string(obj_bordure_angle);
global.layer_item[39] = "mur_exploses"

#endregion

global.map_item_layer = ds_map_create()
var i;
nb_item = array_length_1d(global.list_item);
for (i = 0; i<nb_item; i+=1)
{
	element = global.list_item[i]
	c_layer = global.layer_item[i]
	ds_map_add(global.map_item_layer,element,c_layer)
}

global.map_item_index = ds_map_create()
var i;
nb_item = array_length_1d(global.list_item);
for (i = 0; i<nb_item; i+=1)
{
	coress = global.list_item[i]
	ds_map_add(global.map_item_index,coress,i)
}

ini_open("data.ini")
version = ini_read_real("version", "version", -1);

if version < 2
{
	for (var i=0;i<6;i++)
	{
		if file_exists("svg_slot"+string(i)+".json")
		{
			file_delete("svg_slot"+string(i)+".json")
		}
	}
	ini_write_real("version","version",2)
}
ini_close()



//ajoute le nivo 0 si le slot est libre.
if !file_exists("svg_slot0.json")
{
	file_copy("svg_slot_0.json","svg_slot0.json")
}


if !file_exists("svg_slot1.json")
{
	file_copy("svg_slot_1.json","svg_slot1.json")
}

if !file_exists("svg_slot2.json")
{
	file_copy("svg_slot_2.json","svg_slot2.json")
}
/*
if !file_exists("svg_slot3.json")
{
	file_copy("svg_slot_3.json","svg_slot3.json")
}
*/