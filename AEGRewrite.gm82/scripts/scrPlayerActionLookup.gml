/// scrPlayerActionLookup()

    // -- Reset
    if (keyUp == false || keyDown == true)
    {
        // -- Skip frames to reset faster
        if (keyUpReleased == true)
        {
            animationFrame = 2;
        }
        animationFrame = max(animationFrame - 0.3, animationFrameStart);

        if (floor(animationFrame) == 0)
        {
            action = ActionNormal;
        }
    }
