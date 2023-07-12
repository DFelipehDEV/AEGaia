/// scrPlayerActionDead()

    xSpeed = 0;
    ySpeed = 0;
    global.playerRings = 0;
    visible = false;
    invincibilityTimer = 300;
    invincibility = InvincibilityHurt;

    // -- Decrease restart time
    if (deadTimer > 0)
    {
        deadTimer -= 1;
    }
    else
    {
        room_restart();
    }
