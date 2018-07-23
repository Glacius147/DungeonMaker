/// @description switch erase mode
// You can write your code in this editor


with obj_poubelle{
	image_index = 1-image_index	
}

switch(mode_edition)
{
	case EDITEUR_MODE.ERASER:
		mode_edition = EDITEUR_MODE.NORMAL
		sprite_index = -1;
		current_type= noone;
		break;
	case EDITEUR_MODE.ERASER_DEP:
		mode_edition = EDITEUR_MODE.DEPENDANCE_1
		with obj_master
		{
			if !activant{
				image_alpha = 0.5	
			} else {
				image_alpha = 1	
			}
		}
		
		with (obj_dependance)
		{
			image_alpha = 1
		}
		sprite_index = -1
		current_type = obj_dependance
		break;
	case EDITEUR_MODE.NORMAL:
		mode_edition = EDITEUR_MODE.ERASER
		sprite_index = spr_eraser;
		current_type = noone;
		break;
	case EDITEUR_MODE.DEPENDANCE_1:
	case EDITEUR_MODE.DEPENDANCE_2://au cas ou mais normalement useless
		mode_edition = EDITEUR_MODE.ERASER_DEP
		with obj_master
		{
				image_alpha = .5
		}
		with (obj_dependance)
		{
			image_alpha = 1
		}
		sprite_index = spr_eraser;
		current_type = noone;
		break;
	
} 