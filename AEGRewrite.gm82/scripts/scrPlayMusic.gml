/// scrPlayMusic(Music, Pitch, Loop part, Loop start, Loop?)

    musicVolumeReal = global.volumeMusic;
    global.bgmSound = sound_play_ex(argument0, musicVolumeReal, argument1, 0);

    if (argument4 == 1)
    {
        //sound_loop(global.bgmSound);
    }

    //sound_set_loop(global.bgmSound, argument3, argument2);

    //loopPart = argument2;
    //loopStart = argument3;
