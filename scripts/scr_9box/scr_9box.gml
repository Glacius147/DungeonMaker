/// @desc affiche une zone de menu
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var _x1 = argument[1];
var _y1 = argument[2];
var _x2 = argument[3];
var _y2 = argument[4];

var _size = sprite_get_width(argument[0])/3;

var _w = _x2 - _x1;
var _h = _y2 - _y1;

var _col = (_w div _size )-1;
var _ligne = (_h div _size)-1;

//coins
//hg
draw_sprite_part(argument[0],0,0,0,_size,_size,_x1,_y1);
//hd
draw_sprite_part(argument[0],0,2*_size,0,_size,_size,_x1+_col*_size,_y1);
//bg
draw_sprite_part(argument[0],0,0,2*_size,_size,_size,_x1,_y1+_ligne*_size);
//bd
draw_sprite_part(argument[0],0,2*_size,2*_size,_size,_size,_x1+_col*_size,_y1+_ligne*_size);


//bords
for (var _i=1;_i<_col;_i++)
{
	//bord haut
	draw_sprite_part(argument[0],0,_size,0,_size,_size,_x1+_i*_size,_y1);
	//bord bas
	draw_sprite_part(argument[0],0,_size,2*_size,_size,_size,_x1+_i*_size,_y1+_ligne*_size);	
}

for (var _i=1;_i<_ligne;_i++)
{
	//bord gauche
	draw_sprite_part(argument[0],0,0,_size,_size,_size,_x1,_y1+_i*_size);
	//bord droite
	draw_sprite_part(argument[0],0,2*_size,_size,_size,_size,_x1+_col*_size,_y1+_i*_size);	
}


//centre
for (var _i=1;_i<_ligne;_i++)
{
	for (var _j=1;_j<_col;_j++)
	{
		draw_sprite_part(argument[0],0,_size,_size,_size,_size,_x1+_j*_size,_y1+_i*_size);
	}
}


