/// scrPlayerActionCrouch()

    // -- Reset
    if (keyDown == false || keyUp == true)
    {
        animationFrame = max(animationFrame - 0.25, animationFrameStart);
        animationFrameSpeed = 0;
        if (animationFrame <= 0.25)
        {
            action = actionNormal;
        }
    }
    else
    {
        // -- Spindash!
        if (keyActionPressed == true)
        {
            action           =  actionSpindash;

            // -- Reset strength
            spindashStrength =  0;

            // -- Create charge effect
            with (instance_create(x, y, objVFXSpindashCharge))
            {
                image_xscale = 0.47;
                image_yscale = 0.47;
            }

            sound_stop("sndPlayerSpindashRelease");
            scrPlaySound("sndPlayerSpindashCharge", global.volumeSounds, 1, false);
        }
    }
