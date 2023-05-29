/// scrPlayerCollisionRightEdge(x,y,angle)
/*
*
*   =============================================
*
*   This functions returns if the right edge sensor has collided
*   on the given angle.
*
*/

    /* The edges collision detection scripts. These are another big pilar of the
       engine. These are used for detecting if an edge surrounds the characters,
       so we know if we need to check angle or not.

       These are placed each at the sides of the character and it's a line of kind
       of 23 pixels wich detects, if it's colliding, we can check collision because
       it's a slope and not an edge. Here, we use the special "image_index", for
       using the prerotated images of the mask sprite.
       
       It isn't much difficult but helps a lot :D
    */

    //Store the actual mask for setting it up later
    maskTemp   =   mask_index;
    spriteTemp  =   sprite_index;
    frameTemp  =   image_index;

    mask_index      =   maskLines;
    sprite_index    =   maskLines;
    image_index     =   floor(argument2);  //0 to 359 possible images

    //Test collision
    collisionTest  =   scrPlayerCollision(floor(argument0 + dcos(argument2) * 8 +
                                                     dsin(argument2) * sensorRightDistance),
                                                   floor(argument1 - dsin(argument2) * 8 +
                                                     dcos(argument2) * sensorRightDistance),
                                                   layerIndex);

    //Set to the old mask
    mask_index      =   maskTemp;
    sprite_index    =   spriteTemp;
    image_index     =   frameTemp;

    //Calculate the direction
    return  collisionTest;
