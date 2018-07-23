/// @description Insert description here
// You can write your code in this editor


var current_x = camera_get_view_x(view_camera[1])
var current_y = camera_get_view_y(view_camera[1])

var delta_y = 64 * (1-sens)

camera_set_view_pos(view_camera[1], current_x,current_y+delta_y);