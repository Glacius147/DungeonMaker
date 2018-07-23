/// @desc affiche une zone de menu
/// @arg array
/// @arg toreplace
/// @arg replacement


var _array = argument[0];
var _old = argument[1];
var _new = argument[2];

var i
for (i = 0; i<array_length_1d(_array);i++)
{
	if _array[i] == _old
	{
		_array[i] = _new;
		break;
	}
}


return _array