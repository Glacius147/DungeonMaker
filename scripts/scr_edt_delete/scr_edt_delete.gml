/// @desc elimine un objet pour l'éditeur, le supprime de la liste et supprime les dépendances
/// @arg element

var id_ = argument[0];

with (obj_dependance)
{
	if destination_id == id_ or origine_id = id_
	{
		pos = ds_list_find_index(obj_edt_courant.obj_list,id);
		ds_list_delete(obj_edt_courant.obj_list,pos);
		obj_edt_courant.nb_obj--
		instance_destroy(id);
	}
}

var pos = ds_list_find_index(obj_edt_courant.obj_list,id_);
if pos != 0
{
	ds_list_delete(obj_edt_courant.obj_list,pos);
}
else 
{
	if id_.object_index != obj_joueur
	{
	debug("gros probleme, le joueur n'etait pas en incide 0")	
	}
	obj_edt_courant.obj_list[| 0] = noone
}
obj_edt_courant.nb_obj--
instance_destroy(id_);

//debug("nombre d'objets",obj_edt_courant.nb_obj)