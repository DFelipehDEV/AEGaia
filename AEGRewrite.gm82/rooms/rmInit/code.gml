/// -- Init

    // -- Fonts
    global.fontTitleCard = font_add_sprite(sprFontTitleCard, ord("0"), true, 0);
    global.fontHUD = font_add_sprite(sprFontHUD, ord("0"), false, -2);
    global.fontResults = font_add_sprite(sprFontResults, ord("0"), false, -1);

    // -- Screen variables
    global.screenSize = 1;                 // -- Screen size


    // -- Volume variables
    global.volumeSounds = 1;                 // -- Sounds volume
    global.volumeMusic = 100;                 // -- Music volume


    // -- Music variables
    global.bgmSound           = -1;


    // -- Player variables
    global.playerRings        = 0;                 // -- Player rings amount
    global.playerAngleGravity = 0;                 // -- Player gravity angle
    global.playerCheckTime    = 0;                 // -- Level time after the player getting a checkpoint
    global.playerCheckX       = 0;                 // -- Player x position if the player got a checkpoint and respawned
    global.playerCheckY       = 0;                 // -- Player y position if the player got a checkpoint and respawned


    // -- Others
    global.debug              = false;             // -- Debug
    global.debugIsAThing      = false;              // -- Activates the debug
    global.deltaMultiplier    = 1;                 // -- Time movement multiplier, decreasing this will make certains objects such as the player move slower, otherwise increasing it will make the object faster, good for slow motion
    global.stageRank[rankC]     = 2500;
    global.stageRank[rankB]     = 4000;
    global.stageRank[rankA]     = 6000;
    global.stageRank[rankS]     = 8500;

    // -- Create controllers
    instance_create(0, 0, objControllerRender);
    instance_create(0, 0, objControllerAudio);
    instance_create(0, 0, objControllerMusic);
    //instance_create(0, 0, objControllerResolution);

    /*
    // -- Load configurations
    with (objControllerResolution)
    {
        ini_open("configf.ini");
        global.screenSize = ini_read_real("config", "screen", 1);
        event_user(0);
        ini_close();
    }
    ini_open("configf.ini");
    global.volumeSounds = ini_read_real("config", "sfxvolume", 1);
    global.volumeMusic = ini_read_real("config", "bgmvolume", 1);
    ini_close();

    */
    room_goto_next();
