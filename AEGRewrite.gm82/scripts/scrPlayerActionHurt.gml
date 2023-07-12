/// scrPlayerActionHurt()

    // -- Check if the player has landed
    if (ground == true)
    {
        // -- Back to the normal action
        xSpeed = 0;
        invincibility      = InvincibilityBlink;
        invincibilityTimer = 170;
        action             = ActionNormal;
    }
