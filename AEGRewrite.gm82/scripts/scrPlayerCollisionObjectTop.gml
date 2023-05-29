/// scrPlayerCollisionObjectTop(x, y, angle, mask, object)
/*
*
*   =============================================
*
*   This functions returns if the left sensors has collided
*
*/

    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    mask_index      =   argument3;

    //Transform angle to radians and precalculate cosine and sine
    var cosines, sine;
    cosines = dcos(argument2);
    sine = dsin(argument2);

    //Test collision
    collisionTest  =   instance_place(floor(argument0 - sine * sensorTopDistance),
                                        floor(argument1 - cosines * sensorTopDistance),
                                        argument4);

    //Set to the old mask
    mask_index      =   maskTemp;

    //Calculate the direction
    return  collisionTest;
