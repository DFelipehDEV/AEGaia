/// scrPlayerPhysicsSonic()
 // -- Sonic physics

    // -- Normal physics
    if (physicMode == 0)
    {
        // -- Check if the player is not boosting
        if (boost == false)
        {
            xSpeedTop     =  10;
            xSpeedMax     =  12;
            xAcc          =  0.081;
            xDec          =  0.09;
        }
        // -- Boost
        else
        {
            xSpeedTop     =  13.7;
            xSpeedMax     =  15.1;
            xAcc          =  0.188;
            xDec          =  0.09;
        }

        yAcc          =  0.24;
        jumpStrength  =  -7.5;
    }


    // -- Water physics
    if (physicMode == 1)
    {
        // -- Check if the player is not boosting
        if (boost == false)
        {
            xSpeedTop     =  6;
            xSpeedMax     =  10;
            xAcc          =  0.062;
            xDec          =  0.06;
        }
        // -- Boosting
        else
        {
            xSpeedTop     =  10.3;
            xSpeedMax     =  12;
            xAcc          =  0.095;
            xDec          =  0.06;
        }

        yAcc          =  0.12;
        jumpStrength  =  -5.8;
    }
