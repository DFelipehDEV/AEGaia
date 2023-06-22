/// scrPlayerCollisionRight(x, y, angle, mask)
 // -- This function returns if the right sensor has collided

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = argument3;

    // -- Test collision
    collisionTest = scrPlayerCollision(floor(argument0 + dcos(argument2) * sensorRightDistance),
                                          floor(argument1 - dsin(argument2) * sensorRightDistance),
                                          layerIndex);

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
