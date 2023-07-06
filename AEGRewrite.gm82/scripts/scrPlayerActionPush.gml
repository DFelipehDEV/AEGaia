/// scrPlayerActionPush()

    if (!keyLeft && !keyRight || (keyRight && !scrPlayerCollisionRight(x, y, angle, maskBig) || keyLeft && !scrPlayerCollisionLeft(x, y, angle, maskBig)))
    {
        action = actionNormal;
    }
