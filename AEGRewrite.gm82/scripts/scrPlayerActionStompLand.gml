/// scrPlayerActionStompLand()

    if abs(xSpeed) > 0
    {
        //Slide if is moving
        if abs(xSpeed) < 8
        {
            xSpeed = 8 * sign(xSpeed);
        }
        slideResetTimer = 35;
        action = actionSlide;
        scrAnimationApply("SLIDE");

        scrPlaySound("sndPlayerSlide", global.volumeSounds, 1, false);
    }