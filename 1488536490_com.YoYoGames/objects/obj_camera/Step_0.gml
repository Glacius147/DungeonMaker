//slowly decay any applied shake
shake *= 0.9;

//screenshake
var cam = view_camera[0] 
camera_set_view_pos(cam,camera_get_view_x(cam)+random_range(-shake,shake),camera_get_view_y(cam)+random_range(-shake,shake)) 

var cam = view_camera[1] 
camera_set_view_pos(cam,camera_get_view_x(cam)+random_range(-shake,shake),camera_get_view_y(cam)+random_range(-shake,shake)) 

