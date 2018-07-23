/// @desc scr_transition(mode,room)
/// @arg mode
/// @arg [target_room] (uniquement pour le mode goto)

with obj_transition
{
	mode = argument[0];
	if argument_count > 1 target = argument[1];
}



