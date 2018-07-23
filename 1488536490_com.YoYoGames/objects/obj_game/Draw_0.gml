draw_set_halign(fa_center);

// Draw the score to the correct view by polling the current view
// Draw events are triggered once for EACH view so this event will run twice

if view_current == 0
{
var _scr = obj_player_1.pscore;
}
else
{
var _scr = obj_player_2.pscore;
}


draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_set_font(fnt_smaller);
draw_text(
	2+camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,
	2+camera_get_view_y(view_camera[view_current])+16,"Score");
	

draw_set_font(fnt_score);
draw_text(
	2+camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,
	2+camera_get_view_y(view_camera[view_current])+54,_scr);


//Draw regular text
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_font(fnt_smaller);
draw_text(
	camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,
	camera_get_view_y(view_camera[view_current])+16,"Score");
	

draw_set_font(fnt_score);
draw_text(
	camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,
	camera_get_view_y(view_camera[view_current])+54,_scr);