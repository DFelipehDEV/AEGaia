/// scrPlayerAngleGet(x, y, angle)
 //Detect angle with 2 dots that approach to the ground

    //Temporal values
    maskTemp   =   mask_index;
    mask_index =   maskDot;

    //Limit the angle by 24 directions to keep it more steady and avoid thickering
    argument2   = round(argument2 / 12) * 12;

    //Set the starting position of the sensors (depending on angle)
    pointLeftX = floor(argument0) - cos(degtorad(argument2)) * 8;
    pointLeftY = floor(argument1) + sin(degtorad(argument2)) * 8;

    pointRightX = floor(argument0) + cos(degtorad(argument2)) * 8;
    pointRightY = floor(argument1) - sin(degtorad(argument2)) * 8;


    //Check if is meeting the ground
    //Now, perform the checking. Push down the two points in order to touch the floor
    //if (scrPlayerCollisionBottom(x, y, angle, maskBig) || scrPlayerCollisionTop(x, y, angle, maskBig))
    {
        repeat(20)
        {
            if (scrPlayerCollision(floor(pointLeftX), floor(pointLeftY), layerIndex) == false)
            {
                pointLeftX += sin(degtorad(argument2));
                pointLeftY += cos(degtorad(argument2));
            }
            if (scrPlayerCollision(floor(pointRightX), floor(pointRightY), layerIndex) == false)
            {
                pointRightX += sin(degtorad(argument2));
                pointRightY += cos(degtorad(argument2));
            }
        }
    }

    //Return to the old mask
    mask_index      =   maskTemp;

    //Give the direction
    return floor(point_direction(pointLeftX, pointLeftY, pointRightX, pointRightY));
