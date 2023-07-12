/// scrPlayerHandleWater()
 // -- Handle water collision

    var waterHorizon, waterTrigger;
    waterHorizon    = scrPlayerCollisionObjectBottom(x, y, 0, maskMain, objWaterHorizon);
    waterTrigger   = scrPlayerCollisionObjectBottom(x, y, 0, maskMain, objWater);

    // -- Water mode
    if (waterHorizon != noone)
    {
        // -- Enter in water mode
        if (y > waterHorizon.y && yprevious < waterHorizon.y && scrPlayerCollisionObjectMain(x, y, objWater))
        {
            physicMode = 1;

            scrDummyEffectCreate(x, waterHorizon.y, sprVFXWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
            scrPlayerPhysicsSonic();

            scrPlaySound("sndWaterSplash", global.volumeSounds, 1, false);
        }
    }


    if (physicMode == 1)
    {
        if (!scrPlayerCollisionObjectMain(x, y, objWater))
        {
            physicMode = 0;
            underwaterDrownFrame = 0;
            underwaterAir = 600;
            if (instance_exists(objWaterHorizon))
            {
                scrDummyEffectCreate(x, instance_nearest(x, y, objWaterHorizon).y, sprVFXWaterDrop, 0.2, 0, -1, bm_add, 1, 1, 1, 0);
                scrPlaySound("sndWaterSplash", global.volumeSounds, 1, false);
            }
            scrPlayerPhysicsSonic();
        }
    }
    else
    {
        // -- Water mode
        if (waterTrigger != noone && !waterHorizon)
        {
            // -- Enter in water mode
            physicMode = 1;

            scrPlayerPhysicsSonic();
            scrPlaySound("sndWaterSplash", global.volumeSounds, 1, false);
        }
    }
