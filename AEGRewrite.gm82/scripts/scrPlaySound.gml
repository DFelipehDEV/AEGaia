/// scrPlaySound(Sound, volume, pitch, loop)

    // -- Play a sound
    sound_play_ex(argument0, argument1, argument2, 0);

    if (argument3)
    {
        sound_loop(argument0)
    }
