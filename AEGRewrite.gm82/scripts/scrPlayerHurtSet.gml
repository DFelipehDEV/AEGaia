/// scrPlayerHurtSet()
 // -- Set hurt action

    // -- Check if the player is not invincible
    if (invincibilityTimer == 0 && invincibility != invincibilityHurt)
    {
        // -- Set player to its opposite direction
        if (sign(xSpeed) != 0)
        {
            xSpeed = -2.7*sign(xSpeed);
            animationDirection = -sign(xSpeed);
        }
        else
        {
            xSpeed = -2.7 * animationDirection;
        }
        invincibility = invincibilityHurt;

        ySpeed = -4;
        ground = false;

        // -- Check if the player has a shield
        if (shield)
        {
            shield = 0;
            action = actionHurt;
            scrAnimationApply("HURT_FALL");
            scrPlaySound(voiceline[5], global.volumeVoice, 1, false);
        }
        else // -- Player has no shield
        {
            // -- Check if the player has rings
            if (global.playerRings != 0)
            {
                // -- Steal rings from the player
                scrRingsDrop(true, min(20, global.playerRings));

                // -- Check if the player has more than 50 rings
                if (global.playerRings < 50)
                {
                    global.playerRings = 0;
                }
                else // -- Only loose 60% of the rings instead of all of them
                {
                    global.playerRings = floor(global.playerRings*0.4);
                }

                action             = actionHurt;
                scrAnimationApply("HURT_FALL");
                scrPlaySound(voiceline[5], global.volumeVoice, 1, false);
            }
            else // -- Kill player
            {
                ground = false;
                scrAnimationApply("DEAD");
                scrAnimationUpdate()
                action = actionDead;
                global.playerRings = 0;

                objControllerMusic.fadeOut = true;
                scrPlaySound(voiceline[4], global.volumeVoice, 1, false);

                with (instance_create(x, y, objPlayerDead))
                {
                    sprite_index = other.animationSprite;
                    image_speed = other.animationFrameSpeed;
                    animationFrameLoop = other.animationFrameLoop;
                }

                x = 0;
                y = 0;
            }
        }
        scrPlayerAngleSet(0);
    }
