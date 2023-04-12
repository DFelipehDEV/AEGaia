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
            instance_create(x, y, objVFXSpindashCharge);

            // -- Camera lag
            scrCameraLag(10);

            sound_stop("sndPlayerSpindashRelease");
            scrPlaySound("sndPlayerSpindashCharge", global.volumeSounds, 1, false);
        }
    }
