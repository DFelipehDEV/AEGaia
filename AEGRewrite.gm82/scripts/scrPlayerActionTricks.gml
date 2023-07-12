/// scrPlayerActionTricks()

    if (animationIndex == "SPRING")
    {
        animationAngle = point_direction(xprevious, yprevious, x, y)-90;
    }

    // -- Check if the delay has ended
    if (allowKeyTimer == 0)
    {
        // -- Trigger trick
        if (keyLeft == true || keyRight == true || keyUp == true || keyDown == true)
        {
            allowKeyTimer     = 20;

            // -- Increase combo amount
            if (trickCombo < 9)
            {
                trickCombo += 1;
            }

            animationFrame = 0;
            scrAnimationApply(choose("HOMED_1", "HOMED_2", "SPRING_TRICK_HORIZONTAL", "SPRING_TRICK_VERTICAL"));

            // -- Get energy
            scrPlayerEnergyAdd(7);

            // -- Create rainbow effect
            instance_create(x, y, objVFXRainbow);

            scrPlaySound("sndTrick", global.volumeSounds, 1 + (trickCombo * 0.0441), 0);

            if (global.deltaMultiplier == 0.4)
            {
                global.deltaMultiplier = 1;
            }

        }
    }

    // -- Finish trick
    if (keySpecial3Pressed == true)
    {
        trickCombo     = 0;
        scrPlayerEnergyAdd(21);
        scrAnimationApply("SPRING_TRICK_HORIZONTAL");

        action         = ActionSpring;
        global.deltaMultiplier = 1;
        scrPlaySound("sndTrick", global.volumeSounds, 1, 0);
    }


    if (ground == true)
    {
        global.deltaMultiplier = 1;
        action        = ActionNormal;
        allowKeyTimer = 0;
    }
