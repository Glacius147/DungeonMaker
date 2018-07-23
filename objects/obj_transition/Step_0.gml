/// @description Progression dans les transitions

if mode != TRANS_MODE.OFF
{
	if mode = TRANS_MODE.INTRO
	{
		percent = max(0,percent*0.9-0.01);		
	}
	else
	{
		percent = min(1,percent+(1-percent)*0.1+0.01);		
	}
	
	if (percent = 0) or (percent = 1)
	{
		switch mode
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);				
				break;
			}					
			case TRANS_MODE.RESTART:
			{
				game_restart();				
				break;
			}			
		}
	}
}



