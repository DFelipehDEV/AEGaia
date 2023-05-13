/// scrPlayerActionSkid()

    // -- Decelerate while going to the left
    if (xSpeed < 0)
    {
        xSpeed += skidDec;

        // -- Back to the normal action if the player stopped or is not in the ground anymore or is not holding the key anymore
        if (xSpeed >= 0 || keyRight == false || ground == false)
        {
            action = actionNormal;
        }
    }
    // -- Decelerate while going to the right
    else
    if (xSpeed > 0)
    {
        xSpeed -= skidDec;

        // -- Back to the normal action if the player stopped or is not in the ground anymore or is not holding the key anymore
        if (xSpeed <= 0 || keyLeft == false || ground == false)
        {
            action = actionNormal;
        }
    }

    // -- Stop if the speed is 0
    if (xSpeed == 0)
    {
        action = actionNormal;
    }

    // -- Create dust effect
    if (alarm[0] == -1)
    {
        alarm[0] = 3;
    }
