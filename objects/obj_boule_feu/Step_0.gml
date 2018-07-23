/// @description ?

current_room_x = floor(x/256);
current_room_y = floor(y/176);

if current_room_x != obj_joueur.room_current_x || current_room_y != obj_joueur.room_current_y  instance_destroy();


if obj_menu.mode = MENU_MODE.JEU speed = vitesse_marche else speed = 0;