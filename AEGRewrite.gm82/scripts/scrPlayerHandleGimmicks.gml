/// scrPlayerHandleGimmicks()
 // -- Handle collision with gimmicks

    // -- Corkscrew
    var gimmickCorkscrew;
    gimmickCorkscrew = scrPlayerCollisionObjectMain(x, y, objCorkscrew)

    // -- Check if is coliding with the corkscrew and is going fast in flat ground
    if (gimmickCorkscrew != noone && abs(xSpeed) >= 4 && ground == true && action != actionCorkscrew)
    {
        // -- Check if is not rolling
        if (animationIndex != "ROLL" && animationIndex != "CORKSCREW")
        {
            // -- If is not rolling, walk on the corkscrew
            animationIndex = "CORKSCREW";
        }
        action = actionCorkscrew;
        ground = false;
        scrPlayerAngleSet(0);
    }
