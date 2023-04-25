/// scrAnimationIndexSonic()
 // -- Sonic animations

    switch(animationIndex)
    {
        // -- Wallgrab animation
        case "WALLGRAB":
            scrAnimationSet(sprSonicWallJump, 0, -1, -1, 0, 1, 1, -1, "");
        break;

        // -- Idle animation
        case "IDLE":
            scrAnimationSet(sprSonicIdle, 0, -1, -1, 0.17, 1, 1, -1, "");
        break;

        // -- Idle wait animation
        case "IDLE_WAIT":
            scrAnimationSet(sprSonicIdleWait, 0, -1, 3, 0.2, 1, 1, -1, "");
        break;

        // -- Look up animation
        case "LOOK_UP":
            scrAnimationSet(sprSonicLookUp, 0, -1, 2, 0.145, 1, 1, -1, "");
        break;

        // -- Crouch animation
        case "CROUCH":
            scrAnimationSet(sprSonicCrouch, 0, -1, -1, 0.4, 1, 0, -1, "");
        break;

        // -- Turn animation
        case "TURN":
            scrAnimationSet(sprSonicTurn, 0, -1, 1, 0.25, 1, 0, 0, "");
        break;

        // -- Spindash animation
        case "SPINDASH":
            scrAnimationSet(sprSonicSpindash, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

        // -- Spindash charge animation
        case "SPINDASH_CHARGE":
            scrAnimationSet(sprSonicSpindashCharge, 0, -1, -1, 0.4, 1, 1, -1, "");
        break;

        // -- Walk animation
        case "WALK_1":
            scrAnimationSet(sprSonicWalk1, 0, -1, -1, 0, 0, 1, -1, "");
        break;

        // -- Walk 2 animation
        case "WALK_2":
            scrAnimationSet(sprSonicWalk2, 0, -1, -1, 0, 0, 1, -1, "");
        break;

        // -- Jog animation
        case "JOG_1":
            scrAnimationSet(sprSonicJog1, 0, -1, -1, 0, 0, 1, -1, "");
        break;

        // -- Jog 2 animation
        case "JOG_2":
            scrAnimationSet(sprSonicJog2, 0, -1, -1, 0, 0, 1, -1, "");
        break;

        // -- Run animation
        case "RUN":
            scrAnimationSet(sprSonicRun, 0, -1, -1, 0, 0, 1, -1, "");
        break;

        // -- Jump animation
        case "JUMP":
            scrAnimationSet(sprSonicJump, 0, -1, -1, 0, 1, 1, -1, "");
        break;

        // -- Roll animation
        case "ROLL":
            scrAnimationSet(sprSonicRoll, 0, -1, -1, 0, 1, 1, -1, "");
        break;

        // -- Skid animation
        case "SKID":
            scrAnimationSet(sprSonicSkid, 0, -1, 3, 0.35, 1, 1, -1, "");
        break;

        // -- Slide animation
        case "SLIDE":
            scrAnimationSet(sprSonicSlide, 0, -1, 1, 0.3, 1, 1, -1, "");
        break;

        // -- Grind animation
        case "GRIND":
            scrAnimationSet(sprSonicGrind, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

        // -- Stomp animation
        case "STOMP":
            scrAnimationSet(sprSonicStomp, 0, -1, 0, 0.3, 1, 1, -1, "");
        break;

        // -- Stomp land animation
        case "STOMP_LAND":
            scrAnimationSet(sprSonicStompLand, 0, -1, -1, 0.2, 1, 0, -1, "");
        break;

        // -- Spring animation
        case "SPRING":
            scrAnimationSet(sprSonicSpring, 0, -1, 1, 0.2, 1, 1, -1, "");
        break;

        // -- Landing animation
        case "LANDING":
            scrAnimationSet(sprSonicLanding, 0, -1, 1, 0.28, 1, 1, -1, "");
        break;

        // -- Fall animation
        case "FALL":
            scrAnimationSet(sprSonicFall, 0, -1, 2, 0.3, 1, 1, -1, "");
        break;

        // -- Homed 1 animation
        case "HOMED_1":
            scrAnimationSet(sprSonicHomed1, 0, -1, -1, 0.5, 1, 0, 0, "FALL");
        break;

        // -- Homed 2 animation
        case "HOMED_2":
            scrAnimationSet(sprSonicHomed2, 0, -1, -1, 0.45, 1, 0, 0, "FALL");
        break;

        // -- Hang 1 animation
        case "HANG_1":
            scrAnimationSet(sprSonicGrab1, 0, -1, -1, 0.3, 1, 1, -1, "");
        break;

        // -- Hang 2 animation
        case "HANG_2":
            scrAnimationSet(sprSonicGrab2, 0, -1, -1, 0.2, 1, 1, -1, "");
        break;

        // -- Spring trick horizontal animation
        case "SPRING_TRICK_HORIZONTAL":
            scrAnimationSet(sprSonicTrickHor, 0, -1, 3, 0.77, 1, 1, 4, "FALL");
        break;

        // -- Spring trick vertical animation
        case "SPRING_TRICK_VERTICAL":
            scrAnimationSet(sprSonicTrickVer, 0, -1, 9, 0.35, 1, 1, -1, "");
        break;

        // -- Launch animation
        case "LAUNCH":
            scrAnimationSet(sprSonicLaunch, -1, -1, 1, 0.49, 1, 1, -1, "");
        break;

        // -- Corkscrew animation
        case "CORKSCREW":
            scrAnimationSet(sprSonicCorkscrew, 0, -1, 0, 0.37, 1, 1, -1, "");
        break;

        // -- Fling ramp animation
        case "FLING":
            scrAnimationSet(sprSonicCorkscrew, 0, -1, -1, 0.37, 1, 0, 0, "LAND");
        break;

        // -- Hurt falling animation
        case "HURT_FALL":
            scrAnimationSet(sprSonicHurtFall, 0, -1, -1, 0.2, 1, 0, -1, "");
        break;

        // -- Hurt land animation
        case "HURT_LAND":
            scrAnimationSet(sprSonicHurtLand, 0, -1, -1, 0.26, 1, 0, -1, "");
        break;

        // -- Dead animation
        case "DEAD":
            scrAnimationSet(sprSonicDie, 0, -1, 3, 0.26, 1, 1, -1, "");
        break;
    }
