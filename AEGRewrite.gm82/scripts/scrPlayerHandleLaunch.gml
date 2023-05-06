/// scrPlayerHandleLaunch()
 // -- Handle collision with launch sensors

    // -- Check if the player is touching with a sensor
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objLaunchSensor))
    {
        // -- Check if the player is not in flat terrain
        if (ground == true && abs(xSpeed) >= 3)
        {
            // -- Launch into the air
            ySpeed =   -angleSin*xSpeed;
            xSpeed =   angleCos*xSpeed;
            ground =   false;
            scrPlayerAngleSet(0);
        }
    }
