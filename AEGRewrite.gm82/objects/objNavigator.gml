#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    ended = 0;
    npcChatting = false;

    npcString[0] = "NO STRING";
    npcStringLength = 0;

    npcStringCurrent = 0;
    textTotal = "";
    textOffset = 0;

    letter = 1;
    letterSoundTimer = 0;
    npcMission = noone;

    npcRoom = -1;

    dialogueAlpha = 0;
    dialogueColor[0] = c_white;
    dialogueOffsetX = 400;
    dialogueOffsetY = 400;

    drawOffsetY  = 0;

    inputAlpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Change dialogue and end dialogue

    switch (ended)
    {
        // -- In case the dialogue has not ended
        case 0:
            if keyboard_check_pressed(ord("A")) && npcChatting == true
            {
                // -- Check if its not in the final dialogue
                if (npcStringCurrent < npcStringLength - 1)
                {
                    // -- Next Dialogue
                    npcStringCurrent = min((npcStringCurrent + 1), (npcStringLength - 1));
                    textTotal = ""
                    letter = 1;
                    scrPlaySound("sndDialogueOpen", global.volumeSounds, 1, false);
                    textOffset = -12;
                }
                else
                {
                    // -- Finish dialogue
                    ended = 1;
                }
            }
        break;

        // -- In case the dialogue has ended
        case 1:
            npcChatting  =  false;
            letter = 1;
            textTotal = ""
            npcStringCurrent = 0;
            if npcMission != 0
            {
                // -- Return to previous settings
                if instance_exists(objPlayer)
                {
                    objPlayer.allowKeys = true;
                    objControllerStage.hudGone = false;

                    objCamera.camYShift = 0;
                    objCamera.camTarget = objPlayer;
                }
            }
            global.deltaMultiplier = 1;
            ended = 0;
        break;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Show dialogue

    if (npcChatting == true)
    {
        if dialogueAlpha < 1
        {
            dialogueAlpha += 0.05;
        }

        dialogueOffsetX = lerp(dialogueOffsetX, 0, 0.12);
        dialogueOffsetY = lerp(dialogueOffsetY, 0, 0.12);

        textOffset = min(textOffset + 1, 0)
    }
    else
    {
        dialogueAlpha = 0;
        dialogueOffsetX = lerp(dialogueOffsetX, 400, 0.13);
        dialogueOffsetY = lerp(dialogueOffsetY, 400, 0.13);
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Start dialogue

    var playerID;
    playerID = instance_nearest(x, y, objPlayer);
    // -- Check if the player is near the navigator
    if (distance_to_object(playerID) < 40)
    {
        // -- Check if we are not in a dialogue
        if (npcChatting == false)
        {
            // -- Check if we pressed the input to start talking
            if (input.inputSpecial3Pressed)
            {
                npcChatting = true;

                npcStringCurrent = 0;
                with (playerID)
                {
                    xSpeed = 0;
                    allowKeys = false;
                    keyLeft                 = 0;
                    keyRight                = 0;
                    keyUp                   = 0;
                    keyDown                 = 0;
                    keyAction               = 0;
                    keySpecial1             = 0;
                    keySpecial2             = 0;
                    keySpecial3             = 0;

                    keyLeftPressed          = 0;
                    keyRightPressed         = 0;
                    keyUpPressed            = 0;
                    keyDownPressed          = 0;
                    keyActionPressed        = 0;
                    keySpecial1Pressed      = 0;
                    keySpecial2Pressed      = 0;
                    keySpecial3Pressed      = 0;

                    keyLeftReleased         = 0;
                    keyRightReleased        = 0;
                    keyUpReleased           = 0;
                    keyDownReleased         = 0;
                    keyActionReleased       = 0;
                    keySpecial1Released     = 0;
                    keySpecial2Released     = 0;
                    keySpecial3Released     = 0;

                    global.deltaMultiplier = 0.2;
                }


                objCamera.camYShift = -30;
                objCamera.camTarget = id;
                scrPlaySound("sndDialogueOpen", global.volumeSounds, 1, false);

                objControllerStage.hudGone = true;
                ended = 0;
            }
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    draw_sprite_ext(sprite_index, 2, x, y, max(0.6, abs(cos(global.gameTime/230)*1.4)), max(0.3, abs(cos(global.gameTime/200)*1.3)), image_angle, image_blend, image_alpha)
    draw_sprite_ext(sprite_index, 1, x - 1, y, image_xscale, image_yscale, round((global.gameTime/8)/6)*6, image_blend, image_alpha);


    if (inputAlpha > 0)
    {
        // -- Check if there is no gamepad connected
        if (joystick_count() == 0)
        {
            // -- Draw keyboard input
            draw_sprite_ext(sprKeyboardKeys, 5, x, bbox_top - 16, inputAlpha, inputAlpha, 0, image_blend, inputAlpha);
        }
        else
        // -- Draw gamepad input
        {
            draw_sprite_ext(sprGamepadKeys, 3, x, bbox_top - 16, inputAlpha, inputAlpha, 0, image_blend, inputAlpha);
        }
    }

    // -- Check if the player is touching the navigator
    if (distance_to_object(objPlayer) < 40)
    {
        inputAlpha = lerp(inputAlpha, 1, 0.2);
    }
    else
    {
        inputAlpha = lerp(inputAlpha, 0, 0.2);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw Dialogue

    // -- Dialogue
    if (npcChatting == true)
    {
        if (dialogueAlpha == 1)
        {
            letterSoundTimer = max(0, letterSoundTimer - 1);
            // -- Write dialogue text
            var lettertofind;
            if (letter < string_length(npcString[npcStringCurrent]) + 1)
            {
                lettertofind = string_char_at(npcString[npcStringCurrent], letter)
                textTotal = string_insert(lettertofind, string(textTotal), letter)
                if (letterSoundTimer == 0)
                {
                    scrPlaySound("sndDialogueType", global.volumeSounds, 1, false)
                    letterSoundTimer = 4;
                }
            }
            letter += 1;
        }
        draw_set_valign(fa_top)
        draw_set_font(global.fontText);
        draw_sprite_ext(sprDialogueBG, 0, view_xview[0] + 16 - dialogueOffsetX, view_yview[0] + 70 - dialogueOffsetY, 1, 1, 0, dialogueColor[npcStringCurrent], dialogueAlpha);
        draw_sprite_ext(sprKeyboardKeys, 0, view_xview[0] + 157 - dialogueOffsetX, view_yview[0] + 168 - dialogueOffsetY, 1, 1, 0, c_white, dialogueAlpha);
        //draw_sprite_ext(avatarSprite[npcStringCurrent], avatarIndex[npcStringCurrent], view_xview[0] + 28 - dialogueOffsetX, view_yview[0] + 177 - dialogueOffsetY, 1, 1, 0, c_white, dialogueAlpha);

        draw_set_alpha(dialogueAlpha);
        draw_set_halign(fa_left);
        draw_text_ext(view_xview[0] + 32 - dialogueOffsetX, view_yview[0] + (183 + textOffset) - dialogueOffsetY, string(textTotal), 3, 600);
        draw_set_alpha(1);
    }
