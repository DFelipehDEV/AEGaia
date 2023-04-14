/// scrCollisionMovementBasic()
 // -- Ground Collision

    // -- Base additional code by PVic, improved by Zazon Filipe
    var g;
    g = scrCollisionCheckBasic();


    // -- Uses both the default Neptune collision method and the collision rectangle scripts to check for collision.
    if g && collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, parTerrain, 0, 0)
    {
        ground = true;
    }
    else
    {
        ground = false;
    }


    // -- Wall Collision
    if((place_meeting(x + sign(xSpeed), y, parTerrain) && !place_meeting(x + sign(xSpeed), y - 1, parTerrain)) || (place_meeting(x + sign(xSpeed), y + 2, parTerrain) && !place_meeting(x + sign(xSpeed), y + 1, parTerrain)) )
    {
       wallLeft  = 0
       wallRight = 0
    }
    else
    {
       wallLeft  = (place_meeting(x - 1, y, parTerrain));
       wallRight = (place_meeting(x + 1, y, parTerrain));
    }


    // -- Ceiling
    if collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top-1, parTerrain, 0, 0)
    {
        ceiling = true;
    }
    else
    {
        ceiling = false;
    }


    // -- X Movement
    switch(abs(xSpeed))
    {
        case 0:
            break;
        default:
            var i;
            for(i=0; i < floor(abs(xSpeed)); i += 1)
            {
                if(place_meeting(x + sign(xSpeed), y, parTerrain) && !place_meeting(x + sign(xSpeed), y - 1, parTerrain))
                {
                    y -= 1;
                }
                if(place_meeting(x + sign(xSpeed), y + 2, parTerrain) && !place_meeting(x + sign(xSpeed), y + 1, parTerrain))
                {
                    y += 1;
                }
                if(!place_meeting(x + sign(xSpeed), y, parTerrain) && allowX == true)
                {
                    x += sign(xSpeed);
                }
                else
                {
                    xSpeed = 0;
                }
            }
        break;
    }


    // -- Y Movement
    switch(abs(ySpeed))
    {
        case 0:
            break;
        default:
            var j;
            for(j=0; j < floor(abs(ySpeed)); j+= 1)
            {
                if(!g && allowY == true)
                {
                    y += sign(ySpeed);
                }
                else
                {
                    ySpeed   = 0;
                }
            }
        break;
    }


    if(ground == false && allowY == true)
    {
       ySpeed = inch(ySpeed, 12, 0.2);
    }


    // -- Check if is stuck on the ground
    if (place_meeting(x + 1, y, parTerrain) && place_meeting(x - 1, y, parTerrain) && place_meeting(x, y + 1, parTerrain) && place_meeting(x, y - 1, parTerrain))
    {
        //Leave the ground
        y -= 1;
    }
