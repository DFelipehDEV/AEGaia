/// scrPlayerHandleDash()
 // -- Handle dash pads, rings and ramps collision

    // -- Dash pads
    var dashPad, dashRing, dashRamp, dashRail;
    if (collision_check_fast(parDashPad))
    {
        dashPad  = instance_nearest(x, y, parDashPad);
        if (dashPad.dashAllow == true)
        {
            if (terrainPushing && ground == false)
            {
                ground = true;
                scrPlayerAngleSet(dashPad.image_angle);
                ySpeed = 0;
            }
            if (dashPad.dashStrength != 0)
            {
                xSpeed = dashPad.dashStrength * dashPad.image_xscale;
            }
            // -- Prevent spam
            with (dashPad)
            {
                dashAllow = false;
                dashAllowTimer = 15;
            }
            // -- Create dust
            scrDummyEffectCreate(x, y, sprVFXDustDash, 0.25, 0, -0.1, bm_normal, 1, animationDirection, 1, animationAngle);
            // -- Play sound
            scrPlaySound("sndDashPad", global.volumeSounds, 1, false);
        }
    }

    // -- Dash ring
    // -- Check if the player is meeting the dash ring
    if (collision_check_fast(parDashRing))
    {
        dashRing = instance_nearest(x, y, parDashRing);
        if (dashRing.dashAllow == true)
        {
            ground = false
            x = dashRing.x;
            y = dashRing.y;
            xSpeed = dashRing.dashStrength * dcos(dashRing.image_angle+90);
            ySpeed = -dashRing.dashStrength * dsin(dashRing.image_angle+90);

            allowKeyTimer = 20;
            if (abs(xSpeed) >= 1)
            {
                animationDirection = sign(xSpeed);
            }

            yStuckTimer = 18;
            animationAngle     = -dashRing.image_angle;

            // -- Set slow motion
            if (dashRing.dashRingPAct == ActionTricks)
            {
                global.deltaMultiplier = 0.4;
                trickCombo     = 0;
            }

            action         = dashRing.dashRingPAct;
            scrAnimationApply("SPRING");

            // -- Prevent spam
            with (dashRing)
            {
                dashAllow = false;
                dashAllowTimer = 15;

                image_xscale = 0.5;
                image_yscale = 0.5;
            }

            // -- Play sound
            switch(dashRing.dashRingType)
            {
                case "NORMAL":
                    scrPlaySound("sndDashRing1", global.volumeSounds, 1, false);
                break;


                case "RAINBOW":
                    scrPlaySound("sndDashRing2", global.volumeSounds, 1, false);
                break;
            }
        }
    }

    // -- Dash ramps
    dashRamp = scrPlayerCollisionHitbox(x, y, parDashRamp);
    if (dashRamp != noone && ground == true)
    {
        if (dashRamp.dashAllow == true && ((x >= dashRamp.x - 45 && dashRamp.image_xscale == 1) || (x <= dashRamp.x + 45 && dashRamp.image_xscale == -1)))
        {
            if (dashRamp.dashXStrength != 0)
            {
                xSpeed = dashRamp.dashXStrength * dashRamp.image_xscale;
            }

            if (dashRamp.dashYStrength != 0)
            {
                ySpeed = dashRamp.dashYStrength;
                ground = false;
            }

            action         = dashRamp.dashRampPAct;
            if (dashRamp.dashRampPAct == ActionQTEKeys)
            {
                dashrnear = instance_nearest(x, y + 1, parDashRamp);
                with(instance_create(0, 0, objControllerQTEKeys))
                {
                    qteFailedXSpeed = other.dashrnear.dashRampQTEFailedXSpeed
                    qteFailedYSpeed = other.dashrnear.dashRampQTEFailedYSpeed
                }
            }
            scrPlayerAngleSet(0);
            scrAnimationApply("LAUNCH");
            animationDirection = dashRamp.image_xscale;

            allowKeyTimer = 40;

            // -- Prevent spam
            with (dashRamp)
            {
                dashAllow = false;
                dashAllowTimer = 15;
            }

            // -- Play sound
            scrPlaySound("sndDashRamp", global.volumeSounds, 1, false);
        }
    }

    // -- Dash rail
    dashRail = scrPlayerCollisionHitbox(x, y, parDashRail);
    if (dashRail != noone && ground == true && action == ActionGrind)
    {
        if (dashRail.dashAllow == true)
        {
            if (dashRail.dashStrength != 0)
            {
                scrCameraLag(10)
                xSpeed = dashRail.dashStrength * dashRail.image_xscale;
            }

            // -- Prevent spam
            with (dashRail)
            {
                dashAllow = false;
                dashAllowTimer = 15;
            }

            // -- Create dust
            scrDummyEffectCreate(x, y, sprVFXDustDash, 0.25, 0, -0.1, bm_normal, 1, animationDirection, 1, animationAngle);


            // -- Play sound
            scrPlaySound("sndDashPad", global.volumeSounds, 1, false);
        }
    }
