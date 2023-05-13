/// scrPlayerActionWalljump()

    ySpeed = 1.5;

    if (keyActionPressed == true)
    {
        xSpeed = 6*animationDirection;
        ySpeed = -6;

        action         = actionNormal;
        scrAnimationApply("LAUNCH");
        scrPlaySound("sndPlayerJump", global.volumeSounds, 1, false);
    }

    if (!scrPlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpTrigger) && !scrPlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpTrigger))
    {
        action = actionNormal;
    }
