#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Destroy


    // -- Explode
    scrDummyEffectCreate(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprVFXExplosion1, sprVFXExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
    scrDummyEffectCreate(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprVFXExplosion1, sprVFXExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);
    scrDummyEffectCreate(x + random_range(-30, 30), y + random_range(-30, 30), choose(sprVFXExplosion1, sprVFXExplosion2), 0.45, 0, -0.1, bm_normal, 1, 1, 1, 0);

    // -- Play sound
    scrPlaySound(choose("sndExplosion1", "sndExplosion2"), global.volumeSounds, 1, false);

    // -- Create metal parts
    repeat(choose(4, 5, 6))
    {
        metal = instance_create(x, y, objEnemyMetal);
        metal.hspeed = random_range(-3, 3);
        metal.vspeed = random_range(-5, -3);
    }

    // -- Destroy
    instance_destroy();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Spin

    // -- This will only happen if the enemy is busted
    image_angle += scrAngleWrap(hspeed + vspeed);
