#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Load initialization

    scrInit();

    // -- Load configurations
    with (objControllerRoom)
    {
        ini_open("configf.ini");
        global.screenSize = ini_read_real("config", "screen", 1);
        global.screenVSync = ini_read_real("config", "vsync", 1);
        event_user(0);
        ini_close();
    }
    ini_open("configf.ini");
    global.volumeSounds = ini_read_real("config", "sfxvolume", 1);
    global.volumeMusic = ini_read_real("config", "bgmvolume", 1);
    global.volumeVoice = ini_read_real("config", "voicevolume", 1);
    global.volumeAmbient = ini_read_real("config", "ambientvolume", 1);

    alarm[0] = 55;
    if (debug_mode)
    {
        alarm[0] = 1;
    }
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Next room

    // -- Finish initialization and start the game
    room_goto_next();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Commands

    // -- Alt + R resets config
    if (keyboard_check(vk_alt) && keyboard_check(ord("R")))
    {
        with (objControllerRoom)
        {
            global.screenSize = 1;
            global.screenVSync = true;
            ini_open("configf.ini");
            ini_write_real("config", "screen", 1);
            ini_write_real("config", "vsync", 1);
            event_user(0);
            ini_close();
        }
        global.volumeSounds = 1;
        global.volumeMusic = 1;
        global.volumeVoice = 1;
        global.volumeAmbient = 1;
        ini_open("configf.ini");
        ini_write_real("config", "sfxvolume", 1);
        ini_write_real("config", "bgmvolume", 1);
        ini_write_real("config", "voicevolume", 1);
        ini_write_real("config", "ambientvolume", 1);
        ini_close();
    }
