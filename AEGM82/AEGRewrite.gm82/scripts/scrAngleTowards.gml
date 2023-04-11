/// scrAngleTowards(destination, source, step)

    var angleDifference;
    angleDifference = argument0 - argument1;

    //Rotate
    if (angleDifference == 0) return argument0;

    if (abs(angleDifference) < 180)
    {
        if ((angleDifference) < 0)
        {
            argument1 -= argument2;
            if (argument1 <= argument0) argument1 = argument0;
        }
        else
        {
            argument1 += argument2;
            if (argument1 >= argument0) argument1 = argument0;
        }
    }
    else
    {
        if ((angleDifference) < 0) argument1 += argument2;
        else                        argument1 -= argument2;
    }

    return scrAngleWrap(argument1);
