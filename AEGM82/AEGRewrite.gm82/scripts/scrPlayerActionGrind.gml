/// scrPlayerActionGrind()

    animationFrameSpeed = 0.2 + abs(xSpeed)/18;
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

    // -- Play sounds
    if (sound_isplaying("sndPlayerGrindContinue") == false)
    {
        scrPlaySound("sndPlayerGrindContinue", global.volumeSounds, max(0.6, abs(xSpeed)/8), true);
    }

    //audio_sound_pitch(sndPlayerGrindContinue, max(0.6, abs(xSpeed)/8))

    // -- Stop grinding if the player is not colliding with a rail
    if (!scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRail) && !scrPlayerCollisionObjectMain(x, y, parRail)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer0) && !scrPlayerCollisionObjectMain(x, y, parRailLayer0)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer1) && !scrPlayerCollisionObjectMain(x, y, parRailLayer1))
    {
        action = actionNormal;
    }
