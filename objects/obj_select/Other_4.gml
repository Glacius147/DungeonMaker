/// @description Insert description here
// You can write your code in this editor


mode_sel = MODE_SELECT.NORMAL

if room == room_select{
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
	}
	menu[6] = "DELETE"
	
}
ini_close()

menu_curseur = 0;
menu_control = true;