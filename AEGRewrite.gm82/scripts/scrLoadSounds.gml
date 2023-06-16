/// scrLoadSounds()

    // -- Load sound effects
    sound_add_directory("GAME_DATA/SOUND", ".wav", 0, 1)
    // -- Load music
    sound_add_directory_ext("GAME_DATA/MUSIC", ".ogg", 1, true, "");
    // -- Load jingles
    sound_add_directory_ext("GAME_DATA/JINGLES", ".wav", 0, true, "");
