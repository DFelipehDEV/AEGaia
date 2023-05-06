/// scrAnimationSet(Sprite, frame start, frame end, frame loop, frame speed, frame reset, frame repeat, repeat times, linked animation)

    animationSprite         =   argument0;
    animationFrameStart     =   argument1;

    if (argument2 == -1)
    {
        animationFrameEnd          = sprite_get_number(argument0) - 1;
    }
    else
    {
        animationFrameEnd       =   argument2;
    }

    if (argument3 == -1)
    {
        animationFrameLoop  =   0;
    }
    else
    {
        animationFrameLoop  =   argument3;
    }

    animationFrameSpeed       =   argument4;
    animationFrameReset       =   argument5;
    animationFrameRepeat      =   argument6;
    animationFrameRepeatTimes =   argument7;

    animationLinkedTo         =   argument8;
