/// scrPlayerHandleBox()
// Handle collision with boxes


    var box1;
    box1 = scrPlayerCollisionObjectBottom(x, y + floor(ySpeed), 0, maskBig, objBox1);

    if (box1 != noone)
    {
        if (action == actionStomp || action == actionRoll)
        {
            with (box1)
            {
                scrPlaySound("sndBoxDestroy", global.volumeSounds, 1, false);
                instance_destroy();

                // -- Spawn metal parts
                repeat(4)
                {
                    var wood;
                    wood = instance_create(x, y, objBoxPart);
                    wood.hspeed = random_range(-3, 3);
                    wood.vspeed = random_range(-6, -3);
                    scrDummyEffectCreate(x + random_range(-32, 32), y + random_range(-32, 32), sprVFXExplosion2, 0.3, 0, -3, bm_normal, 1, 1, 1, 0)
                }

            }
        }
    }
