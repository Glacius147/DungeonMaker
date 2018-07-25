/// @desc renvoie la position correspondante dans l'editeur
/// @arg x
/// @arg y

x_ = argument[0]
y_ = argument[1]


// 73 = 76 - 3
//pour le 76, voir le rectangle bleu dans obj_edt_courant.Draw (74+2)

if x_<16*256 {return EDITEUR_POSITION.SALLE;}
else if y_<6*176 {return EDITEUR_POSITION.SOUTERRAIN;}
else if (x_>4096+6 and x_<4096+73) {return EDITEUR_POSITION.MINIMAP;}
else {return EDITEUR_POSITION.PALETTE;}