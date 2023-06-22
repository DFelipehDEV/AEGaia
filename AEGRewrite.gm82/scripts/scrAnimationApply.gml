/// scrAnimationApply(Animation)

    // -- Check if the animation is not playing
    if (animationIndex != argument0)
    {
        // -- Keep the last animation in track
        animationIndexPrevious = animationIndex;

        animationIndex = argument0;
        // -- Update animation
        scrAnimationUpdate();
        if (animationFrameReset)
        {
            animationFrame = animationFrameStart;
        }
        // -- Set animation
        animationFinished = false;
        animationTime = 0;
    }
