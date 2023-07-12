#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0.2;
    shift       = 0;

    cardDashX   = 0;
    cardDashY   = view_yview + ScreenHeight - 75;


    // Go to the center of the room
    x = room_width / 2;
    y = room_height / 2;

    cardXScale = ScreenWidth;
    cardYScale = 1;

    cardX = view_xview;
    cardY = view_yview + ScreenHeight - 75;

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
    returnDelay = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Menu variables

    optionY[0] = ScreenHeight;
    optionY[1] = ScreenHeight + 32;
    optionY[2] = ScreenHeight + 64;

    optionMainAlpha = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Management

    switch (menu)
    {
        // -- Press start menu
        case 0:
            returnDelay -= 1;
            // -- Check if the player has pressed the start button
            if (input.inputAction && returnDelay < 0)
            {
                menu = 1;
                echoAlpha = 1;
                scrPlaySound("sndMenuAccept", global.volumeSounds, 1, false);
            }
        break;

        // -- After press start menu
        case 1:
            menuTimer += 1;
            echoAlpha = max(echoAlpha - 0.05, 0);
            if (echoAlpha > 0)
            {
                echoScale += 0.05;
            }

            // -- Start animations
            if (menuTimer > 40 && menuTimer < 180)
            {
                startAlpha -= 0.1;
                if (menuTimer > 70)
                {
                    y = inch(y, ystart - 40, 2);
                }
                // -- Make hud elements go away
                titleOffset = lerp(titleOffset, 120, 0.04);

                titleNameScale = lerp(titleNameScale, 0.5, 0.1);
                // -- Shrink options
                if (menuTimer > 90)
                {
                    //cardX = lerp(cardX, (ScreenWidthHalf)-32, 0.2);
                    //cardXScale = lerp(cardXScale, 128, 0.2);
                    cardYScale = lerp(cardYScale, 4, 0.05);
                    cardY = inch(cardY, view_yview + ScreenHeight - 120, 2);
                }
            }

            // -- Selection
            if (menuTimer > 180)
            {
                delay = max(delay - 1, 0);

                optionY[0] = lerp(optionY[0], ScreenHeight - 110, 0.1);
                optionY[1] = lerp(optionY[1], ScreenHeight - 70, 0.1);
                optionY[2] = lerp(optionY[2], ScreenHeight - 30, 0.1);
                switch (menuOption)
                {
                    // -- Start option
                    case 1:
                        cardDashY = lerp(cardDashY, view_yview + ScreenHeight - 120, 0.1);

                        if (delay == 0)
                        {
                            // -- Change selection
                            if (input.inputDown)
                            {
                                menuOption = 2;
                                delay = 25;

                                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                            }
                            // -- Check if the player has pressed the start button
                            if (input.inputAction) && instance_exists(objFadeNext) == false
                            {
                                with(instance_create(0, 0, objFadeNext))
                                {
                                    color = c_white;
                                }
                                scrPlaySound("sndMenuAccept", global.volumeSounds, 1, false);
                            }
                        }
                    break;

                    // -- Options option
                    case 2:
                        cardDashY = lerp(cardDashY, view_yview + ScreenHeight - 80, 0.1);

                        if (delay == 0)
                        {
                            // -- Change selection
                            if (input.inputUp)
                            {
                                menuOption = 1;
                                delay = 25;
                                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                            }
                            // -- Change selection
                            if (input.inputDown)
                            {
                                menuOption = 3;
                                delay = 25;
                                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                            }

                            // -- Go to options menu
                            if (input.inputAction)
                            {
                                menu = 3;
                                scrPlaySound("sndMenuAccept", global.volumeSounds, 1, false);
                            }
                        }
                    break;

                    // -- Exit option
                    case 3:
                        cardDashY = lerp(cardDashY, view_yview + ScreenHeight - 40, 0.1);

                        if (delay == 0)
                        {
                            // -- Change selection
                            if (input.inputUp)
                            {
                                menuOption = 2;
                                delay = 25;
                                scrPlaySound("sndMenuSelect", global.volumeSounds, 1, false);
                            }
                        }

                    // Check if the player has pressed the start button
                    if (input.inputAction)
                    {
                        game_end();
                    }
                    break;
                }
            }
        break;

        // -- Options menu
        case 3:
            cardY -= 4;
            cardYScale += 1;
            logoAlpha -= 0.05;
            optionMainAlpha -= 0.07;

            if (instance_exists(objAstralOptions) == false)
            {
                instance_create(x, y, objAstralOptions)
            }
        break;
    }

    // -- Move up and down
    shift += 4;
    titleY = y + lengthdir_y(4, shift);

    // Dash sign position
    cardDashX += 6;

    // Back to the start if it has reached the screen limit
    if (cardDashX > (ScreenWidth) + sprite_get_width(sprTitleCardDash))
    {
        cardDashX = -sprite_get_width(sprTitleCardDash);
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw logo, shapes and text


    // -- Draw card
    draw_sprite_ext(sprTitleCardZoneCard, 0, cardX, cardY, cardXScale, cardYScale, 0, image_blend, image_alpha);

    // -- Draw dash sign
    draw_sprite_ext(sprTitleCardDash, 0, view_xview + cardDashX, cardDashY, 1, 1, 0, image_blend, image_alpha);

    // -- Draw press start text
    draw_sprite_ext(sprPressStart, 0, view_xview+ ScreenWidthHalf, view_yview + 10 + ScreenHeight - 65, 1, 1, 0, c_white, startAlpha);

    // -- Selected press start text echo
    draw_sprite_ext(sprPressStart, 0, view_xview + ScreenWidthHalf, view_yview + 10 + ScreenHeight - 65, echoScale, echoScale, 0, c_gray, echoAlpha);

    // -- Draw earth
    draw_sprite_ext(sprAstralTitleBG, 0, view_xview + titleOffset, view_yview + titleOffset, 1, 1, 0, image_blend, image_alpha);

    // -- Draw moon
    draw_sprite_ext(sprAstralTitleBG, 1, view_xview - titleOffset, view_yview - titleOffset, 1, 1, 0, image_blend, image_alpha);

    // -- Draw shape bottom
    draw_sprite_ext(sprAstralTitleBG, 2, view_xview - titleOffset, view_yview + titleOffset, 1, 1, 0, image_blend, image_alpha);

    // -- Draw shape top
    draw_sprite_ext(sprAstralTitleBG, 3, view_xview + titleOffset, view_yview - titleOffset, 1, 1, 0, image_blend, image_alpha);

    // -- Draw logo
    draw_sprite_ext(sprite_index, 1, floor(x), titleY, titleNameScale, titleNameScale, image_angle, image_blend, logoAlpha);

    // -- Draw glow
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprite_index, 1, floor(x), titleY, titleNameScale, titleNameScale, image_angle, c_white, (abs(sin(current_time/340)*0.3))*logoAlpha);
    draw_set_blend_mode(bm_normal)

    if (menu > 0 && menuTimer > 180)
    {
        // -- Draw card
        draw_sprite_ext(sprTitleCardZoneCard, 0, 0, optionY[menuOption - 1] - 6, ScreenWidth, 0.8, 0, make_color_rgb(120, 228, 228), image_alpha);

        // -- Draw dash sign
        draw_sprite_ext(sprTitleCardDash, 0, view_xview + cardDashX, cardDashY, 1, 1, 0, image_blend, image_alpha);

        draw_set_alpha(optionMainAlpha)
        draw_set_font(global.fontTitleCard)
        draw_set_halign(fa_center);
        // -- Draw options
        draw_text(ScreenWidthHalf, optionY[0], "START");
        draw_text(ScreenWidthHalf, optionY[1], "SETTINGS");
        draw_text(ScreenWidthHalf, optionY[2], "EXIT");
        draw_set_halign(-1);
        draw_set_font(1)
        draw_set_alpha(1)


    }
