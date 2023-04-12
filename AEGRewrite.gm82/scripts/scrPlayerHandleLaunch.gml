/// scrPlayerHandleLaunch()
 // -- Handle collision with launch sensors

    // -- Check if the player is touching with a sensor
    if (scrPlayerCollisionObjectMain(x, y, objLaunchSensor))
    {
        // -- Check if the player is not in flat terrain
        if (ground == true && (angle >= 10 || angle <= 350) && abs(xSpeed) >= 1)
        {
            // -- Launch into the air
            ySpeed = -sin(degtorad(angle))*xSpeed;
            if (angle > 30 && angle < 150)
            {
                xSpeed = 0;
            }
            else
            {
                xSpeed = cos(degtorad(angle))*xSpeed;
            }
            ground = false;
        }
    }
