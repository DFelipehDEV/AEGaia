/// scrPlayerHandleRings()
 // -- Handle rings collision


    var ringNormal, ringDrop, ringMagnetic;
    ringNormal = scrPlayerCollisionHitbox(x, y, objRing);
    ringDrop = scrPlayerCollisionHitbox(x, y, objRingDrop);
    ringMagnetic = scrPlayerCollisionHitbox(x, y, objRingMagnetic);

    // -- Collect normal ring
    if (ringNormal != noone)
    {
        // -- Destroy ring and create effect
        with (ringNormal)
        {
            instance_create(x, y, objVFXRing);
            sound_stop("sndRing");
            scrPlaySound("sndRing", global.volumeSounds, 1, false);
            instance_destroy();
        }
        global.playerRings += 1;

        if (action != ActionLightspeed)
        {
            // -- Get energy
            scrPlayerEnergyAdd(4);
        }
    }


    // -- Collect dropped ring
    if (ringDrop != noone && (action != ActionHurt && invincibilityTimer < 100))
    {
        // -- Destroy ring and create effect
        with (ringDrop)
        {
            instance_create(x, y, objVFXRing);
            sound_stop("sndRing");
            scrPlaySound("sndRing", global.volumeSounds, 1, false);
            instance_destroy();
        }
        global.playerRings  +=  1;
    }

    // -- Collect magnetic ring
    if (ringMagnetic != noone)
    {
        // -- Destroy ring and create effect
        with (ringMagnetic)
        {
            instance_create(x, y, objVFXRing);
            sound_stop("sndRing");
            scrPlaySound("sndRing", global.volumeSounds, 1, false);
            instance_destroy();
        }
        global.playerRings  +=  1;
        // -- Get energy
        scrPlayerEnergyAdd(4);
    }
