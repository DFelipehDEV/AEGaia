/// scrPlayerActionSpindash()

    // -- Animations
    // -- Normal animation
    if (spindashStrength <= 0.9)
    {
        scrAnimationApply("SPINDASH");
    }
    // -- Charging animation
    else
    {
        scrAnimationApply("SPINDASH_CHARGE");
    }

    // -- Charge spindash
    if (keyActionPressed == true)
    {
        // -- Increase strength
        if (spindashStrength < spindashStrengthMax)
        {
            spindashStrength    += 2;
        }
        else
        {
            spindashStrength    =   spindashStrengthMax;
        }

        // -- Create charge effect
        with (instance_create(x, y, objVFXSpindashCharge))
        {
            image_xscale = 0.0006;
            image_yscale = 0.0006;
            scalespeed = max(0.2, 0.2 + objPlayer.spindashStrength/50);
        }
        sound_stop("sndPlayerSpindashCharge");
        scrPlaySound("sndPlayerSpindashCharge", global.volumeSounds, 1 + (spindashStrength * 0.043), false);
    }

    // -- Decrease strength while doing nothing
    if (spindashStrength > 0)
    {
        spindashStrength -= 0.15;
    }

    // -- Release spindash and start rolling
    if (keyDown == false)
    {
        // -- Create release trail if is charging the spindash
        if (animationIndex == "SPINDASH_CHARGE")
        {
            scrDummyEffectCreate(floor(x), floor(y), sprVFXSpindashHighRelease, 0.35, 0, 0.1, bm_normal, image_alpha, animationDirection, 1, animationAngle);
        }
        xSpeed           =   (8.2 + spindashStrength) * animationDirection;
        action           =   actionRoll;
        trailTimer = 120;
        scrAnimationApply("ROLL");

        sound_stop("sndPlayerSpindashCharge");
        scrPlaySound("sndPlayerSpindashRelease", global.volumeSounds, 1, false);
    }
