/// @description Insert description here
// You can write your code in this editor

gui_margin = 176;

w = display_get_gui_width();
h = display_get_gui_height();

fee_index = 0
fee_speed = 0.25

enum MODE_SELECT{
	NORMAL,	
	DELETE
}


offset_color = c_white;
mode_sel = MODE_SELECT.NORMAL

menu_x = (gui_margin);

menu_y = gui_margin;

menu_font = font_menu;
menu_itemheight = font_get_size(font_menu)*2;
menu_control = true;

touche_enfoncee = false;

ini_open("data.ini")
	for (var i = 0; i <6; i++)
{
	if file_exists("svg_slot"+string(i)+".json")
	{
		temps = ini_read_string("save", "save"+string(i), "(date inconnue)");
		menu[i] = "SLOT "+string(i+1)+" : "+temps
	} else
	{
		menu[i] = "SLOT "+string(i+1)+ " (VIDE)"
	}
	
	menu[6] = "DELETE"
}
ini_close()

menu_item = 7;
menu_curseur = 0;
menu_selection = -1;

