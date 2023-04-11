/// scrPlayerActionLightspeed()

	    if (distance_to_object(objRing) > 70 || instance_exists(objRing) == false || ground == true)
	    {
	        action = actionNormal;
	        xSpeed /= 1.65;
	        ySpeed /= 1.2;
	    }
	    else
	    {
	        ringNear = instance_nearest(x, y, objRing)
	        ringDir  = point_direction(x, y, ringNear.x, ringNear.y);


	        xSpeed = lengthdir_x(11, ringDir);
	        ySpeed = lengthdir_y(11, ringDir);


	        animationAngle = point_direction(xprevious, yprevious, x, y)-90
	    }
