/// scrPlayerHandleSprings()
 //Handle springs collision

    var spring;
    spring  =   instance_nearest(x, y, parSpring);

    //Check if the spring exists
    if (spring != noone)
    {
        //Check if the spring is on the normal action
        if (spring.image_speed = 0 && scrPlayerCollisionHitbox(x, y, spring))
        {
            scrPlayerAngleSet(0);
            scrPlaySound("sndSpring", global.volumeSounds, 1, false);
            xSpeed = spring.springStrength * dcos(spring.image_angle + 90);
            ySpeed = -spring.springStrength * dsin(spring.image_angle + 90);
            action = actionSpring;
            ground = false;
            spring.image_speed = 0.3;
            scrAnimationApply("SPRING");
        }
    }
