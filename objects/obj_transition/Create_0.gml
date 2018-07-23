/// @description Initialisation

w = display_get_gui_width();
h = display_get_gui_height();

enum TRANS_MODE
{
	OFF,
	GOTO,
	NEXT,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;

percent = 1;
target = room;
