#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    ySpeed         = -3;    //Vertical speed
    playerRewarded = 0;     //Checks if the player got the reward

    image_speed = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Disappear and give reward.

     if (ySpeed < 0)
     {
        y      += ySpeed;
        ySpeed += 0.09375;
     }

     if (ySpeed >= 0 && playerRewarded == 0)
     {
        ySpeed = 0;
        playerRewarded = 1;
        event_user(0);
     }

     // -- Fade
     if (playerRewarded == 1)
     {
        if (image_alpha <= 0)
        {
            instance_destroy();
        }

        image_alpha -= 0.05;
     }
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Give reward

    switch (icon)
    {
        // -- Hurt monitor
        case 1:
            with (objPlayer)
            {
                scrPlayerHurtSet();
            }
        break;


        // -- 5 Rings
        case 2:
            global.playerRings += 5;
            scrPlaySound("sndRingMonitor", global.volumeSounds, 1, false);
        break;


        // -- 10 Rings
        case 3:
            global.playerRings += 10;
            scrPlaySound("sndRingMonitor", global.volumeSounds, 1, false);
        break;


        // -- Random rings
        case 4:
            global.playerRings += irandom_range(1, 25);
            scrPlaySound("sndRingMonitor", global.volumeSounds, 1, false);
        break;


        // -- Energy up
        case 5:
            with (objPlayer)
            {
                energyAmount += min(80, energyAmountMax);
                scrPlaySound("sndTrick", global.volumeSounds, 1, false);
            }
        break;


        // -- Normal shield
        case 6:
            with (objPlayer)
            {
                scrPlayerShieldSet("NORMAL");
                scrPlaySound("sndShieldMonitor", global.volumeSounds, 1, false);
            }
        break;


        // -- Electro shield
        case 7:
            with (objPlayer)
            {
                scrPlayerShieldSet("ELECTRICITY");
                scrPlaySound("sndShieldMonitor", global.volumeSounds, 1.1, false);
            }
        break;

        // -- Invincibility
        case 9:
            with (objPlayer)
            {
                invincibility = invincibilityMonitor;
                invincibilityTimer = 1150;
            }
            with (objControllerMusic)
            {
                playTempMusic  = "bgmInvincibility";
                fadeOut = true;
            }
        break;
    }

    playerRewarded = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw icon

    draw_sprite(sprMonitorIcons, icon, x, y);
