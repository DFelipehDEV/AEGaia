/// scrRingsDrop(Hurt?, Rings amount)
 // -- Steal and drop rings

    // -- Play drop sound
    if (argument0 == true)
    {
        scrPlaySound("sndPlayerRingSteal", global.volumeSounds, 1, false);
    }

    ringValue = argument1;
    ringAngle = 110;
    ringSpeed = 4;

    // -- Spawn rings
    while (ringValue)
    {
        ring           = instance_create(x, y, objRingDrop);
        ring.xSpeed    = cos(degtorad(ringAngle)) * ringSpeed;
        ring.ySpeed    = -sin(degtorad(ringAngle)) * ringSpeed*1.15;
        ring.dropTimer = 300;

        ringAngle     += 23;
        ringSpeed     -= 0.1;
        ringValue     -= 1;
    }
