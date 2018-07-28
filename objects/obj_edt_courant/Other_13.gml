/// @description SAVE'N LAUNCH
// You can write your code in this editor

if obj_list[| 0] != noone
{

obj_menu.mode = MENU_MODE.SELECT_SAVENLAUNCH
room_goto(room_select)

} else {
	obj_menu.mode = MENU_MODE.PAUSE_EDT	
	message_halign = fa_center
	message_valign = fa_center
	message_font = font_menu
	message_x = 768/2
	message_y = 360
	error_message = "Il faut placer le héro !"
	
}