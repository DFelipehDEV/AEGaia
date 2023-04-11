/// scrPlayerActionJump()

    // -- Air dash
    if (keyActionPressed == true && ground == false && airdash == true && homingPossible == false)
    {
        airdash = false;
        airdashTimer = airdashTimerCommon;
        action  = actionAirdash;
        scrAnimationApply("JUMP");

        xSpeed = 11 * animationDirection;
        ySpeed = 0;

        trailTimer = 60;

        scrPlaySound("sndPlayerHome", global.volumeSounds, 1, false);

        scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.4, 0, -0.01, bm_add, 1, animationDirection/1.5, 0.6, 0);
    }


    // -- Animations
    // -- Change direction to the left if the left key have been pressed
    if (keyLeft == true)
    {
        animationDirection = -1;
    }

    // -- Change direction to the right if the right key have been pressed
    if (keyRight == true)
    {
        animationDirection = 1;
    }

    // -- Jump animation
    if (ySpeed < 2.5)
    {
        scrAnimationApply("JUMP");
    }

    // -- Land animation
    if (ySpeed > 4.5)
    {
        scrAnimationApply("LAND");
    }

    // -- Animation speed
    if (animationIndex != "LAND")
    {
        animationFrameSpeed = (0.2 + abs(ySpeed)/7) + abs(xSpeed)/15;
    }

    // -- Variable jump
    if (ySpeed < 0 && jumpAirTimer <= 13 && keyAction == true)
    {
        ySpeed        +=  jumpStrength/(26);
        jumpAirTimer  +=  1;
    }

    // -- Air drag
    if(ySpeed < 0 && ySpeed >= -4)
    {
       xSpeed -= ((xSpeed / 0.2) / 256);
    }
