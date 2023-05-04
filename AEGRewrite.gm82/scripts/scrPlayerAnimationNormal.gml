/// scrPlayerAnimationNormal()

    if (ground == true)
    {
        // -- Idle animation
        if (xSpeed == 0 && animationIndex != "IDLE_WAIT")
        {
            // -- Check if its not been waiting for a long time
            if (animationTime < 300)
            {
                // -- Idle animation
                scrAnimationApply("IDLE");
            }
            else
            {
                // -- Idle waiting animation
                scrAnimationApply("IDLE_WAIT");
            }
        }

        // -- Walk animation
        if abs(xSpeed) > 0 && abs(xSpeed) < 2.4
        {
            scrAnimationApply("WALK_1");
        }

        // -- Walk 2 animation
        if (abs(xSpeed) >= 2.4 && abs(xSpeed) < 4)
        {
            scrAnimationApply("WALK_2");
        }

        // -- Jog animation
        if (abs(xSpeed) >= 4 && abs(xSpeed) < 6.1)
        {
            scrAnimationApply("JOG_1");
        }

        // -- Jog 2 animation
        if (abs(xSpeed) >= 6.1 && abs(xSpeed) < 10)
        {
            scrAnimationApply("JOG_2");
        }

        // -- Run animation
        if (abs(xSpeed) >= 10)
        {
            scrAnimationApply("RUN");
        }
    }
    else
    {
        if (animationIndex != "HOMED_1" && animationIndex != "HOMED_2" && animationIndex != "SPRING_TRICK_VERTICAL" && animationIndex != "FALL" && animationIndex != "LAUNCH" && animationIndex != "FLING")
        {
            // -- Fall animation
            if (abs(ySpeed) >= 0.2)
            {
                scrAnimationApply("LANDING");
            }
        }
    }
