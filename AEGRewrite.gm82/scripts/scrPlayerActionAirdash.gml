/// scrPlayerActionAirdash()

    animationFrameSpeed = 0.55 + abs(xSpeed)/17;
    airdashTimer -= 1;

    if (ground == true || scrPlayerCollisionLeft(x, y, 0, maskBig) || scrPlayerCollisionRight(x, y, 0, maskBig) || airdashTimer == 0 || keyAction == false)
    {
        xSpeed = 5 * animationDirection;
        airdashTimer = airdashTimerCommon;
        action       = actionJump;
    }
