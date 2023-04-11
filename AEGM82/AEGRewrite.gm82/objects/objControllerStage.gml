#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    global.gameTimeAllow = true;

    global.gameTime      = global.playerCheckTime;

    gaugeIndex = 21;

    // -- Button pop up variables
    hudButton = "";
    hudButtonTimer = 0;
    hudButtonAlpha[0] = 0;
    hudButtonAlpha[1] = 1;
    hudButtonScale = 5;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Timer

    if (global.gameTimeAllow == true)
    {
        global.gameTime += (1000 / 60 * global.deltaMultiplier);
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description  Draw HUD
/*

	// -- Speedlines
	if (instance_exists(objVFXBoost) == true)
	{
		draw_sprite_ext(sprHUDSpeedlines, (global.gameTime div 40), __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), 1, 1, 0, c_white, (objVFXBoost.image_alpha / 1.8))
	}
	draw_set_font(global.fontHUD);
    draw_set_color(c_white);
    draw_set_halign(fa_right);


    // -- Draw time
    draw_sprite(sprHUDTime, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 8);
    draw_text(__view_get( e__VW.XView, 0 ) + 100, __view_get( e__VW.YView, 0 ) + 16, string_hash_to_newline(string(floor(global.gameTime/60000))+":"+scrStringNumberFormat(floor(global.gameTime/1000) mod 60,2)+":"+scrStringNumberFormat(floor(global.gameTime/10) mod 100,2)));


    // -- Draw rings
    draw_set_halign(fa_left);
    draw_sprite(sprHUDRings, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 32);
    draw_text(__view_get( e__VW.XView, 0 ) + 37, __view_get( e__VW.YView, 0 ) + 40, string_hash_to_newline(string(global.playerRings)));
    // -- Red counter
    if (global.playerRings == 0)
    {
        draw_text_colour(__view_get( e__VW.XView, 0 ) + 37, __view_get( e__VW.YView, 0 ) + 40, string_hash_to_newline(string(global.playerRings)), c_red, c_red, c_red, c_red, min(cos(global.gameTime/200), 1));
    }
    draw_set_halign(fa_right);



    // -- Draw energy bar
    // --draw_rectangle_colour(view_xview + 16+25, view_yview + view_hborder[0] - 16, view_xview + 16+objPlayer.energyAmount, view_yview +16+view_hborder[0] -28, c_orange, c_orange, c_orange, c_orange, 0);
    gaugeIndex = scrApproach(gaugeIndex, objPlayer.energyAmount/4, 1);
    draw_sprite(sprHUDEnergy, gaugeIndex, __view_get( e__VW.XView, 0 ) + 8, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HBorder, 0 ) - 10)


    // -- Warn pop up buttons
    switch (hudButton)
    {
        case "":

        break;


        case "BOOST":
            // -- Keyboard input
            if (gamepad_is_connected(0) == false)
            {
                // -- Draw input key
                draw_sprite_ext(sprKeyboardKeys, 18, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

                // -- Highlight
                if (hudButtonAlpha[1] > 0)
                {
                    // -- White version
                    d3d_set_fog(1, c_white, 0, 0)
                    draw_sprite_ext(sprKeyboardKeys, 18, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
                    d3d_set_fog(0, c_white, 0, 0)
                }
            }
            else
            // -- Gamepad input
            {
                // -- Draw input key
                draw_sprite_ext(sprGamepadKeys, 2, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

                // -- Highlight
                if (hudButtonAlpha[1] > 0)
                {
                    // -- White version
                    d3d_set_fog(1, c_white, 0, 0)
                    draw_sprite_ext(sprGamepadKeys, 2, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
                    d3d_set_fog(0, c_white, 0, 0)
                }
            }

            // -- Check if the button timer is avaiable to show the button
            if (hudButtonTimer > 0)
            {
                hudButtonTimer--;
                hudButtonAlpha[0] = min(hudButtonAlpha[0] + 0.2, 1);

                // -- Play warning sound effect
                if (hudButtonAlpha[0] == 0.4)
                {
                    scrPlaySound(sndMenuWarn, global.volumeSounds, 1, false);
                }
                // -- Decrease button scale
                hudButtonScale = lerp(hudButtonScale, 2, 0.2)
                hudButtonAlpha[1] = lerp(hudButtonAlpha[1], 0, 0.2);
            }
            else
            {
                hudButtonScale = lerp(hudButtonScale, 0, 0.2)
                hudButtonAlpha[0] = max(hudButtonAlpha[0] - 0.2, 0)


                // -- Reset variables after dissapearing
                if (hudButtonAlpha[0] == 0 && hudButtonAlpha[1] = 0)
                {
                    hudButton = "";
                    hudButtonTimer = 0;
                    hudButtonAlpha[0] = 0;
                    hudButtonAlpha[1] = 1;
                    hudButtonScale = 5;
                }
            }
        break;


        case "JUMP":
            if (gamepad_is_connected(0) == false)
            {
                // -- Draw input key
                draw_sprite_ext(sprKeyboardKeys, 0, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

                // -- Highlight
                if (hudButtonAlpha[1] > 0)
                {
                    // -- White version
                    d3d_set_fog(1, c_white, 0, 0)
                    draw_sprite_ext(sprKeyboardKeys, 0, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
                    d3d_set_fog(0, c_white, 0, 0)
                }
            }
            else
            // -- Gamepad input
            {
                // -- Draw input key
                draw_sprite_ext(sprGamepadKeys, 0, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[0]);

                // -- Highlight
                if (hudButtonAlpha[1] > 0)
                {
                    // -- White version
                    d3d_set_fog(1, c_white, 0, 0)
                    draw_sprite_ext(sprGamepadKeys, 0, __view_get( e__VW.XView, 0 ) + screenWidth/2, __view_get( e__VW.YView, 0 ) + 64, hudButtonScale, hudButtonScale, 0, c_white, hudButtonAlpha[1]);
                    d3d_set_fog(0, c_white, 0, 0)
                }
            }


            // -- Check if the button timer is avaiable to show the button
            if (hudButtonTimer > 0)
            {
                hudButtonTimer--;
                hudButtonAlpha[0] = min(hudButtonAlpha[0] + 0.2, 1);

                // -- Play warning sound effect
                if (hudButtonAlpha[0] == 0.4)
                {
                    scrPlaySound(sndMenuWarn, global.volumeSounds, 1, false);
                }
                // -- Decrease button scale
                hudButtonScale = lerp(hudButtonScale, 2, 0.2)
                hudButtonAlpha[1] = lerp(hudButtonAlpha[1], 0, 0.2);
            }
            else
            {
                hudButtonScale = lerp(hudButtonScale, 0, 0.2)
                hudButtonAlpha[0] = max(hudButtonAlpha[0] - 0.2, 0)


                // -- Reset variables after dissapearing
                if (hudButtonAlpha[0] == 0 && hudButtonAlpha[1] = 0)
                {
                    hudButton = "";
                    hudButtonTimer = 0;
                    hudButtonAlpha[0] = 0;
                    hudButtonAlpha[1] = 1;
                    hudButtonScale = 5;
                }
            }
        break;
    }
