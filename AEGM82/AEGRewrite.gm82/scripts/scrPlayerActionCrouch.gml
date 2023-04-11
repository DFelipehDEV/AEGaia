/// scrPlayerActionCrouch()

    yLookTimer += 1;

    // -- Reset
    if (keyDown == false || keyUp == true)
    {
        action         = actionCrouchReset;
        scrAnimationApply("CROUCH_RESET");
    }

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
