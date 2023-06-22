/// scrPlayerCollisionSlope(x, y, angle, mask)
 // -- This functions returns if the slope sensor has collided

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = argument3;

    // -- Test collision
    collisionTest = scrPlayerCollision(floor(argument0 + dsin(argument2) * 22),
                                        floor(argument1 + dcos(argument2) * 22),
                                        layerIndex);

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
