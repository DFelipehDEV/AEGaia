/// scrPlayerHandleDestructive()
 // -- Handle collision with destructive objects

    if (boost || action == actionRoll || action == actionAirdash)
    {
        var wallDestroy;
        wallDestroy = scrPlayerCollisionObjectMain(x + xSpeed*1.5, y, objDestructiveWall);
        destroyed = false;
        if (wallDestroy != noone)
        {
            if (destroyed = false)
            {
                destroyed = true;
                with(wallDestroy)
                {
                    instance_destroy();
                }
            }
        }
        exit;
    }
