/// scrPlayerHandleProjectile()
 // -- Handle collison with projectiles

    var projectile;
    projectile = scrPlayerCollisionHitbox(x, y, parProjectile);

    //Check if is meeting the projectile
    if (projectile != noone)
    {
        //Check if it has a shield
        if (shield != 0)
        {
            //Reflect projectiles with shields
            with (projectile)
            {
                hspeed = -sign(hspeed);
                vspeed = -4;
            }
        }
        //Otherwise, if there is no shield
        else
        {
            //Hurt the player
            scrPlayerHurtSet();
        }
    }
