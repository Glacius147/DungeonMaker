/// @descr Mode pour les sous terrains


room_origine_x = floor(x/256)
room_origine_y = floor(y/176)

enum TYPE_SALLE
{
	SURFACE,
	SOUS_TERRE
}

if x>4096{
	t_salle = TYPE_SALLE.SOUS_TERRE
}
else
{
	t_salle = TYPE_SALLE.SURFACE;
}