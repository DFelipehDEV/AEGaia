/// scrPlayerActionHomingAttack()
 //Homing attack!


    if (instance_exists(parHome) == false) exit;

    animationFrameSpeed = 0.55 + abs(xSpeed)/17;


    homingTimer += 1;

    var homingTargetDistance, homingTargetDirection;
    homingTargetDistance    =   distance_to_object(instance_nearest(x, y, parHome));
    homingTargetDirection   =   point_direction(x, y, instance_nearest(x, y, parHome).x, instance_nearest(x, y, parHome).y);

    //Follow enemy
    if (place_meeting(x, y, parSolid) == false && place_meeting(x, y, parPlatform) == false && homingTimer < 50)
    {
        xSpeed = lengthdir_x(homingSpeed, homingTargetDirection);
        ySpeed = lengthdir_y(homingSpeed, homingTargetDirection);
    }
    //If the player have collided with a solid, stop homing
    else
    {
        xSpeed = 0;
        ySpeed = 0;
        action = actionNormal;
    }
