/// scrPlayerCollisionRight( x, y, angle, mask );
/*
*
*   =============================================
*
*   This functions returns if the right sensors has collided
*
*/

    /* These funtions are going to be used for detecting collision with the sides
       of the character. Since the character sides are constantly rotating we'll have
       to use the method of rotating around a position with trigonometry, in order
       to calculate the rotated position of the side and perform the check.

       This is very easy, what we'll have to do in the calculation is:

        rotated_x = x + cos( angle ) * distance;
        rotated_y = y - sin( angle ) * distance;

       Of course, since we'll have to calculate the collision with the sides,
       the distance would be the distance to the side of the mask (11 pixels).
    */
    
    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    mask_index      =   argument3;

    //Test collision
    collisionTest  =   scrPlayerCollision(floor(argument0 + cos(degtorad(argument2)) * sensorRightDistanceX),
                                          floor(argument1 - sin(degtorad(argument2)) * sensorRightDistanceY),
                                          layerIndex);

    //Set to the old mask
    mask_index      =   maskTemp;
    
    //Calculate the direction
    return  collisionTest;
