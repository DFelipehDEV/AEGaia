/// scrPlayerActionGrind()

    animationFrameSpeed = min(0.18 + abs(xSpeed)/20, 0.4);
    // -- Acceleration
    // -- Accelerate to the left
    if (keyLeft == true && keyRight == false)
    {
        if xSpeed > -xSpeedTop
        {
            xSpeed -= xAccTemp;
        }
    }
    // -- Accelerate to the right
    else
    if (keyRight == true && keyLeft == false)
    {
        if xSpeed < xSpeedTop
        {
            xSpeed += xAccTemp;
        }
    }

    var pitch;
    pitch = min(max(0.6, abs(xSpeed)/8), 1.2);
    if (grindsnd == 0)
    {
        if (!sound_isplaying("sndPlayerGrindContinue"))
        {
            grindsnd = scrPlaySound("sndPlayerGrindContinue", global.volumeSounds, pitch, false);
        }
    }
    else
    {
        sound_pitch(grindsnd, pitch);
        if (!sound_isplaying("sndPlayerGrindContinue"))
        {
            grindsnd = scrPlaySound("sndPlayerGrindContinue", global.volumeSounds, pitch, false);
        }
    }

    if (keyDown && abs(xSpeed) > 0.1)
    {
        scrAnimationApply("GRIND_2");
        xSpeed -= 0.06 * animationDirection;
        // -- Physics
        if (sign(xSpeed) == sign(angleSin))
        {
            xSpeed -= rollDecSlopeUp * angleSin;
        }

        if (sign(xSpeed) != sign(angleSin))
        {
            xSpeed -= rollDecSlopeDown * angleSin;
        }
    }

    if (keyDownReleased)
    {
        scrAnimationApply("GRIND_1");
    }

    // -- Stop grinding if the player is not colliding with a rail
    if (!scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRail) && !scrPlayerCollisionObjectMain(x, y, parRail)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer0) && !scrPlayerCollisionObjectMain(x, y, parRailLayer0)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer1) && !scrPlayerCollisionObjectMain(x, y, parRailLayer1))
    {
        action = actionNormal;
    }
