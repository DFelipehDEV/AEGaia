/// scrPlayerActionTrigger()
 // -- Start actions

    // -- Homing attack!
    if ((action == actionJump || action == actionSpring || action == actionNormal) && distance_to_object(parHome) <= homingDistance
    && ground == false)
    {
        var homeNear;
        homeNear = instance_nearest(x, y, parHome);
        if ((sign(homeNear.x - x) == animationDirection || sign(homeNear.x - x) == 0) && y < homeNear.y + 9)
        {
            homingPossible = true;
            if (keyActionPressed == true && instance_exists(objPlayerTarget))
            {
                scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.4, 0, -0.01, bm_normal, 1, 0.5, 0.6, point_direction(x, y, homeNear.x, homeNear.y));
                scrPlaySound(choose("sndNoone", voiceline[0]), global.volumeVoice, 1, false);
                homingTimer = 0;
                action = actionHoming;
                scrPlayerAirdashReset();
                scrAnimationApply("JUMP");
                trailTimer = 80;
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
        ySpeed  =   angleCos*(jumpStrength/2) - angleSin * xSpeed/1.8;
        xSpeed  =   angleCos*xSpeed + angleSin*jumpStrength;

        scrPlayerAngleSet(0);
        scrPlayerAirdashReset();
        action          =   actionJump;
        scrAnimationApply("JUMP");

        ground          =   false;
        jumpAirTimer    =   0;

        scrPlaySound("sndPlayerJump", global.volumeSounds, 1, false);
        scrPlaySound("sndPlayerSpin", global.volumeSounds, 1, false);
    }

    // -- Stomp!
    if (keyDown == true && ground == false && (action == actionJump|| action == actionBoostAir || action == actionNormal || action == actionSpring && ySpeed > -2))
    {
        scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.6, 0, -0.01, bm_normal, 1, 0.6, 0.6, 270);
        action = actionStomp;
        scrAnimationApply("STOMP");
        ySpeed = 13;

        trailTimer = 80;
        scrPlaySound("sndPlayerStompStart", global.volumeSounds, 1, false);
        sound_stop("sndPlayerStompLand");
        sensorBottomDistance = 15;
        animationAngle = 0;
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
            if (action != actionCorkscrew)
            {
                boostAir -= 1;
            }
        }
    }

    // -- Check if the player is not colliding with a wall
    if (!terrainPushing)
    {
        if (action == actionNormal || action == actionCorkscrew || action == actionGrind || action == actionJump)
        {
            // -- Check if the player has enough energy to boost
            if (energyAmount > 0)
            {
                // -- Trigger boost dash
                if (keySpecial1Pressed == true && boost == false)
                {
                    // -- Play sound effects
                    scrPlaySound(choose("sndNoone", voiceline[0], voiceline[1]), global.volumeVoice, 1, false);
                    scrPlaySound("sndPlayerBoostStart", global.volumeSounds, 1, false)

                    // -- Boost wave VFX
                    scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.4, 0, -0.01, bm_normal, 1, animationDirection, 1, animationAngle);

                    // -- Decrease energy gauge
                    scrPlayerEnergyAdd(-1.5);

                    // -- Speed up the player
                    if abs(xSpeed) < boostSpeed
                    {
                        xSpeed = boostSpeed * animationDirection;
                    }

                    // -- Lag and shake the camera
                    scrCameraLag(20);
                    scrCameraShakeY(20);

                    // -- Create shockwave effect
                    instance_create(x, y, objVFXBoostShockwave);

                    // -- Check if the player is in the air
                    if (ground == false && (action == actionNormal || action == actionJump))
                    {
                        // -- Air boost dash
                        boost = true;
                        action = actionBoostAir;
                        boostAir = 40;
                        boostPossible = true;

                        if (instance_exists(objVFXBoost) == false)
                        {
                            // -- Create boost aura
                            with (instance_create(x, y, objVFXBoost))
                            {
                                image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                                playerID    = other.id;
                                image_alpha = 0.7;
                            }
                        }
                        // -- Update player's physics to the boost physics
                        scrPlayerPhysicsSonic();
                        
                        scrAnimationApply("LAUNCH");
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
                        with (instance_create(x, y, objVFXBoost))
                        {
                            image_angle = point_direction(other.xprevious, other.yprevious, x, y);
                            playerID    = other.id;
                        }
                    }
                    // -- Decrease energy gauge    
                    scrPlayerEnergyAdd(-0.35);
                    
                    // -- Update player's physics to the boost physics
                    scrPlayerPhysicsSonic();
                }
            }
            else
            // -- Alert the player that he can't boost
            {
                if (keySpecial1Pressed == true && boost == false)
                {
                    // -- Create charge effect
                    with (instance_create(x, y, objVFXSpindashCharge))
                    {
                        image_xscale = 0.0006;
                        image_yscale = 0.0006;
                        scalespeed = 0.2;
                    }
                    // -- Shake the energy gauge
                    objControllerStage.hudShakeTimer = 30;
                    scrPlaySound(voiceline[2], global.volumeVoice, 1, false);
                }
            }
        }
    }

    // -- Lightspeed dash
    if (keySpecial3Pressed == true && distance_to_object(objRing) <= 40)
    {
        ySpeed              = -1;
        ground              = false;
        action              = actionLightspeed;
        scrAnimationApply("SPRING");
    }
