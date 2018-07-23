/// @description Insert description here
// You can write your code in this editor

if obj_menu.mode == MENU_MODE.SELECT_SAVE or  obj_menu.mode == MENU_MODE.SELECT_LOAD or  obj_menu.mode == MENU_MODE.SELECT_SAVENLAUNCH or obj_menu.mode == MENU_MODE.SELECT_LOAD_EDT
{
	

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(font_menu);
	fee_index += fee_speed
	for (i=0; i < menu_item; i++)
	{
		var offset = 2;
		var txt = menu[i];
		if (menu_curseur == i)
		{
			draw_sprite_general(spr_fee,floor(fee_index),0,0,16,16,menu_x - 20*offset,menu_y + menu_itemheight * i * 1.5 -18-offset,2,2,0,offset_color,offset_color,offset_color,offset_color,1)
			//txt = string_insert("> ", txt,0);
			var col = c_white;
		}
		else
		{
			var col = c_gray;
		}
		

		draw_set_color(c_black);
		draw_text(menu_x - offset,menu_y + menu_itemheight * i * 1.5 + offset,txt);	
		draw_text(menu_x - offset,menu_y + menu_itemheight * i * 1.5 - offset,txt);	
		draw_text(menu_x + offset,menu_y + menu_itemheight * i * 1.5 + offset,txt);	
		draw_text(menu_x + offset,menu_y + menu_itemheight * i * 1.5 - offset,txt);	


		draw_set_color(col);
		draw_text(menu_x,menu_y + menu_itemheight * i * 1.5,txt);		
	}	
}	
	
	



/*
{
for (var i = 0; i < 3; ++i) {
    for (var j = 0 ; j < 2; ++j){
		if !file_exists("svg_slot"+string(i+3*j)+".json")	
		{
			draw_set_font(font_hub)
			draw_set_color(c_red)
			draw_text(128+256*i,200+360*j,"VIDE")
		}
	}
}
}
*/