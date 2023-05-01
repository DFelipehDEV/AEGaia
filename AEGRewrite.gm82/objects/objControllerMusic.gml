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

    //loadDelay = 30;
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
        musicVolumeReal += 0.01;
        sound_volume(global.bgmSound, musicVolumeReal);
    }

    // -- Fade out music
    if (fadeOut == true && musicVolumeReal > 0)
    {
        musicVolumeReal -= 0.02;
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
        if (sound_isplaying(playTempMusic) == false)
        {
            scrPlaySound(playTempMusic, global.volumeMusic, 1, false);
        }
    }

    room_caption = string(fps);
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
