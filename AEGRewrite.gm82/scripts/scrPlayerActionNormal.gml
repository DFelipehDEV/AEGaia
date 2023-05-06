/// scrPlayerActionNormal()

    // -- Animation speed while moving on normal action
    if ((ground == true && (animationIndex == "WALK_1" || animationIndex == "WALK_2" || animationIndex == "JOG_1"
    || animationIndex == "JOG_2" || animationIndex == "RUN")))
    {
        animationFrameSpeed = min(0.13 + abs(xSpeed)/25, 0.63);
    }
    // -- Turn!
    if (abs(xSpeed) < 1 && ground == true)
    {
        if ((animationDirection == -1 && keyRight == true) || (animationDirection == 1 && keyLeft == true))
        {
            keyRight = false;
            keyLeft = false;
            xSpeed = 0;
            action = actionTurn;
            animationIndex = "TURN";
        }
    }

    // -- Look up!
    if (xSpeed == 0 && ground == true && keyUp == true && keyDown == false)
    {
        scrCameraLag(20)
        action     = actionLookUp;
        scrAnimationApply("LOOK_UP");
    }

    // -- Crouch!
    if (xSpeed == 0 && ground == true && keyDown == true && keyUp == false)
    {
        scrCameraLag(20)
        action     = actionCrouch;
        scrAnimationApply("CROUCH");
    }

    // -- Skid!
    if (ground == true && ((xSpeed >= skidSpeed && keyLeft == true) || (xSpeed <= -skidSpeed && keyRight == true)))
    {
        action = actionSkid;
        scrPlaySound(terrainSound[terSkid], global.volumeSounds, 1, false);
        scrAnimationApply("SKID");
    }

    // -- Slide!
    if (ground == true && abs(xSpeed) > 1 && keyDown == true)
    {
        scrPlaySound(choose(voiceline[3], voiceline[2]), global.volumeSounds, 1, false);
        slideResetTimer = 35;
        action          = actionSlide;
        trailTimer = 30;

        scrAnimationApply("SLIDE");

        scrPlaySound("sndPlayerSlide", global.volumeSounds, 1, false);
    }

    // -- Airdash
    scrPlayerAirdash();
