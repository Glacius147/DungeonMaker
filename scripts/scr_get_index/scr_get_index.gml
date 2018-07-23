/// @desc renvoie l'index de l'element
/// @arg array
/// @arg element


var _array = argument[0];
var _elt = argument[1];

var i
for (i = 0; i<array_length_1d(_array);i++)
{
	if _array[i] == _elt
	{
		return i
		break;
	}
}


return -1