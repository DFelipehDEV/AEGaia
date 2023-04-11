/// scrPlayerHandleBalloons()
 // -- Handle balloons collision


    var balloon;
    balloon  =   scrPlayerCollisionHitbox(x, y, objBalloon);


    // -- Check if is meeting the balloon
    if (balloon != noone)
    {
        // -- Stop homing if the player was homing
        if (action == actionHoming)
        {
            action = actionJump;

            xSpeed = 4 * sign(xSpeed);
        }

        ySpeed = -6;
        // -- Explode balloon
        with(balloon)
        {
            // -- Drop rings
            scrRingsDrop(false, 10);


            // -- Destroy balloon
            scrPlaySound("sndBalloonExplode", global.volumeSounds, 1, false);
            instance_destroy();
        }
    }
