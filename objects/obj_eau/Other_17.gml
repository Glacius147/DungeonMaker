/// @descr Actualisation de la version en fonction de item_version

if item_version = 1 image_index = 3 else image_index = 0;

if obj_menu.mode = MENU_MODE.JEU && item_version = 1 instance_change(obj_gel,true);
