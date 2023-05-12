#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_alpha = 0;

    qteTimer = 0;
    qteWon   = 0;

    hudBackScale = 0;

    hudInput[1] = choose(0, 1, 2);
    hudInput[2] = choose(0, 1, 2);
    hudInput[3] = choose(0, 1, 2);
    hudInputCounter = 0;
    hudInputScale[1] = 0;
    hudInputScale[2] = 0;
    hudInputScale[3] = 0;
    hudTimerColor = make_color_rgb(0, 115, 255);
    hudTimer = 100;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation

    qteTimer += 1;

    if (qteTimer < 60) exit;
    if (qteWon == 0)
    {
        //Lets not talk about this
        if (hudTimer > -100)
        {
            //HUD animations
            image_alpha = min(image_alpha + 0.05, 0.8)
            if (image_alpha >= 0.7)
            {
                hudBackScale = min(hudBackScale + 0.05, 1);

                if (hudBackScale > 0.95)
                {
                    hudInputScale[1] = min(hudInputScale[1] + 0.2, 1)
                    hudInputScale[2] = min(hudInputScale[2] + 0.2, 1)
                    hudInputScale[3] = min(hudInputScale[3] + 0.2, 1)
                    hudTimer -= 2.8;
                }
            }
        }
        else
        //The player has failed the quick time event
        {
            image_alpha = max(image_alpha - 0.1, 0)
            hudBackScale = max(hudBackScale - 0.2, 0)
            global.deltaMultiplier = min(global.deltaMultiplier + 0.2, 1)

            if (sound_isplaying("sndPlayerHurt") == false)
            {
                scrPlaySound("sndPlayerHurt", global.volumeSounds, 1, false);
            }
            if (image_alpha <= 0.1)
            {
                objPlayer.action = actionNormal;
                objPlayer.xSpeed = qteFailedXSpeed;
                objPlayer.ySpeed = qteFailedYSpeed;
                objPlayer.allowKeyTimer = 50;
                instance_destroy();
            }
        }
    }
    else
    {
        image_alpha = max(image_alpha - 0.1, 0)
        hudBackScale = max(hudBackScale - 0.2, 0)
        global.deltaMultiplier = min(global.deltaMultiplier + 0.2, 1)

        if (image_alpha == 0)
        {
            instance_destroy();
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Inputs


    //Check if we didn't won the event yet
    if (qteWon == 0 && image_alpha > 0.7)
    {
        //Which input you are currently on
        switch (hudInputCounter)
        {
            case 0:
                switch (hudInput[1])
                {
                    //In case you have to press A 
                    case 0:
                        if (input.inputActionPressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                    
                    
                    //In case you have to press S 
                    case 1:
                        if (input.inputSpecial1Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                    
                    
                    //In case you have to press D 
                    case 2:
                        if (input.inputSpecial2Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                        
                }
            break;
            
            case 1:
                hudInputScale[1] = max(hudInputScale[1] - 0.3, 0)
                switch (hudInput[2])
                {
                    //In case you have to press A 
                    case 0:
                        if (input.inputActionPressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                    
                    
                    //In case you have to press S 
                    case 1:
                        if (input.inputSpecial1Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                    
                    
                    //In case you have to press D 
                    case 2:
                        if (input.inputSpecial2Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                        }
                    break;
                        
                }
            break;
            
            
            //Win the event here
            case 2:        
                hudInputScale[1] = max(hudInputScale[1] - 0.4, 0)
                hudInputScale[2] = max(hudInputScale[2] - 0.4, 0)        
                switch (hudInput[3])
                {
                    //In case you have to press A 
                    case 0:
                        if (input.inputActionPressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                            qteWon = 1;
                            scrPlaySound("sndQTEWin", global.volumeSounds, 1, false);
                            
                            objPlayer.action = actionNormal;
                            objPlayer.animationIndex = "HOMED_1";
                            objPlayer.allowKeyTimer = 60;
                            scrPlaySound(objPlayer.voiceline[8], global.volumeSounds, 1, false);
                            hudInputScale[3] = 0.5;
                        }
                    break;
                    
                    
                    //In case you have to press S 
                    case 1:
                        if (input.inputSpecial1Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                            qteWon = 1;
                            scrPlaySound("sndQTEWin", global.volumeSounds, 1, false);
                            
                            objPlayer.action = actionNormal;
                            objPlayer.animationIndex = "HOMED_1";
                            objPlayer.allowKeyTimer = 60;
                            scrPlaySound(objPlayer.voiceline[8], global.volumeSounds, 1, false);
                            hudInputScale[3] = 0.5;
                        }
                    break;
                    
                    
                    //In case you have to press D 
                    case 2:
                        if (input.inputSpecial2Pressed == true)
                        {
                            hudInputCounter += 1;
                            scrPlaySound("sndQTEPress", global.volumeSounds, 1, false);
                            qteWon = 1;
                            scrPlaySound("sndQTEWin", global.volumeSounds, 1, false);
                            
                            objPlayer.action = actionNormal;
                            objPlayer.animationIndex = "HOMED_1";
                            objPlayer.allowKeyTimer = 60;
                            scrPlaySound(objPlayer.voiceline[8], global.volumeSounds, 1, false);
                            hudInputScale[3] = 0.5;
                        }
                    break;
                        
                }
            break;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw


    // -- Draw underlay
    draw_set_alpha(image_alpha);
    draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + screenWidth, view_yview[0] + screenHeight, c_black, c_black, c_black, c_black, 0);


    draw_sprite_ext(sprQTEKeysBack, 0, view_xview[0] + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudBackScale, hudBackScale, 0, c_white, image_alpha);
    draw_rectangle_color((view_xview[0] + screenWidthMid) - 100, (view_yview[0] + screenHeightMid) - 11, (view_xview[0] + screenWidthMid) + hudTimer, (view_yview[0] + screenHeightMid) + 11, hudTimerColor, hudTimerColor, hudTimerColor, hudTimerColor, 0)
    draw_set_alpha(1);
    draw_sprite_ext(sprQTETimer, 0, view_xview[0] + screenWidthMid, (view_yview[0] + screenHeightMid), hudBackScale, hudBackScale, 0, c_white, image_alpha);

    // -- ass written code but it works
    for (i = 0; i < 3; i += 1)
    {
        switch(hudInput[i + 1])
        {
            case 0:
                if (global.gamepad == false)
                {
                    draw_sprite_ext(sprKeyboardKeys, 0, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
                else
                {
                    draw_sprite_ext(sprGamepadKeys, 0, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
            break;

            case 1:
                if (global.gamepad == false)
                {
                    draw_sprite_ext(sprKeyboardKeys, 18, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
                else
                {
                    draw_sprite_ext(sprGamepadKeys, 2, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
            break;

            case 2:
                if (global.gamepad == false)
                {
                    draw_sprite_ext(sprKeyboardKeys, 3, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
                else
                {
                    draw_sprite_ext(sprGamepadKeys, 1, (view_xview[0] - (24 - i*24)) + screenWidthMid, (view_yview[0] + screenHeightMid) - 30, hudInputScale[i + 1], hudInputScale[i + 1], 0, c_white, 1)
                }
            break;
        }
    }
