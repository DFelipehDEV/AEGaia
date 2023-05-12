/// scrPlayerActionStompLand()

    if abs(xSpeed) > 0
    {
        //Slide if is moving
        if abs(xSpeed) < 8
        {
            xSpeed = 8 * sign(xSpeed);
        }
        slideResetTimer = 17;
        action = actionSlide;
        scrAnimationApply("SLIDE");

        scrPlaySound("sndPlayerSlide", global.volumeSounds, 1, false);
    }

    if (animationIndex == "STOMP_LAND")
    {
        if (animationFinished == true)
        {
            action = actionNormal;
        }
    }
