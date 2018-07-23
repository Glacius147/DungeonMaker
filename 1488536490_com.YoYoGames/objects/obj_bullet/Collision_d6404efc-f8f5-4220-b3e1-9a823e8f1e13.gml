//Reduce enemy hitpoints on collision
var _p = pnum;

with(other)
{
	hp--;
	hit = 1;
	if (hp <= 0)
		{
		if _p == 1
			{
			with (obj_player_1) pscore++;
			}
		else
			{
			with (obj_player_2) pscore++;
			}
		instance_destroy();
		}
}

//destroy the bullet
instance_destroy();