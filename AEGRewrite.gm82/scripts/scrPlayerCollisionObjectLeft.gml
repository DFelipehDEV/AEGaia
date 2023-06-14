/// scrPlayerCollisionObjectLeft( x, y, angle, mask, object );
/*
*
*
*   =============================================
*
*   This functions returns if the left sensors has collided
*
*/

    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    mask_index      =   argument3;

    //Test collision
    collisionTest  =   instance_place(floor(argument0 - dcos(argument2) * sensorLeftDistance),
                                        floor(argument1 + dsin(argument2) * sensorLeftDistance),
                                        argument4);

    //Set to the old mask
    mask_index      =   maskTemp;

    //Calculate the direction
    return  collisionTest;
