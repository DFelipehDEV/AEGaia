/// scrPlayerActionSpring()

    // -- Animations
    if (animationIndex != "SPRING_TRICK_HORIZONTAL" && animationIndex != "SPRING_TRICK_VERTICAL" && animationIndex != "FLING" && animationIndex != "LANDING" && animationIndex != "FALL")
    {
        // -- Spring animation
        if (ySpeed < 0.2)
        {
            scrAnimationApply("SPRING");
        }

        // -- Fall animation
        if (ySpeed >= 0.2)
        {
            scrAnimationApply("LANDING");
        }
    }

    if (animationIndex == "SPRING")
    {
        animationAngle = point_direction(xprevious, yprevious, x, y)-90;
    }

    // -- Spring tricks!
    if (keySpecial1Pressed == true && (animationIndex == "SPRING" || animationIndex == "LANDING"))
    {
        // -- Horizontal trick
        if (keyUp == false && (keyLeft == true || keyRight == true))
        {
            if (keyLeft == true && keyRight == false)
            {
                xSpeed = -6;
            }

            if (keyRight == true && keyLeft == false)
            {
                xSpeed = 6;
            }
            ySpeed = -2;

            animationIndex = "SPRING_TRICK_HORIZONTAL";
            scrPlaySound("sndPlayerSpringTrick", global.volumeSounds, 1, false);
        }


        // -- Vertical trick
        if (keyLeft == false && keyRight == false && keyUp == true)
        {
            xSpeed = 0;
            ySpeed = -7;

            animationIndex = "SPRING_TRICK_VERTICAL";

            scrPlaySound("sndPlayerSpringTrick", global.volumeSounds, 1, false);
        }
    }
