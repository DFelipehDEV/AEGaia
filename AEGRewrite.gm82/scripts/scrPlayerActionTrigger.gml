/// scrPlayerActionTrigger()
 // -- Start actions

    // -- Homing attack!
    if ((action == actionJump || action == actionSpring && abs(ySpeed) > 0.1 || action == actionNormal) && distance_to_object(parHome) <= homingDistance
    && ground == false)
    {
        if (sign(instance_nearest(x, y, parHome).x - x) == animationDirection && y < instance_nearest(x, y, parHome).y + 5)
        {
            homingPossible = true;
            if (keyActionPressed == true && instance_exists(objPlayerTarget))
            {
                scrPlaySound(choose("sndNoone", voiceline[0]), global.volumeSounds, 1, false);
                homingTimer = 0;
                action = actionHoming;
                scrAnimationApply("JUMP");
                trailTimer = 60;
                scrPlaySound("sndPlayerHome", global.volumeSounds, 1, false);
            }
        }
        else
        {
            homingPossible = false;
        }
    }
    else
    {
        homingPossible = false;
    }

    // -- Jump!
    if ((ground == true || action == actionCorkscrew) && !scrPlayerCollisionTop(x, y, angle, maskBig) && keyActionPressed == true && action != actionCrouch && action != actionSpindash && action != actionHurt)
    {
        // -- Set speed depending on the angle
        ySpeed  =   angleCos*(jumpStrength/2) - angleSin * xSpeed/2;
        xSpeed  =   angleCos*xSpeed + angleSin*jumpStrength;


        scrPlayerAngleSet(global.playerAngleGravity);
        airdash         =   true;
        action          =   actionJump;
        scrAnimationApply("JUMP");

        ground          =   false;
        jumpAirTimer    =   0;

        scrPlaySound("sndPlayerJump", global.volumeSounds, 1, false);
        scrPlaySound("sndPlayerSpin", global.volumeSounds, 1, false);
    }

    // -- Stomp!
    if (keyDownPressed == true && ground == false && (action == actionJump|| action == actionBoostAir || action == actionNormal || action == actionSpring && ySpeed > -2))
    {
        scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.6, 0, -0.01, bm_add, 1, 0.6, 0.6, 270);
        action = actionStomp;
        scrAnimationApply("STOMP");
        ySpeed = 14;

        trailTimer = 80;
        scrPlaySound("sndPlayerStompStart", global.volumeSounds, 1, false);
        sound_stop("sndPlayerStompLand");
    }

    // -- Boost!
    // -- Stop boosting
    if (keySpecial1 == false || energyAmount <= 0 || abs(xSpeed) < 2.2 || action == actionRoll || animationIndex == "FLING" || (boostAir == 0 && ground = false)) && boost == true
    {
        boost = false;
        boostPossible = false;
        scrPlayerPhysicsSonic();
    }

    if (boost == true)
    {
        if (ground = false)
        {
            boostAir -= 1;
        }
    }

    // -- Check if the player is not meeting a wall
    if (animationDirection == 1 && (!scrPlayerCollisionRight(x,y, angle, maskBig))
    || animationDirection == -1 && (!scrPlayerCollisionLeft(x, y, angle, maskBig)))
    {
        // -- Check if the player can boost
        if (energyAmount > 0 && (action == actionNormal || action == actionCorkscrew || action == actionGrind || action == actionWallrun || action == actionJump) && boundariesNear == false)
        {
            // -- Trigger boost dash
            if (keySpecial1Pressed == true && boost == false)
            {
                scrPlaySound(choose("sndNoone", voiceline[0], voiceline[1]), global.volumeSounds, 1, false);
                scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.4, 0, -0.01, bm_add, 1, animationDirection, 1, animationAngle);

                energyAmount -= 1.5;

                // -- Speed up the player
                if abs(xSpeed) < boostSpeed
                {
                    xSpeed = boostSpeed * animationDirection;
                }

                scrCameraLag(20);
                scrCameraShakeY(20);

                // -- Create shockwave
                instance_create(x, y, objVFXBoostShockwave);

                scrPlaySound("sndPlayerBoostStart", global.volumeSounds, 1, false)


                // -- Check if the player is in the air
                if (ground == false && (action == actionNormal || action == actionJump))
                {
                    // -- Air boost dash
                    boost= true;
                    action= actionBoostAir;
                    animationIndex= "LAUNCH";
                    boostAir= 40;
                    boostPossible = true;

                    var boostVFX;
                    boostVFX             = instance_create(x, y, objVFXBoost);
                    boostVFX.image_angle = point_direction(xprevious, yprevious, boostVFX.x, boostVFX.y);
                    boostVFX.playerID    = id;
                    boostVFX.image_alpha = 0.7;
                    scrPlayerPhysicsSonic();
                }
                else
                {
                    boostPossible = true;
                }
            }


            // -- Keep boosting
            if (keySpecial1 == true && boostPossible == true)
            {
                boost = true;

                trailTimer = 120;


                // -- Create boost aura
                if (instance_exists(objVFXBoost) == false)
                {
                    var boostVFX;
                    boostVFX             = instance_create(x, y, objVFXBoost);
                    boostVFX.image_angle = point_direction(xprevious, yprevious, boostVFX.x, boostVFX.y);
                    boostVFX.playerID    = id;
                }

                energyAmount -= 0.4;

                scrPlayerPhysicsSonic();
            }
        }
    }

    // -- Lightspeed dash
    if (keySpecial3Pressed == true && distance_to_object(objRing) <= 40)
    {
        ySpeed              = -1;
        ground              = false;
        action              = actionLightspeed;
        animationIndex      = "SPRING";
    }
