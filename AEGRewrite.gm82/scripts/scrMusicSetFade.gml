/// scrMusicSetFade(fadeOut?)

    if (instance_exists(objControllerMusic))
    {
        if (argument0 == true)
        {
            objControllerMusic.fadeIn = false;
            objControllerMusic.fadeOut = true;
        }
        else
        {
            objControllerMusic.fadeIn = true;
            objControllerMusic.fadeOut = false;
        }
    }
