/// scrPlayerActionPush()

    if (!keyLeft && scrPlayerCollisionLeft(x, y, angle, maskBig) || !keyRight && scrPlayerCollisionRight(x, y, angle, maskBig) || !keyLeft && !keyRight)
    {
        action = actionNormal;
    }
