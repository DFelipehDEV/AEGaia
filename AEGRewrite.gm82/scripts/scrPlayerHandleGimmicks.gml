/// scrPlayerHandleGimmicks()
 // -- Handle collision with gimmicks

    // -- Check if is coliding with the corkscrew and is going fast in flat ground
    if (scrPlayerCollisionObjectMain(x, y, objCorkscrew) != noone && abs(xSpeed) >= 6 && ground == true && action != ActionCorkscrew)
    {
        // -- Check if is not rolling
        if (animationIndex != "ROLL" && animationIndex != "CORKSCREW")
        {
            // -- If is not rolling, walk on the corkscrew
            scrAnimationApply("CORKSCREW");
        }
        action = ActionCorkscrew;
        ground = false;
        scrPlayerAngleSet(0);
    }
