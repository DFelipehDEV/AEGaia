/// scrPlayerCollisionMain(x, y)
/*
*
*   =============================================
*
*   This functions returns if the main sensor has collided
*
*/

    /* This function is used essentially for collision detection with slopes up.
       It just detect collision of the main sensor (the big sensor that involves the
       main collisions).
    */

    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    mask_index      =   maskMain;


    //Test collision
    collisionTest  =   scrPlayerCollision(floor(argument0), floor(argument1), layerIndex);


    //Set to the old mask
    mask_index      =   maskTemp;

    //Calculate the direction
    return  collisionTest;
