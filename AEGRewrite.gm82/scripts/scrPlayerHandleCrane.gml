/// scrPlayerHandleCrane()
 //Handle Crane collision

    var handle;
    handle = scrPlayerCollisionObjectMain(x, y, objHandle);

    //Check if is meeting the fling sensor
    if (handle != noone && ySpeed >= 0)
    {
        if (action != ActionGrab)
        {
            scrPlaySound("sndPlayerGrab", global.volumeSounds, 1, false);
        }
        handle.playerID = id;
        x = handle.x;
        handle.pull = 1;
        xSpeed = 0;
        ySpeed = 0;

        action = ActionGrab;
        scrAnimationApply("HANG_1")
        movementAllow = false;
    }
