/// scrPlayerAnimationNormal()

    if (ground == true)
    {
        // -- Idle animation
        if (xSpeed == 0)
        {
            switch (edgeCollision)
            {
                case false:
                    // -- Check if we are in the edge of a solid
                    if (scrPlayerCollisionLeftEdge(x, y, angle) && !scrPlayerCollisionRightEdge(x, y, angle))
                    {
                        if (animationIndex != "LEDGE_1" && animationIndex != "LEDGE_2")
                        {
                            scrPlaySound(choose(voiceline[11], voiceline[12], "sndNoone"), global.volumeVoice, 1, false);
                        }
                        switch (animationDirection)
                        {
                            case 1:
                                scrAnimationApply("LEDGE_1");
                            break;

                            case -1:
                                scrAnimationApply("LEDGE_2");
                            break;
                        }
                    }
                    else if (!scrPlayerCollisionLeftEdge(x, y, angle) && scrPlayerCollisionRightEdge(x, y, angle))
                    {
                        if (animationIndex != "LEDGE_1" && animationIndex != "LEDGE_2")
                        {
                            scrPlaySound(choose(voiceline[11], voiceline[12]), global.volumeVoice, 1, false);
                        }
                        switch (animationDirection)
                        {
                            case 1:
                                scrAnimationApply("LEDGE_2");
                            break;

                            case -1:
                                scrAnimationApply("LEDGE_1");
                            break;
                        }
                    }
                break;

                case true:
                    if (animationIndex != "IDLE_WAIT")
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
                break;
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
