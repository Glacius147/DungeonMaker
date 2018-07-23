/// @description lance save/load en cas de retour
// You can write your code in this editor

if obj_select.file != ""
{
	if obj_menu.mode = MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode = MENU_MODE.SELECT_SAVE
	{
		event_user(0)
	} else if obj_menu.mode = MENU_MODE.SELECT_LOAD_EDT
	{
		event_user(1)	
	}
}

alarm_set(0,1)
