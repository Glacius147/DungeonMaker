/// @description draw minimap
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.CONSTRUCTION
{
c_x = camera_get_view_x(view_camera[0])
c_y = camera_get_view_y(view_camera[0])

var current_room_x = floor(c_x/256)
var current_room_y = floor(c_y/176)


//draw minimap
var offset_x = 15*3-12
var offset_y = 6*3
var i;
var j;

draw_set_color(c_blue);
draw_rectangle( 6*3, 6*3-12,75*3+12, 59*3,false);
for (i = 0; i < 16; i += 1)
	{
		for (j = 0; j < 16; j += 1)
		{
			
			x1 = 3*4*i + offset_x
			y1 = 3*3*j + offset_y
			if current_room_x<16 and i == current_room_x and j == current_room_y
			{
				draw_set_color(c_red);
				draw_rectangle(x1, y1, x1+12, y1+9, false);
			}
			else if created_room[i,j] 
			{
				draw_set_color(c_black);
				draw_rectangle(x1, y1, x1+12, y1+9, false);
			}
			
			//draw_set_color(c_black);
			//draw_rectangle(x1, y1, x1+12, y1+9, true);
		}
	}
} else if obj_menu.mode == MENU_MODE.PAUSE_EDT
{
	x1 = floor(768/2*(1-percent_error)+50*percent_error)
	y1 = floor(720/2*(1-percent_error)+50*percent_error)
	x2 = ceil(768/2*(1-percent_error)+718*percent_error)
	y2 = ceil(720/2*(1-percent_error)+670*percent_error)
	
	scr_9box(spr_9box_red_full,x1,y1,x2,y2)
	if percent_error == 1{
		
		draw_set_color(c_black);
		draw_set_halign(message_halign);
		draw_set_valign(message_valign);
		draw_set_font(message_font);
		draw_text(message_x,message_y,error_message)	
	}
	
	
}
