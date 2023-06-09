/// scrPlayerActionNormal()

    // -- Check if we are in the ground
    if (ground == true)
    {
        // -- Animation speed while moving on normal action
        if (((animationIndex == "WALK_1" || animationIndex == "WALK_2" || animationIndex == "JOG_1"
        || animationIndex == "JOG_2" || animationIndex == "RUN")))
        {
            animationFrameSpeed = min(0.13 + abs(xSpeed)/25, 0.63);
        }

        // -- Turn!
        if (abs(xSpeed) < 1)
        {
            if ((animationDirection == -1 && keyRight == true) || (animationDirection == 1 && keyLeft == true))
            {
                keyRight = false;
                keyLeft = false;
                xSpeed = 0;
                action = ActionTurn;
                scrAnimationApply("TURN");
            }
        }

        // -- Check if we are standing still
        if (xSpeed == 0)
        {
            // -- Look up!
            if (keyUp == true && keyDown == false)
            {
                scrCameraLag(20)
                action = ActionLookUp;
                scrAnimationApply("LOOK_UP");
            }

            // -- Crouch!
            if (keyDown == true && keyUp == false)
            {
                scrCameraLag(20)
                action = ActionCrouch;
                scrAnimationApply("CROUCH");
            }
        }

        // -- Skid!
        if ((xSpeed >= skidSpeed && keyLeft == true) || (xSpeed <= -skidSpeed && keyRight == true))
        {
            scrPlayerTerrainSndUpdate();
            action = ActionSkid;
            scrPlaySound(terrainSound[TerSkid], global.volumeSounds, 1, false);
            scrAnimationApply("SKID");
        }

        // -- Slide!
        if (abs(xSpeed) > 1 && keyDown == true)
        {
            scrPlaySound(choose(voiceline[3], voiceline[2]), global.volumeVoice, 1, false);
            slideResetTimer = 35;
            action = ActionSlide;
            trailTimer = 30;

            scrAnimationApply("SLIDE");

            scrPlaySound("sndPlayerSlide", global.volumeSounds, 1, false);
        }
    }

    // -- Airdash
    scrPlayerAirdash();
