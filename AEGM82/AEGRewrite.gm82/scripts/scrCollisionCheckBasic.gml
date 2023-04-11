/// scrCollisionCheckBasic()
 // -- Checks for collision

    return (place_meeting(x, y + sign(ySpeed), parSolid)) ||
           (ySpeed >= 0 && place_meeting(x, y+sign(ySpeed), parPlatform) && !place_meeting(x, y, parPlatform));
