//Fire when pressing the left mouse button
if (keyboard_check(vk_space)) 
{
	//reduce speed to account for recoil
	spd = 2;
	if (cooldown == 0)
	{
		//reduce ammo of special weapon if necessary
		ammo--;
		if (ammo < 1) weapon = 0;
		
		//fire normal weapon (1 bullet)
		if (weapon == 0)
		{
			bullet = instance_create_layer(x,y,"lay_bullets",obj_bullet);
			with (bullet)
				{
				direction = other.direction + random_range(-4,4);
				image_angle = direction;
				}
		}
		else
		{
			//fire special weapon (3 bullets split)
			bullet = instance_create_layer(x,y,"lay_bullets",obj_bullet2);
			with (bullet)
				{
				direction = other.direction + random_range(-4,4);
				image_angle = direction;
				}
			bullet = instance_create_layer(x,y,"lay_bullets",obj_bullet2);
			with (bullet)
				{
				direction = other.direction + random_range(-4,4) - 15;
				image_angle = direction;
				}
			bullet = instance_create_layer(x,y,"lay_bullets",obj_bullet2);
			with (bullet)
				{
				direction = other.direction + random_range(-4,4) + 15;
				image_angle = direction;
				}
		}
		//set cooldown to current weaponspeed
		cooldown = weaponspd;
	}
}
else 
{
	//restore speed to default
	spd = basespd; 
}


//tick down cooldown every frame
if (cooldown > 0) cooldown--; 

//Move in four directions when pressing arrow keys.

if (keyboard_check(ord("A")))	image_angle += 5;
if (keyboard_check(ord("D")))	image_angle -= 5;
if (keyboard_check(ord("W")))
{
speed = clamp(speed + 0.5, 0 ,spd);
}
direction = image_angle;