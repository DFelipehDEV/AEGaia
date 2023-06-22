/// scrPlayerAirdash()
 // -- Add this to a action script when you want airdash to be able to be performed

    // -- Air dash
    if (keyActionPressed == true && ground == false && airdash == true && homingPossible == false)
    {
        airdash = false;
        airdashTimer = airdashTimerCommon;
        action  = actionAirdash;
        scrAnimationApply("JUMP");

        if (keyLeft)
        {
            xSpeed = -11;
        }
        else if (keyRight)
        {
            xSpeed = 11;
        }
        else
        {
            xSpeed = 11 * animationDirection;
        }
        ySpeed = 0;

        trailTimer = 60;

        scrPlaySound("sndPlayerHome", global.volumeSounds, 1, false);

        scrDummyEffectCreate(x, y, sprVFXBoostWave, 0.4, 0, -0.01, bm_normal, 1, animationDirection/1.5, 0.6, 0);
    }
