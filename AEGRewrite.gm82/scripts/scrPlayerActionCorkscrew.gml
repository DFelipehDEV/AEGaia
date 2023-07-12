/// scrPlayerActionCorkscrew()

    corkscrewObject = scrPlayerCollisionObjectMain(x, y, objCorkscrew);

    if (abs(xSpeed) < 4 || corkscrewObject == noone)
    {
        action = ActionNormal;
    }
    else
    {
        var relativePosition, angleInCorkscrew;
        relativePosition = x - corkscrewObject.x;
        angleInCorkscrew = degtorad((relativePosition)*360);

        //Set position acording to relative position to corkscrew
        y = lerp(y, corkscrewObject.y + 26 + (1+cos(angleInCorkscrew/sprite_get_width(corkscrewObject.sprite_index)))*(55*0.5), 0.1 + abs(xSpeed)/15)


        if (animationIndex == "CORKSCREW")
        {
            //Change animation frame depending on angle
            animationFrame = 0 + abs((radtodeg(degtorad((relativePosition/sprite_get_width(corkscrewObject.sprite_index))*360))/360*10) mod 11);
        }
    }
