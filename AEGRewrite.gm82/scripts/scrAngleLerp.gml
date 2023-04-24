/// scrAngleLerp(start_angle, end_angle, lerp_amount)

// Lerp to angle function
// start_angle: the starting angle in degrees
// end_angle: the ending angle in degrees
// lerp_amount: the lerp amount, a value between 0 and 1

    var angleDif, finalAngle;
    angleDif = angle_difference(argument1, argument0);
    finalAngle = 0;

    if (abs(angleDif) > 180)
    {
        if (angleDif < 0)
        {
            angleDif += 360;
        }
        else
        {
            angleDif -= 360;
        }
    }

    finalAngle = argument0 + angleDif * argument2;

    return finalAngle;
