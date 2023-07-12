/// scrInit()
// -- Initialize the game

    // -- Load all sounds and musics
    scrLoadSounds();

    // -- Fonts
    global.fontTitleCard = font_add_sprite(sprFontTitleCard, ord("0"), true, 3);
    global.fontHUD = font_add_sprite(sprFontHUD, ord("0"), false, -2);
    global.fontText = font_add_sprite(sprFontText, ord(","), true, 0);
    global.fontResults = font_add_sprite(sprFontResults, ord("0"), false, -1);

    // -- Screen variables
    global.screenSize = 1; // -- Screen size multiplier
    global.screenVSync = true; // -- VSync

    global.gamepad = joystick_count();

    // -- Volume variables
    global.volumeSounds = 1; // -- Sounds volume
    global.volumeMusic = 1; // -- Music volume
    global.volumeVoice = 1; // -- Voicelines volume
    global.volumeAmbient = 1; // -- Ambient volume(footsteps)

    // -- Music variables
    global.bgmSound = -1; // -- Background music sound ID

    // -- Player variables
    global.player = false; // -- Whether the player exists
    global.playerRings = 0; // -- Player rings count
    global.playerCheckTime = 0; // -- Level time after player getting a checkpoint
    global.playerCheckX = 0; // -- Player X position if respawned at checkpoint
    global.playerCheckY = 0; // -- Player Y position if respawned at checkpoint

    // -- Others
    global.debug = false; // -- Debug flag
    global.debugIsAThing = false; // -- Activates the debug mode
    global.deltaMultiplier = 1; // -- Time movement multiplier, lower values make objects move slower, higher values make objects move faster, used for slow motion
    global.stageRank[RankC] = 2500; // -- Minimum score for C rank
    global.stageRank[RankB] = 4000; // -- Minimum score for B rank
    global.stageRank[RankA] = 6000; // -- Minimum score for A rank
    global.stageRank[RankS] = 8500; // -- Minimum score for S rank

    // -- Create permanent controllers
    instance_create(0, 0, objControllerMusic);
    instance_create(0, 0, objControllerRoom);
