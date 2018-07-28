/// @desc change vers le mode demandé
/// @arg to_mode

/* Rappel des modes
enum EDITEUR_MODE{
	NORMAL,
	DEPENDANCE_1,
	DEPENDANCE_2,
	ERASER,
	ERASER_DEP
};

*/

/*
Dans l'ordre
1) changement des icones
2) transparence des objets
3) curseur : image_angle/sprite_index/current_type
+
changement vers ce mode
*/

var to_mode_ = argument[0]
var from_mode = mode_edition

switch(to_mode_)
{
	case EDITEUR_MODE.NORMAL:
		if from_mode != EDITEUR_MODE.NORMAL{
			with obj_switch_trigger {image_index = 0}
			with obj_poubelle {image_index = 0}
			with obj_master {image_alpha = 1;}
			with obj_dependance {image_alpha = 0.2;}
			image_angle = 0
			image_xscale = 1
			sprite_index = former_sprite_index;
			current_type = former_current_type;
			former_sprite_index = sprite_index;
			former_current_type = current_type;
		}
		break;
	case EDITEUR_MODE.DEPENDANCE_1:
		with obj_switch_trigger {image_index = 1}
		with obj_poubelle {image_index = 0}
		with obj_master
		{
			if !activant{image_alpha = 0.5;}
			else {image_alpha = 1;}
		}
		with obj_dependance {image_alpha = 1;}
		image_angle = 0
		image_xscale = 1
		if from_mode = EDITEUR_MODE.NORMAL{
			former_sprite_index = sprite_index;
			former_current_type = current_type;	
		}
		sprite_index = -1;
		current_type = obj_dependance;
		break;
	case EDITEUR_MODE.DEPENDANCE_2:
		with obj_switch_trigger {image_index = 1}
		with obj_poubelle {image_index = 0}
		with obj_master
		{
			if !activable{image_alpha = 0.5;}
			else {image_alpha = 1;}
		}
		with obj_dependance {image_alpha = 1;}
		image_angle = 0
		image_xscale = 1
		if from_mode = EDITEUR_MODE.NORMAL{
			former_sprite_index = sprite_index;
			former_current_type = current_type;	
		}
		sprite_index = spr_fleche1;
		current_type = obj_dependance;
		break;
	case EDITEUR_MODE.ERASER:
		with obj_switch_trigger {image_index = 0}
		with obj_poubelle {image_index = 1}
		with obj_master {image_alpha = 1;}
		with obj_dependance {image_alpha = 0.2;}
		image_angle = 0
		image_xscale = 1
		if from_mode = EDITEUR_MODE.NORMAL{
			former_sprite_index = sprite_index;
			former_current_type = current_type;	
		}
		sprite_index = spr_eraser;
		current_type = noone;
		break;
	case EDITEUR_MODE.ERASER_DEP:
		with obj_switch_trigger {image_index = 1}
		with obj_poubelle {image_index = 1}
		with obj_master {image_alpha = .5;}
		with obj_dependance {image_alpha = 1;}
		image_angle = 0
		image_xscale = 1
		if from_mode = EDITEUR_MODE.NORMAL{
			former_sprite_index = sprite_index;
			former_current_type = current_type;	
		}
		sprite_index = spr_eraser;
		current_type = noone;
		break;

}

mode_edition = to_mode_