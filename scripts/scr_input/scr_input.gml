/// @desc scr_input()
// Récupére les input et les place dans les variables de l objet
k_left = keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < -0.3);
k_right = keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0.3); 
k_up = keyboard_check(vk_up) || (gamepad_axis_value(0,gp_axislv) < -0.3);
k_down = keyboard_check(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0.3);
kp_attaque = keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0,gp_face1);
kp_objet = keyboard_check_pressed(ord("N")) || gamepad_button_check_pressed(0,gp_face2);
kp_start = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_start);
k_objet = keyboard_check(ord("N")) || gamepad_button_check(0,gp_face2);

//On emepche d'aller a gauche & a droite en meme temps
if k_left && k_right
{
	k_left = false;
	k_right = false;
}

//idem haut & bas
if k_up && k_down
{
	k_up = false;
	k_down = false;
}

//gestion des kp_direction
kp_up = obj_input.kp_up;
kp_down = obj_input.kp_down;
kp_right = obj_input.kp_right;
kp_left = obj_input.kp_left;
