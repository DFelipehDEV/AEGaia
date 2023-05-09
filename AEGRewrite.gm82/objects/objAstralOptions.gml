#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_alpha = 0;

    var i;
    for (i = 0; i < 4; i += 1)
    {
        optionX[i] = -400;
        optionY[i] = 32*(i + 1);
    }

    optionSelected = 0;
    scale = 0;
    delay = 0;
    leaved = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Options

    if (leaved == true) exit;
    image_alpha = inch(image_alpha, 0.9, 0.05);

    var i;
    for (i = 0; i < 4; i += 1)
    {
        optionX[i] = lerp(optionX[i], 30, 0.2);
    }

    scale = inch(scale, screenWidth, 7);
    delay = max(delay - 1, 0);

    // -- Options
    switch(optionSelected)
    {
        case 0:
            if (delay = 0)
            {
                // -- Change option
                if (input.inputDown)
                {
                    optionSelected += 1;
                    scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                    scale = 0;
                    delay = 20;
                }

                if (input.inputRight)
                {
                    with (objControllerRoom)
                    {
                        global.screenSize += 1;
                        event_user(0);
                    }
                    delay = 25;
                }

                if (input.inputLeft && global.screenSize > 1)
                {
                    with (objControllerRoom)
                    {
                        global.screenSize -= 1;
                        event_user(0);
                    }
                    delay = 25;
                }
            }
        break;

        case 1:
            if (delay == 0)
            {
                // -- Change option
                if (input.inputUp && delay == 0)
                {
                    optionSelected -= 1;
                    scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                    scale = 0;
                    delay = 20;
                }

                // -- Change option
                if (input.inputDown)
                {
                    optionSelected += 1;
                    scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                    scale = 0;
                    delay = 20;
                }
            }

            if (input.inputRight)
            {
                with (objControllerMusic)
                {
                    global.volumeMusic = inch(global.volumeMusic, 1, 0.01);
                    musicVolumeReal = global.volumeMusic;
                    sound_volume(global.bgmSound, global.volumeMusic)
                }
            }

            if (input.inputLeft)
            {
                with (objControllerMusic)
                {
                    global.volumeMusic = inch(global.volumeMusic, 0, 0.01);
                    musicVolumeReal = global.volumeMusic;
                    sound_volume(global.bgmSound, global.volumeMusic)
                }
            }
        break;

        case 2:
            // -- Change option
            if (input.inputUp && delay == 0)
            {
                optionSelected -= 1;
                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                scale = 0;
                delay = 20;
            }
            // -- Change option
            if (input.inputDown && delay == 0)
            {
                optionSelected += 1;
                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                scale = 0;
                delay = 20;
            }

            if (input.inputRight)
            {
                global.volumeSounds = inch(global.volumeSounds, 1, 0.01);
            }

            if (input.inputLeft)
            {
                global.volumeSounds = inch(global.volumeSounds, 0, 0.01);
            }
        break;


        case 3:
            if (delay == 0)
            {
                if (input.inputUp)
                {
                    optionSelected -= 1;
                    scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                    scale = 0;
                    delay = 20;
                }
                // -- Change option
                if (input.inputDown)
                {
                    optionSelected = 0;
                    scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                    scale = 0;
                    delay = 20;
                }

                if (input.inputAction)
                {
                    scrPlaySound("sndMenuAccept", global.volumeSounds, 1, false);
                    delay = 120;
                    leaved = true;

                    // -- Save configurations
                    ini_open("configf.ini");
                    ini_write_real("config", "screen", global.screenSize);
                    ini_write_real("config", "sfxvolume", global.volumeSounds);
                    ini_write_real("config", "bgmvolume", global.volumeMusic);
                    ini_close();

                }
            }
        break;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Exit

    if (leaved)
    {
        image_alpha -= 0.03;

        if (image_alpha < 0)
        {
            instance_destroy();
        }
        if (instance_exists(objAstralTitle))
        {
            with (objAstralTitle)
            {
                shift       = 0;

                cardDashX   = 0;
                cardDashY   = view_yview + screenHeight - 75;


                // Go to the center of the room
                x = room_width / 2;
                y = room_height / 2;

                cardXScale = screenWidth;
                cardYScale = 1;

                cardX = view_xview;
                cardY = view_yview + screenHeight - 75;

                menu = 0;

                echoAlpha = 0;
                echoScale = 1;

                menuTimer = 0;

                titleOffset = 0;
                titleNameScale = 1;
                titleY = y;
                startAlpha = 1;

                menuOption = 1;

                delay = 0;
                logoAlpha = 1;
                returnDelay = 50;
                optionY[0] = screenHeight;
                optionY[1] = screenHeight + 32;
                optionY[2] = screenHeight + 64;

                optionMainAlpha = 1;
            }
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw options

    draw_sprite_ext(sprTrigger, 0, view_xview, view_yview, screenWidth, screenHeight, 0, c_blue, image_alpha);

    // -- Draw options
    var volMusic, volSound;
    volMusic = floor(global.volumeMusic * 100);
    volSound = floor(global.volumeSounds * 100);
    draw_set_alpha(image_alpha)
    draw_line_width_color(view_xview, optionY[optionSelected] + 10, view_xview + scale, optionY[optionSelected] + 10, 27, make_color_rgb(21,153,224), make_color_rgb(21,153,224));
    draw_set_font(global.fontTitleCard)
    draw_set_halign(fa_left);
    // -- Draw options
    draw_text(optionX[0], view_yview + optionY[0], "SCREEN RESOLUTION: " + string(window_get_width()) + "X" + string(window_get_height()));
    draw_text(optionX[1], view_yview + optionY[1], "MUSIC VOLUME: " + string(volMusic));
    draw_text(optionX[2], view_yview + optionY[2], "SOUND VOLUME: " + string(volSound));
    draw_text(optionX[3], view_yview + optionY[3], "SAVE AND EXIT");
    draw_set_halign(-1);
    draw_set_font(1)
    draw_set_alpha(1)
