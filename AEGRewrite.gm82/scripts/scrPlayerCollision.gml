/// scrPlayerCollision(x, y, layerIndex)
 // -- Check for terrain

    if (place_meeting(argument0, argument1, parSolid))
    {
        terrainPlatform = 0;
        return true;
    }

    // -- Check for platform
    if (place_meeting(argument0, argument1, parPlatform) && ground == true)
    {
        terrainPlatform = 1;
        return true;
    }

    switch (argument2)
    {
        // -- Check for low layer
        case 0:
            if (place_meeting(argument0, argument1, parLayer0))
            {
                terrainPlatform = 0;
                return true;
            }
        break;

        // -- Check for high layer
        case 1:
            if (place_meeting(argument0, argument1, parLayer1))
            {
                terrainPlatform = 0;
                return true;
            }
        break;
    }
