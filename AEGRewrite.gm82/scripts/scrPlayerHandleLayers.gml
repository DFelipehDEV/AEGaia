/// scrPlayerHandleLayers()
 // -- Changes layers

    // -- Layer 0
    if (place_meeting(x, y, objLayer0))
    {
        layerIndex   =   0;
    }

    // -- Layer switch
    if (place_meeting(x, y, objLayerSwitch) && ground == true)
    {
        // -- Switch to layer 1
        if (xSpeed > 0)
        {
            layerIndex = 1;
        }

        // -- Switch to layer 0
        if (xSpeed < 0)
        {
            layerIndex = 0;
        }
    }

    // -- Layer 1
    if (place_meeting(x, y, objLayer1))
    {
        layerIndex   =   1;
    }
