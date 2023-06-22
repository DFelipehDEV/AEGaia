/// scrPlayerCollisionObjectBottom(x, y, angle, mask, object)
 // -- This function returns if the bottom sensor has collided a specified object

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = argument3;

    // -- Test collision
    collisionTest = instance_place(floor(argument0 + dsin(argument2) * sensorBottomDistance),
                                    floor(argument1 + dcos(argument2) * sensorBottomDistance),
                                        argument4);

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
