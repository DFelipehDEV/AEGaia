/// scrPlayerHandleRails()
 // -- Handle rails collision

    var railNormal, railLayer0, railLayer1;
    railNormal =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRail);
    railLayer0  =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer0);
    railLayer1  =   scrPlayerCollisionObjectBottom(x, y, 0, maskBig, parRailLayer1);

    // -- Rail
    if ((railNormal != noone)
    || (railLayer0 != noone && layerIndex == 0)
    || (railLayer1 != noone && layerIndex == 1)) && ground == true
    {
        // -- Play sounds
        if (action != ActionGrind)
        {
            grindsnd = 0;
            scrPlaySound("sndPlayerGrindStart", global.volumeSounds, 1, false);
            scrAnimationApply("GRIND_1");
        }
        action = ActionGrind;
    }
