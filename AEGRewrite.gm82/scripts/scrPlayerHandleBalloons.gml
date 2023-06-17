/// scrPlayerHandleBalloons()
 // -- Handle balloons collision

    var balloon;
    balloon  =   scrPlayerCollisionHitbox(x, y, objBalloon);

    // -- Check if is meeting the balloon
    if (balloon != noone)
    {
        scrPlayerHomingReset(actionJump, 4*sign(xSpeed), 0, 0, x, y);

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
