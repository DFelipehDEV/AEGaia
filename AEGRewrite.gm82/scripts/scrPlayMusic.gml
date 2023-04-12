/// scrPlayMusic(Music, Pitch, Loop part, Loop start, Loop?)

    musicVolumeReal = global.volumeMusic;

    // -- Check if the loop argument is true
    if (argument4 == true)
    {
        var length;
        length = sound_get_length(argument0);
        // -- Stay this info on memory
        loopStart = argument3/length;
        loopEnd = argument2/length;

        sound_set_loop(argument0, loopStart, loopEnd, false);
        // -- Loop music
        global.bgmSound = sound_loop(argument0);

    }
    else
    {
        // -- Play the music
        global.bgmSound = sound_play_ex(argument0, musicVolumeReal, argument1, 0);
    }
