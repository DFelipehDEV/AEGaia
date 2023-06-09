/// scrPlayerActionSlide()

    // -- Animation speed
    animationFrameSpeed = 0.2 + abs(xSpeed)/18;

    if (distance_to_object(objSlidepassSensor) > 15)
    {
        // -- Decelerate while going to the left
        if (xSpeed < 0)
        {
            xSpeed += slideDec;
        }

        // -- Decelerate while going to the right
        if (xSpeed > 0)
        {
            xSpeed -= slideDec;
        }

        // -- Decrease reset timer if is not holding the slide key
        if (keyDown== false && slideResetTimer > 0)
        {
            slideResetTimer -= 1;
        }

        // -- Back to the normal action if the player stopped or is not in the ground anymore
        if (ground == false || floor(xSpeed) == 0 || keyDown == false && slideResetTimer == 0)
        {
            action = ActionNormal;
        }
    }
    else
    {
        allowKeyTimer = 15;
    }

    // -- Create dust effect
    if (alarm[0] == -1)
    {
        alarm[0] = 3;
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
