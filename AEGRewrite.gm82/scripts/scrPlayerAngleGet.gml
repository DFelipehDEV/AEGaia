/// scrPlayerAngleGet(x, y, angle)
 // -- Detects the angle using two points that approach the ground.

    // -- Store temporary values
    maskTemp = mask_index
    mask_index = maskDot;

    // -- Limit the angle to 32 directions to maintain stability and reduce jittering
    argument2 = round(argument2 / 11.25) * 11.25;

    // -- Set the starting position of the sensors based on the angle
    pointLeftX = floor(argument0) - dcos(argument2) * 8;
    pointLeftY = floor(argument1) + dsin(argument2) * 8;

    pointRightX = floor(argument0) + dcos(argument2) * 8;
    pointRightY = floor(argument1) - dsin(argument2) * 8;

    // -- Check if it is colliding with the ground
    // -- Now, perform the checking. Push down the two points in order to touch the floor
    repeat (20)
    {
        if (scrPlayerCollision(floor(pointLeftX), floor(pointLeftY), layerIndex) == false)
        {
            pointLeftX += dsin(argument2);
            pointLeftY += dcos(argument2);
        }
        if (scrPlayerCollision(floor(pointRightX), floor(pointRightY), layerIndex) == false)
        {
            pointRightX += dsin(argument2);
            pointRightY += dcos(argument2);
        }
    }

    // -- Restore the previous mask
    mask_index      =   maskTemp;

    // -- Calculate and return the direction
    return point_direction(pointLeftX, pointLeftY, pointRightX, pointRightY);
