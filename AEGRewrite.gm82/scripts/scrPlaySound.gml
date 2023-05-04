/// scrPlaySound(Sound, volume, pitch, loop)

    switch (argument3)
    {
        case false:
            // -- Play a sound
            sound_play_ex(argument0, argument1, argument2, 0);
        break;

        case true:
            sound_loop(argument0)
        break;
    }
