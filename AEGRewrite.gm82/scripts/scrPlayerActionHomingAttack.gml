/// scrPlayerActionHomingAttack()

    if (instance_exists(parHome) == false) exit;

    animationFrameSpeed = 0.55 + abs(xSpeed)/17;

    homingTimer += 1;

    var homingTargetDistance, homingTargetDirection;
    homingTargetDistance    =   distance_to_object(instance_nearest(x, y, parHome));
    homingTargetDirection   =   point_direction(x, y, instance_nearest(x, y, parHome).x, instance_nearest(x, y, parHome).y);

    // -- Check if we are not inside terrain
    if (place_meeting(x, y, parSolid) == false && place_meeting(x, y, parPlatform) == false && homingTimer < 50)
    {
        xSpeed = lengthdir_x(homingSpeed, homingTargetDirection);
        ySpeed = lengthdir_y(homingSpeed, homingTargetDirection);
    }
    else // -- Stop homing attack
    {
        xSpeed = 0;
        ySpeed = 0;
        action = actionNormal;
    }
