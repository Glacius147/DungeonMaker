/// @description déplacement de la caméra dans la salle suivante
// You can write your code in this editor
if mode_old{
//position actuelle
var current_pos_x = camera_get_view_x(view_camera[0])
var current_pos_y = camera_get_view_y(view_camera[0])

//modification
var new_x = current_pos_x 
var new_y = current_pos_y - 16*11

//Vérification qu'on est pas hors champ
new_x = min(new_x,4096-256)
new_x = max(new_x,0)

new_y = min(new_y,2816-176)
new_y = max(new_y,0)

//Déplacement de la caméra
camera_set_view_pos(view_camera[0],new_x ,new_y);
}