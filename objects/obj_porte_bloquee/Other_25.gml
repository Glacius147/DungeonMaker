/// @desc Changement de salle ! Si ouverte
if obj_menu.mode = MENU_MODE.JEU && actif
{

	var x_to = 0;
	var y_to = 0;

	if scr_wrap(image_angle,0,359) = 0 y_to = -1;
	if scr_wrap(image_angle,0,359) = 90 x_to = -1;
	if scr_wrap(image_angle,0,359) = 180 y_to = 1;
	if scr_wrap(image_angle,0,359) = 270 x_to = 1;

	scr_changement_salle(x_to,y_to) 
}
