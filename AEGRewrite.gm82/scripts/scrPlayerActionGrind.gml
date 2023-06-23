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

    if (grindsnd == 0)
    {
        if (!sound_isplaying("sndPlayerGrindContinue"))
        {
            grindsnd = scrPlaySound("sndPlayerGrindContinue", global.volumeSounds, max(0.6, abs(xSpeed)/8), false);
        }
    }
    else
    {
        sound_pitch(grindsnd, max(0.6, abs(xSpeed)/8));
        if (!sound_isplaying("sndPlayerGrindContinue"))
        {
            grindsnd = scrPlaySound("sndPlayerGrindContinue", global.volumeSounds, max(0.6, abs(xSpeed)/8), false);
        }
    }
    // -- Stop grinding if the player is not colliding with a rail
    if (!scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRail) && !scrPlayerCollisionObjectMain(x, y, parRail)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer0) && !scrPlayerCollisionObjectMain(x, y, parRailLayer0)
    && !scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parRailLayer1) && !scrPlayerCollisionObjectMain(x, y, parRailLayer1))
    {
        action = actionNormal;
    }
