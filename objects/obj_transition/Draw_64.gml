/// @description Cadres noirs

if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*h/2,false);
	draw_rectangle(0,h-percent*h/2,w,h,false);
}

