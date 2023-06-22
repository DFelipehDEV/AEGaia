/// scrPlayerHandleWayLauncher()
 // -- Handles collision with way launchers

    var waylauncher;
    waylauncher = scrPlayerCollisionHitbox(x, y, objWayLauncher)

    if (waylauncher != noone)
    {
        if (waylauncher.sprite_index == sprWayLauncher && action != actionWayLauncher && action != actionHurt && ground == false)
        {
            x      = waylauncher.x;
            y      = waylauncher.y;
            visible = false;

            xSpeed = 0;
            ySpeed = 0;
            action = actionWayLauncher;
            scrAnimationApply("");

            with(waylauncher)
            {
                timerExit = 0;
            }

            scrPlaySound("sndWayLauncherWait", global.volumeSounds, 1, true);
        }
    }
