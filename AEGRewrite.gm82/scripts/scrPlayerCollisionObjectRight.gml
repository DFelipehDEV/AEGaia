/// scrPlayerCollisionObjectRight(x, y, angle, mask, object)
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
    argument2   = degtorad(argument2);
    cosines      = cos(argument2);
    sine        = sin(argument2);

    //Test collision
    collisionTest  =   instance_place(floor(argument0 + cosines * sensorRightDistance),
                                        floor(argument1 - sine * sensorRightDistance),
                                        argument4);

    //Set to the old mask
    mask_index      =   maskTemp;

    //Calculate the direction
    return  collisionTest;
