/// scrPlayerActionStomp()

    xSpeed = inch(xSpeed, 0, 7)
    ySpeed = 16;

    // -- Land
    if (ground == true)
    {
        action         = ActionStompLand;
        scrAnimationApply("STOMP_LAND");

        scrPlaySound("sndPlayerStompLand", global.volumeSounds, 1, false);
        scrCameraShakeY(20);
        sound_stop("sndPlayerStompStart");


        scrDummyEffectCreate(x, y, sprVFXStomp, 0.45, 0, -0.1, bm_normal, image_alpha, 1, 1, animationAngle)
        ySpeed = 0;
        sensorBottomDistance = 10;
    }

    // -- Airdash
    scrPlayerAirdash();
