/// scrPlayerHandleDestructive()
// -- Handle collision with destructive objects

    if (boost || action == actionRoll || action == actionAirdash)
    {
        if (scrPlayerCollisionObjectRight(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone || scrPlayerCollisionObjectLeft(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone) // -- Check if the instance has not been marked as destroyed
        {
            with (instance_nearest(x + xSpeed, y, objDestructiveWall))
            {
                scrPlaySound(snd, global.volumeSounds, 1, false);

                // -- Spawn debris parts
                var randomRange, absRange;
                repeat(7)
                {
                    randomRange = choose(-0.5, -0.3, 0.1, 0.3, 0.5);
                    absRange = abs(randomRange);
                    scrDebrisEffectCreate(x + random_range(-16, 16), y + random_range(-16, 16), -2, sprite_index, 0, 0, randomRange, randomRange, true, (absRange*12) + other.xSpeed * 0.8, -((abs(other.xSpeed)*0.2) - (absRange * 5)) - 5, 0.26 + absRange*0.2);
                    scrDummyEffectCreate(x + random_range(-32, 32), y + random_range(-32, 32), sprVFXExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
                }
                instance_destroy();
            }
        }
    }
