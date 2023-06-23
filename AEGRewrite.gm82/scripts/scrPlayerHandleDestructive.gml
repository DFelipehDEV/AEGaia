/// scrPlayerHandleDestructive()
// -- Handle collision with destructive objects

    if (boost || action == actionRoll || action == actionAirdash)
    {
        if (scrPlayerCollisionObjectRight(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone || scrPlayerCollisionObjectLeft(x + xSpeed, y, angle, maskBig, objDestructiveWall) != noone) // -- Check if the instance has not been marked as destroyed
        {
            with (instance_nearest(x + xSpeed, y, objDestructiveWall))
            {
                scrPlaySound("sndBoxDestroy", global.volumeSounds, 1, false);

                // -- Spawn debris parts
                var randomRange, absRange;
                repeat(6)
                {
                    randomRange = random_range(-0.6, 0.6);
                    absRange = abs(randomRange);
                    scrDebrisEffectCreate(bbox_left + sprite_get_width(id)/2, bbox_top + sprite_get_height(id)/2, -2, sprVFXDebrisTest, 0, 0, randomRange, randomRange, false, absRange*0.6 + other.xSpeed * 1.2, (absRange * 8) + abs(other.xSpeed)*-0.2, 0.26 + absRange*0.2);
                    scrDummyEffectCreate(x + random_range(-32, 32), y + random_range(-32, 32), sprVFXExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
                }
                instance_destroy();
            }
        }
    }
