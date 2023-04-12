#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    //FMODinit(100);
    loopPart        = -1;
    loopStart       = -1;
    loopEnd       = -1;
    loopTotal       = -1;

    musicVolumeReal = global.volumeMusic;
    fadeIn          = false;
    fadeOut         = false;
    soundIndex = -1;
    playTempMusic   = -1;

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
        musicVolumeReal += 0.03;
        sound_volume(global.bgmSound, musicVolumeReal);
    }


    // -- Fade out music
    if (fadeOut == true && musicVolumeReal > 0)
    {
        musicVolumeReal -= 0.03;
        sound_fade(global.bgmSound, 0, 30);
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

    room_caption = string(fps);
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug


    draw_text(mouse_x, mouse_y, string(sound_get_length(global.bgmSound)))
    draw_text(mouse_x, mouse_y + 16, string(loopStart))
    draw_text(mouse_x, mouse_y + 32, string(loopEnd))
    draw_text(mouse_x, mouse_y + 48, string(sound_get_pos(global.bgmSound)))
    draw_text(mouse_x, mouse_y + 64, string(soundIndex))
    draw_text(mouse_x, mouse_y + 82, string(global.bgmSound))
