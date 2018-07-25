/// @descr HP ++
if actif
{
	audio_sound_pitch(son_pickup,random_range(0.8,1.2));
	audio_play_sound(son_pickup,2,0);
	obj_joueur.objet_a = spr_master_sword;
	obj_joueur.degats = 2;
	obj_joueur.spr_attaque = spr_joueur_attaque_master_sword;
	instance_change(obj_master,false);
}