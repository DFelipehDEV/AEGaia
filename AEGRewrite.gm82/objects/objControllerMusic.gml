#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    loopPart        = -1;
    loopStart       = -1;
    loopEnd       = -1;
    loopTotal       = -1;

    musicVolumeReal = global.volumeMusic;
    fadeIn          = false;
    fadeOut         = false;
    soundIndex = -1;
    playTempMusic   = "A";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Fade music

    // -- Fade out music
    if (fadeIn == true)
    {
        if (musicVolumeReal < global.volumeMusic)
        {
            musicVolumeReal += 0.02;
        }
    }
    else // -- Fade out music
    if (fadeOut == true)
    {
        musicVolumeReal = inch(musicVolumeReal, 0, 0.02);
    }

    if (global.bgmSound != -1)
    {
        sound_volume(global.bgmSound, musicVolumeReal);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Temp music

    if (playTempMusic != "A")
    {
        if (!sound_isplaying(playTempMusic))
        {
            scrPlaySound(playTempMusic, global.volumeMusic, 1, false);
        }
    }
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Stop audio

    playTempMusic = "A";
    fadeOut = false;
    fadeIn  = false;
    sound_stop_all();
