/// scrPlayerCollisionHitboxFast(x, y, object);
 // -- This functions returns if the hitbox sensor has collided a specified object

    // -- Store the actual mask for setting it up later
    maskTemp = mask_index;
    mask_index = maskHitbox;

    // -- Test collision
    collisionTest = place_meeting(floor(argument0), floor(argument1), argument2);

    // -- Set to the old mask
    mask_index = maskTemp;

    // -- Return result
    return collisionTest;
