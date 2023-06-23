/// scrPlayerHandleRails()
 // -- Handle rails collision

    var railNormal, railLayer0, railLayer1;
    railNormal =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRail);
    railLayer0  =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer0);
    railLayer1  =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer1);

    //Normal rail
    if (railNormal != noone && ground == true)
    {
        //Play sounds
        if (action != actionGrind)
        {
            grindsnd = 0;
            scrPlaySound("sndPlayerGrindStart", global.volumeSounds, 1, false);
        }
        action = actionGrind;
        scrAnimationApply("GRIND");
    }

    //Layer 0 rail
    if (railLayer0 != noone && ground == true && layerIndex == 0)
    {
        //Play sounds
        if (action != actionGrind)
        {
            grindsnd = 0;
            scrPlaySound("sndPlayerGrindStart", global.volumeSounds, 1, false);
        }
        action = actionGrind;
        scrAnimationApply("GRIND");
    }

    //Layer 1 rail
    if (railLayer1 != noone && ground == true && layerIndex == 1)
    {
        //Play sounds
        if (action != actionGrind)
        {
            grindsnd = 0;
            scrPlaySound("sndPlayerGrindStart", global.volumeSounds, 1, false);
        }
        action = actionGrind;
        scrAnimationApply("GRIND");
    }
