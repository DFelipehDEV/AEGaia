/// scrViewInOffset(instance, offset)
 // Check if an instance is on the screen with an offset

    return argument0.x > view_xview - argument1 &&
           argument0.y > view_yview - argument1 &&
           argument0.x < view_xview + ScreenWidth + argument1 &&
           argument0.y < view_yview + ScreenHeight + argument1;
