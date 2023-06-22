/// scrPlayerCollisionRightEdge(x, y, angle)
// -- This function returns if the right edge sensor has collided

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    spriteTemp = sprite_index;
    frameTemp = image_index;

    mask_index = maskLines;
    sprite_index = maskLines;
    image_index = floor(argument2);  //0 to 359 possible images

    // -- Test collision
    collisionTest = scrPlayerCollision(floor(argument0 + dcos(argument2) * 8 +
                                                     dsin(argument2) * sensorRightDistance),
                                                   floor(argument1 - dsin(argument2) * 8 +
                                                     dcos(argument2) * sensorRightDistance),
                                                   layerIndex);

    // -- Set to the old mask
    mask_index = maskTemp;
    sprite_index = spriteTemp;
    image_index = frameTemp;

    // -- Return result
    return collisionTest;
