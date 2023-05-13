/// scrAnimationSystem()
 //Animation system

    //Increase timer since the animation started
    animationTime += 1;


    //Check if the animation has not ended
    if (animationFinished == false)
    {
        //Change the frame depending on the animation speed
        animationFrame += animationFrameSpeed * global.deltaMultiplier;

        if (floor(animationFrame) > animationFrameEnd)
        {
            //Repeat animation
            if(animationFrameRepeat == true && (animationFrameRepeatTimes > 0 || animationFrameRepeatTimes == -1))
            {
                animationFrame             = animationFrameLoop;
                if (animationFrameRepeatTimes > 0)
                {
                    animationFrameRepeatTimes -= 1;
                }
            }
            else
            //Stop animation
            {
                if (animationLinkedTo == "")
                {
                    animationFrame = animationFrameEnd;
                    animationFinished   =   true;
                }
                else
                //When the animation ends, if the animation is linked to other animation, set that animation
                {
                    animationFrame = animationFrameEnd;

                    animationIndexPrevious = animationIndex;
                    animationIndex = animationLinkedTo;
                    scrAnimationUpdate();
                    animationTime       = 0;
                    animationFinished   =   false;
                    // -- Reset frame
                    if (animationFrameReset == true)
                    {
                        animationFrame = animationFrameStart;
                    }
                }
            }
        }
    }
