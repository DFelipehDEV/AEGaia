/// scrPlayerHandleWallJump()

    var wallL, wallR;
    wallL = scrPlayerCollisionObjectLeft(x, y, 0, maskBig, objWalljumpTrigger)

    // -- Check if its going on the direction of a left wall and touching the trigger
    if (wallL != noone && animationDirection == -1 && xSpeed <= 0)
    {
        if ((action == ActionJump || action == ActionNormal || action == ActionSpring) && ground == false)
        {
            xSpeed = 0;
            action = ActionWalljump;
            ySpeed = 0;

            scrAnimationApply("WALLGRAB");
            animationDirection = 1;
        }
    }

     wallR = scrPlayerCollisionObjectRight(x, y, 0, maskBig, objWalljumpTrigger)

    // -- Check if its going on the direction of a right wall and touching the trigger
    if (wallR != noone && animationDirection == 1 && xSpeed >= 0)
    {
        if ((action == ActionJump || action == ActionNormal || action == ActionSpring) && ground == false)
        {
            xSpeed = 0;
            action = ActionWalljump;
            ySpeed = 0;

            scrAnimationApply("WALLGRAB");
            animationDirection = -1;
        }
    }
