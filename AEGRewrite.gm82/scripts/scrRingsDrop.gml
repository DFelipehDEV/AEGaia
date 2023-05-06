/// scrRingsDrop(Hurt?, Rings amount)
 // -- Steal and drop rings

    // -- Play drop sound
    if (argument0 == true)
    {
        scrPlaySound("sndPlayerRingSteal", global.volumeSounds, 1, false);
    }
    var ringValue, ringAngle, ringSpeed, n, t;
    ringValue = argument1;
    ringAngle = 101.25 * pi / 180;
    ringSpeed = 4;
    n = false;
    t = 0;

    // -- Spawn rings
    while (ringValue)
    {
        var ring;
        ring           = instance_create(x, y, objRingDrop);
        ring.xSpeed    = cos(degtorad(ringAngle)) * ringSpeed;
        ring.ySpeed    = -sin(degtorad(ringAngle)) * ringSpeed*1.15;
        ring.dropTimer = 300;

        ringAngle     += 23;
        ringSpeed     -= 0.1;
        ringValue     -= 1;
        if (n == true)
        {
            ring.xSpeed *= -1;
            ringAngle += 22.5 * pi / 180;
        }
        n = !n;
        t += 1;
        if (t == 16)
        {
            ringSpeed = 2;
            ringAngle = 101.25 * pi / 180;
        }
    }
