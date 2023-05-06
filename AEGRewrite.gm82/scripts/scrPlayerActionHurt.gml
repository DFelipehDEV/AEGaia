/// @description  scrPlayerActionHurt()

    // -- Check if the player has landed
    if (ground == true)
    {
        // -- Land
        if (animationIndex == "HURT_FALL")
        {
            xSpeed = 0;
            scrAnimationApply("HURT_LAND");
        }


        // -- Back to the normal action
        if (animationIndex == "HURT_LAND")
        {
            if (animationFinished == true)
            {
                invincibility      = invincibilityBlink;
                invincibilityTimer = 210;
                action             = actionNormal;
            }
        }
    }
