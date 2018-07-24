///@desc Loot lors de la mort d'un mob

if random(1)<0.5 instance_create_layer(x,y,"items",obj_coeur);
else if random(1)<0.01 instance_create_layer(x,y,"items",obj_fee);
else if random(1)<0.1 && obj_joueur.bombes_possede instance_create_layer(x,y,"items",obj_bombe_loot);
