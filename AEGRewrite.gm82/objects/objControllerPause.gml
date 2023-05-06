#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    pauseActive = 0;
    pauseOption = 1;
    pauseOptionOutlineScale = 0;

    titleScale = 0;

    gamescreen = -1;

    delay = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Pause

    delay = max(delay - 1, 0)
    if (pauseActive == 1)
    {
        titleScale = lerp(titleScale, 1, 0.2);


        switch (pauseOption)
        {
            case 1:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0)
                {
                    // -- Restart option
                    if (input.inputDown)
                    {
                        delay = 20;
                        pauseOption = 2;
                        pauseOptionOutlineScale = 0;
                    }

                    // -- Continue
                    if (input.inputAction)
                    {
                        delay = 20;
                        // -- Stop all objects
                        instance_activate_all()

                        // -- Activate pause screen
                        pauseActive = 0;

                        if (instance_exists(objPlayer))
                        {
                            if (objPlayer.allowKeyTimer < 15)
                            {
                                objPlayer.allowKeyTimer = 15;
                            }
                        }
                        with (objControllerMusic)
                        {
                            fadeOut = false;
                            fadeIn = true;
                        }
                    }
                }
            break;

            case 2:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0)
                {
                    // -- Continue option
                    if (input.inputUp)
                    {
                        delay = 20;
                        pauseOption = 1;
                        pauseOptionOutlineScale = 0;
                    }


                    // -- Exit option
                    if (input.inputDown)
                    {
                        delay = 20;
                        pauseOption = 3;
                        pauseOptionOutlineScale = 0;
                    }

                    // -- Restart
                    if (input.inputAction)
                    {
                        delay = 20;
                        instance_activate_all()
                        with (instance_create(0, 0, objFadeRoom))
                        {
                            roomgo = room;
                        }
                        scrPlayerGlobalsReset();
                    }
                }
            break;

            case 3:
                pauseOptionOutlineScale = lerp(pauseOptionOutlineScale, 1, 0.2);
                if (delay == 0)
                {
                    // -- Restart option
                    if (input.inputUp)
                    {
                        delay = 20;
                        pauseOption = 2;
                        pauseOptionOutlineScale = 0;
                    }

                    // -- Exit
                    if (input.inputAction)
                    {
                        delay = 20;
                        instance_activate_all()
                        with (instance_create(0, 0, objFadeRoom))
                        {
                            roomgo = rmTitleScreen;
                        }
                        scrPlayerGlobalsReset();
                    }
                }
            break;
        }
    }
    else
    {
        if (keyboard_check_pressed(vk_enter)) //|| joystick_check_button_pressed(0, 4))
        {
            // -- Create a "print screen" of the screen before pausing
            gamescreen = background_create_from_screen(0, 0, screenWidth, screenHeight, 0, 0);

            // -- Stop all objects
            instance_deactivate_all(1)
            instance_activate_object(objControllerInput);
            instance_activate_object(objControllerMusic);
            instance_activate_object(objControllerRoom);

            with (objControllerMusic)
            {
                fadeOut = true;
            }
            // -- Activate pause screen
            pauseActive = 1;

        }

        if (titleScale > 0)
        {
            titleScale = lerp(titleScale, 0, 0.2);;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw pause


    if (pauseActive)
    {
        draw_background_ext(gamescreen, view_xview[0], view_yview[0], 1, 1, 0, c_gray, 1)


        switch (pauseOption)
        {
            case 1:
                // -- Draw black outline
                draw_sprite_ext(sprPauseOptions, 3, (view_xview[0] + 3) + screenWidth/2, ((view_yview[0] + 3) - 10) + screenHeight/2, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);


                // -- Draw options
                draw_sprite_ext(sprPauseOptions, 0, view_xview[0] + screenWidth/2, (view_yview[0] - 10) + screenHeight/2, titleScale, titleScale, 0, c_white, 1);
                draw_sprite_ext(sprPauseOptions, 1, view_xview[0] + screenWidth/2, (view_yview[0] + 10) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
                draw_sprite_ext(sprPauseOptions, 2, view_xview[0] + screenWidth/2, (view_yview[0] + 30) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
            break;

            case 2:
                draw_sprite_ext(sprPauseOptions, 3, (view_xview[0] + 3) + screenWidth/2, ((view_yview[0] + 3) + 10) + screenHeight/2, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

                // -- Draw options
                draw_sprite_ext(sprPauseOptions, 0, view_xview[0] + screenWidth/2, (view_yview[0] - 10) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
                draw_sprite_ext(sprPauseOptions, 1, view_xview[0] + screenWidth/2, (view_yview[0] + 10) + screenHeight/2, titleScale, titleScale, 0, c_white, 1);
                draw_sprite_ext(sprPauseOptions, 2, view_xview[0] + screenWidth/2, (view_yview[0] + 30) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
            break;

            case 3:
                // -- Draw black outline
                draw_sprite_ext(sprPauseOptions, 3, (view_xview[0] + 3) + screenWidth/2, ((view_yview[0] + 3) + 30) + screenHeight/2, pauseOptionOutlineScale, pauseOptionOutlineScale, 0, c_white, 1);

                // -- Draw options
                draw_sprite_ext(sprPauseOptions, 0, view_xview[0] + screenWidth/2, (view_yview[0] - 10) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
                draw_sprite_ext(sprPauseOptions, 1, view_xview[0] + screenWidth/2, (view_yview[0] + 10) + screenHeight/2, titleScale, titleScale, 0, c_gray, 1);
                draw_sprite_ext(sprPauseOptions, 2, view_xview[0] + screenWidth/2, (view_yview[0] + 30) + screenHeight/2, titleScale, titleScale, 0, c_white, 1);
            break;
        }
    }
    draw_sprite_ext(sprPauseTitle, 0, view_xview[0] + screenWidth/2, (view_yview[0] - 40) + screenHeight/2, round(titleScale/0.2)*0.2, round(titleScale/0.2)*0.2, 0, c_white, 1);
