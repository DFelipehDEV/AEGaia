#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug

    if (global.debug == false)
    {
        instance_destroy();
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug

    // -- Activate/deactivate debug overlay
    if (keyboard_check_pressed(vk_tab))
    {
        global.debugIsAThing = -global.debugIsAThing;
    }

    // -- Restart room
    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }

    // -- Stop all sounds
    if (keyboard_check_pressed(vk_pause))
    {
        sound_stop_all();
    }

    // -- Go to next room
    if (keyboard_check_pressed(vk_pageup))
    {
        // -- Check if there is a next room
        if (room_next(room) != -1)
        {
            room_goto_next();
            scrPlayerGlobalsReset();
        }
    }

    // -- Go to previous room
    if (keyboard_check_pressed(vk_pagedown))
    {
        // -- Check if there is a previous room
        if (room_previous(room) != -1)
        {
            room_goto_previous();
            scrPlayerGlobalsReset();
        }
    }

    if (mouse_check_button(mb_right))
    {
        if (global.player == true)
        {
            objPlayer.x = lerp(objPlayer.x, mouse_x, 0.15);
            objPlayer.y = lerp(objPlayer.y, mouse_y, 0.15);
            objPlayer.xSpeed = 0;
            objPlayer.ySpeed = 0;
            objPlayer.movementAllow = false;
            objCamera.x = objPlayer.x;
            objCamera.y = objPlayer.y;
        }
    }

    if (mouse_check_button_released(mb_right))
    {
        if (global.player == true)
        {
            objPlayer.movementAllow = true;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug overlay

    if (global.debugIsAThing == true)
    {
        if (global.player == true)
        {
            draw_sprite_ext(sprTrigger, 0, view_xview[0] + 333, view_yview[0] + 103, 179, 185, 0, c_black, 1);
            draw_set_color(c_white)
            draw_set_font(fontDebug)
            draw_set_halign(fa_left)
            draw_set_color(c_aqua)

            // -- Button guide
            draw_text(view_xview[0] + 333, view_yview[0] + 1, "TAB:TOGGLE OVERLAY#MOUSE RIGHT:LERP PLAYER POSITION#R:RESTART ROOM#PGUP:NEXT ROOM#PGDN:PREVIOUS ROOM#PAUSE:STOP AUDIO");
            draw_set_color(c_white)

            // -- Debug overlay
            draw_text(view_xview[0] + 333, view_yview[0] + 57+48,
              string("XSPEED " + string(objPlayer.xSpeed)) + " " + string(floor(objPlayer.x))
            + string("#YSPEED " + string(objPlayer.ySpeed)) + " " + string(floor(objPlayer.y))
            + string("#GROUND " + string(objPlayer.ground))
            + string("#DIR " + string(objPlayer.animationDirection))
            + string("#ACTION " + string(objPlayer.action))
            + string("#ANGLE " + string(objPlayer.angle) + "  " + string(objPlayer.angleCos) + "  " + string(objPlayer.angleSin))
            + string("#FPS " + string(fps) + " " + string(fps_real)))
        }
    }
