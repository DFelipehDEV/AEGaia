/// scrPlayerCollisionObjectLeft( x, y, angle, mask, object );
 // -- This function returns if the right sensor has collided a specified object

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = argument3;

    // -- Test collision
    collisionTest = instance_place(floor(argument0 - dcos(argument2) * sensorLeftDistance),
                                        floor(argument1 + dsin(argument2) * sensorLeftDistance),
                                        argument4);

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
