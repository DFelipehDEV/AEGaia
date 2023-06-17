/// scrPlayerHandleLayers()
 // -- Changes layers

    // -- Layer 0
    if (collision_check_fast(objLayer0))
    {
        layerIndex   =   0;
    }

    // -- Layer switch
    if (collision_check_fast(objLayerSwitch) && ground == true)
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
    if (collision_check_fast(objLayer1))
    {
        layerIndex   =   1;
    }
