//Change player's weapon on collision
with (other)
{
	weapon = 1;
	weaponspd = 5;
	ammo = 20;
}
//then destroy
instance_destroy();