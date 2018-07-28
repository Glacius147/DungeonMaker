/// @description mise dans la bonne salle + caméra


room_current_x = room_origine_x
room_current_y = room_origine_y

//show_debug_message(room_current_x)
//show_debug_message(room_current_y)

camera_set_view_pos(view_camera[0], 256*room_current_x  ,176*room_current_y);

