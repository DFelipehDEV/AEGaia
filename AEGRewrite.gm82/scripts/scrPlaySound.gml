/// scrPlaySound(Sound, volume, pitch, loop)

    switch (argument3)
    {
        case false:
            // -- Play a sound
            sound_play_ex(argument0, argument1, argument2, 0);
        break;

        case true:
            var sound;
            sound = sound_loop(argument0);
            sound_volume(sound, argument1);
            sound_pitch(sound, argument2);
        break;
    }
