/// @description  scrPlayerActionRoll()

    animationFrameSpeed = 0.2 + abs(xSpeed)/17;

    if (distance_to_object(objSlidepassSensor) > 15)
    {
        // -- Check if is going to the right
        if (xSpeed > 0)
        {
            // -- Decelerate depending on what are you pressing
            if (keyLeft == true)
            {
                xSpeed -= rollDecFric;
            }
            else
            if (keyRight == true)
            {
                xSpeed -= rollDecLight;
            }
            else
            // -- Decelerate normally
            {
                xSpeed -= rollDec;
            }

            // -- Set the xSpeed to 0 if it got lower than 0 and back to the normal state
            if (xSpeed <= 0)
            {
                xSpeed = 0;
                action = ActionNormal;
            }
        }
        // -- Check if is going to the left
        else
        if (xSpeed < 0)
        {
            // -- Decelerate depending on what are you pressing
            if (keyLeft == true)
            {
                xSpeed += rollDecLight;
            }
            else
            if (keyRight == true)
            {
                xSpeed += rollDecFric;
            }
            else
            {
                xSpeed += rollDec;
            }
        }
    }
    else
    {
        allowKeyTimer = 15;
    }


    // -- Physics
    if (sign(xSpeed) == sign(angleSin))
    {
        xSpeed -= rollDecSlopeUp * angleSin;
    }

    if (sign(xSpeed) != sign(angleSin))
    {
        xSpeed -= rollDecSlopeDown * angleSin;
    }


    // -- Stop rolling
    if (floor(xSpeed) == 0)
    {
        action = ActionNormal;
    }

    if (keySpecial1Pressed == true)
    {
        action = ActionNormal;
    }


    // -- Set the jump action if is not in the ground anymore
    if (ground == false)
    {
        action = ActionJump;
        scrPlayerAirdashReset();
    }
