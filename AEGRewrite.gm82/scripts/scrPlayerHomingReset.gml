/// scrPlayerHomingReset(action, xSpeed, ySpeed, invincibilityTimer, x, y)

    if (action == actionHoming)
    {
        // -- Give player invincibility to avoid death after homing
        if (invincibilityTimer == 0)
        {
            invincibilityTimer = argument3;
        }

        action             = argument0;
        animationIndex     = choose("HOMED_1", "HOMED_2", "SPRING_TRICK_VERTICAL");
        allowKeyTimer      = 20;
        xSpeed             = argument1;
        ySpeed             = argument2;

        x = argument4;
        y = argument5;
    }
