/// @description SAVE'N LAUNCH
// You can write your code in this editor

if current_player != noone
{

obj_menu.mode = MENU_MODE.SELECT_SAVENLAUNCH
room_goto(room_select)

} else {
	obj_menu.mode = MENU_MODE.PAUSE_EDT
	error_message = "Il faut placer le héro !"
	
}