/// @description Insert description here
// You can write your code in this editor

//TODO : Attention à l'usage de scr_input si on veux gérer l'editeur à la manette.
scr_input()

var d_x = 0
var d_y = 0

if kp_down {d_y = 1;}
if kp_up {d_y = -1;}
if kp_right {d_x = 1;}
if kp_left {d_x = -1;}

//??? TODO : changer en current_room_x 
var current_pos_x = camera_get_view_x(view_camera[0]) div 256
var current_pos_y = camera_get_view_y(view_camera[0]) div 176


if (current_pos_x == 15 and d_x = 1 and current_pos_y>5) {d_x = 0}
if (current_pos_x == 16 and d_y = 1 and current_pos_y>5) {d_y = 0}


var new_x = current_pos_x + d_x
var new_y = current_pos_y + d_y

new_x = max(new_x,0)
new_y = max(new_y,0)

new_x = min(new_x,16)
new_y = min(new_y,15)


camera_set_view_pos(view_camera[0],new_x * 256 ,new_y * 176);