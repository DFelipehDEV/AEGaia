/// scrPlayerAngleGet(x, y, angle)
 // -- Detects the angle using two points that approach the ground.

    // -- Store temporary values
    maskTemp = mask_index
    mask_index = maskDot;

    // -- Limit the angle to 32 directions to maintain stability and reduce jittering
    argument2 = round(argument2 / 11.25) * 11.25;

    var angleCOS, angleSIN;
    angleCOS = dcos(argument2);
    angleSIN = dsin(argument2);

    // -- Set the starting position of the sensors based on the angle
    pointLeftX = floor(argument0 - angleCOS * 8);
    pointLeftY = floor(argument1 + angleSIN * 8);

    pointRightX = floor(argument0 + angleCOS * 8);
    pointRightY = floor(argument1 - angleSIN * 8);

    // -- Check if it is colliding with the ground
    // -- Now, perform the checking. Push down the two points in order to touch the floor
    repeat (20)
    {
        if (scrPlayerCollision(pointLeftX, pointLeftY, layerIndex) == false)
        {
            pointLeftX += angleSIN;
            pointLeftY += angleCOS;
        }
        if (scrPlayerCollision(pointRightX, pointRightY, layerIndex) == false)
        {
            pointRightX += angleSIN;
            pointRightY += angleCOS;
        }
    }

    // -- Restore the previous mask
    mask_index = maskTemp;

    // -- Calculate and return the direction
    return point_direction(pointLeftX, pointLeftY, pointRightX, pointRightY);
