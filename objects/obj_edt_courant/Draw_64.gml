/// @description draw minimap
// You can write your code in this editor

 if obj_menu.mode == MENU_MODE.PAUSE_EDT
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
