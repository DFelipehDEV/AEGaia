/// scrPlayerCollisionObjectMain(x, y, object)
/*
*
*   =============================================
*
*   This functions returns if the main sensor has collided
*
*/

    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    mask_index      =   maskMain;

    //Test collision
    collisionTest  =   instance_place(floor(argument0), floor(argument1), argument2);


    //Set to the old mask
    mask_index      =   maskTemp;

    //Calculate the direction
    return  collisionTest;
