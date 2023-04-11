/// scrViewIn(object)
 // Check if a object its on the screen


    if (argument0.x > view_xview && argument0.y > view_yview && argument0.x < view_xview + screenWidth && argument0.y < view_yview + screenHeight)
    {
        return true;
    }
    else
    {
        return false;
    }
