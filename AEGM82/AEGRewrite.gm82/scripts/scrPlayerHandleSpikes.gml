/// scrPlayerHandleSpikes()
 // -- Handle collision with spikes

    var spikeUp, spikeDown, spikeLeft, spikeRight;
    spikeUp    = scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objSpikeUp);
    spikeDown  = scrPlayerCollisionObjectTop(x, y, angle, maskBig, objSpikeDown);
    spikeLeft  = scrPlayerCollisionObjectLeft(x, y, angle, maskBig, objSpikeLeft);
    spikeRight = scrPlayerCollisionObjectRight(x, y, angle, maskBig, objSpikeRight);

    // -- Check if the player is meeting a spike
    if (spikeUp != noone || spikeDown != noone || spikeLeft != noone || spikeRight != noone)
    {
        // -- Hurt player
        scrPlayerHurtSet();
    }
