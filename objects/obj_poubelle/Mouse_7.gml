/// @description Insert description here
// You can write your code in this editor

with obj_edt_courant{
	if mode_edition == EDITEUR_MODE.NORMAL { scr_edt_mode(EDITEUR_MODE.ERASER);}
	else if mode_edition == EDITEUR_MODE.ERASER { scr_edt_mode(EDITEUR_MODE.NORMAL);}
	else if mode_edition == EDITEUR_MODE.DEPENDANCE_1 { scr_edt_mode(EDITEUR_MODE.ERASER_DEP);}
	else if mode_edition == EDITEUR_MODE.ERASER_DEP { scr_edt_mode(EDITEUR_MODE.DEPENDANCE_1);}
}