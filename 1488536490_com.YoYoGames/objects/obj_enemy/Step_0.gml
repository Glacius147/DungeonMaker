//Move towards player
if (instance_exists(obj_player_parent))
{
if target == noone
	{
	target = instance_nearest(x, y, obj_player_parent);
	}
move_towards_point(target.x,target.y,max(spd-(hit*spd),0));
}

//Angle sprite based on direction
image_angle = direction;

//Gradually reduce "just hit" effect
if (hit > 0) hit -= 0.05; else hit = 0;
