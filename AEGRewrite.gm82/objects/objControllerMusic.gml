#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    loopPart        = -1;
    loopStart       = -1;
    loopTotal       = -1;

    musicVolumeReal = global.volumeMusic;
    fadeIn          = false;
    fadeOut         = false;

    playTempMusic   = -1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Fade music


    // -- Fade out music
    if (fadeIn == true && musicVolumeReal < global.volumeMusic)
    {
        musicVolumeReal += 0.03;
        sound_volume(global.bgmSound, musicVolumeReal);
    }


    // -- Fade out music
    if (fadeOut == true && musicVolumeReal > 0)
    {
        musicVolumeReal -= 0.03;
        sound_volume(global.bgmSound, musicVolumeReal);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Temp music


    if (playTempMusic != -1)
    {
        if (sound_isplaying(playTempMusic) == false)
        {
            fadeOut = true;
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

    playTempMusic = -1;
    fadeOut = false;
    fadeIn  = false;
    sound_stop_all();
