/// scrPlayerHandleFling()
 // -- Handle fling ramp collision

    // -- Check if is meeting the fling sensor
    if (scrPlayerCollisionObjectMain(x, y, objFlingSensor) && ground == true && abs(xSpeed) >= 6)
    {
        ground = false;
        xSpeed = (xSpeed * dcos(angle)) - abs(xSpeed/2.3) * dsin(angle)
        ySpeed = (xSpeed * -dsin(angle)) - abs(xSpeed/2.3)* dcos(angle)

        action         = actionNormal;
        scrAnimationApply("FLING");
        scrPlaySound("sndPlayerJump", global.volumeSounds, 1, false);
        scrPlayerAngleSet(0);
    }
