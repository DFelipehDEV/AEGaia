/// scrPlayerCollisionBottom(x, y, angle, mask)
 // -- This function returns if the bottom sensor has collided

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = argument3;

    // -- Test collision
    collisionTest = scrPlayerCollision(floor(argument0 + dsin(argument2) * sensorBottomDistance),
                                       floor(argument1 + dcos(argument2) * sensorBottomDistance),
                                       layerIndex);

    // -- Test platform collision
    if (!collisionTest && ySpeed >= 0 && ground == false)
    {
        collisionTest = place_meeting(floor(argument0 + dsin(argument2) * sensorBottomDistance),
                                      floor(argument1 + dcos(argument2) * sensorBottomDistance),
                                      parPlatform) && !place_meeting(floor(argument0), floor(argument1), parPlatform);
    }

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
