/// @description SAVE
// You can write your code in this editor

if current_player != noone
{

obj_menu.mode = MENU_MODE.SELECT_SAVE
room_goto(room_select)

}
else {
	error_message = "IL FAUT PLACER LE HERO !\n\n\n (RETOUR : ENTREE)"
	message_halign = fa_center
	message_valign = fa_center
	message_font = font_menu
	message_x = 768/2
	message_y = 360
	obj_menu.mode = MENU_MODE.PAUSE_EDT
	
}