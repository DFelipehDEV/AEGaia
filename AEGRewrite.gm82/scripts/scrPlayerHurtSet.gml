/// scrPlayerHurtSet()
 // -- Set hurt action

    //Exit if the player is invincible
    if (invincibilityTimer == 0 && invincibility != invincibilityHurt)
    {
        if (sign(xSpeed) != 0)
        {
            xSpeed = -2.7*sign(xSpeed);
            animationDirection = -sign(xSpeed);
        }
        //If the player is stopped, set the speed depending on the direction
        else
        {
            xSpeed = -2.7 * animationDirection;
        }
        invincibility = invincibilityHurt;

        ySpeed = -4;
        ground = false;

        //Check if the player has a shield
        if (shield)
        {
            shield = 0;
            action = actionHurt;
            scrAnimationApply("HURT_FALL");
            scrPlaySound(voiceline[5], global.volumeVoice, 1, false);
        }
        else
        {
            //Steal rings
            if (global.playerRings != 0)
            {
                scrRingsDrop(true, min(20, global.playerRings));
                global.playerRings = 0;
                action             = actionHurt;
                scrAnimationApply("HURT_FALL");
                scrPlaySound(voiceline[5], global.volumeVoice, 1, false);
            }
            //Die
            else
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
