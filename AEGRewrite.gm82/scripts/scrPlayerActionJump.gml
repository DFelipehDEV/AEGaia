/// scrPlayerActionJump()

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
        scrAnimationApply("LANDING");
    }

    // -- Animation speed
    if (animationIndex != "LANDING")
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

    // -- Airdash
    scrPlayerAirdash();

    // -- Reset after touching the ground
    if (ground == true)
    {
        action = ActionNormal;
    }
