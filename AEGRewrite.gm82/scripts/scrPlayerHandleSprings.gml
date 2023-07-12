/// scrPlayerHandleSprings()
 //Handle springs collision

    // -- Check spring collision
    if (scrPlayerCollisionHitboxFast(x, y, parSpring))
    {
        var spring;
        spring = instance_nearest(x, y, parSpring);
        if (spring.image_speed = 0)
        {
            scrPlayerAngleSet(0);
            scrPlaySound("sndSpring", global.volumeSounds, 1, false);
            xSpeed = spring.springStrength * dcos(spring.image_angle + 90);
            ySpeed = -spring.springStrength * dsin(spring.image_angle + 90);
            action = ActionSpring;
            ground = false;
            spring.image_speed = 0.3;
            scrAnimationApply("SPRING");
        }
    }
