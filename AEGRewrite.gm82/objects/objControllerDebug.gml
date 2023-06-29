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
            draw_text(view_xview[0] + 333, view_yview[0] + 1, "TAB:TOGGLE OVERLAY");
            draw_text(view_xview[0] + 333, view_yview[0] + 11, "MOUSE RIGHT:LERP PLAYER POSITION");
            draw_text(view_xview[0] + 333, view_yview[0] + 21, "R:RESTART ROOM");
            draw_text(view_xview[0] + 333, view_yview[0] + 31, "PGUP:NEXT ROOM");
            draw_text(view_xview[0] + 333, view_yview[0] + 41, "PGDN:PREVIOUS ROOM");
            draw_text(view_xview[0] + 333, view_yview[0] + 51, "PAUSE:STOP AUDIO");
            draw_set_color(c_white)
            draw_text(view_xview[0] + 403, view_yview[0] + 57+48, string(string(floor(objPlayer.x))))
            draw_text(view_xview[0] + 403, view_yview[0] + 67+48, string(string(floor(objPlayer.y))))
            draw_text(view_xview[0] + 403, view_yview[0] + 77+48, string(objPlayer.terrainPlatform))
            draw_text(view_xview[0] + 333, view_yview[0] + 57+48, string("XSPEED " + string(objPlayer.xSpeed)))
            draw_text(view_xview[0] + 333, view_yview[0] + 67+48, string("YSPEED " + string(objPlayer.ySpeed)))
            draw_text(view_xview[0] + 333, view_yview[0] + 77+48, string("GROUND " + string(objPlayer.ground)))
            draw_text(view_xview[0] + 333, view_yview[0] + 87+48, string("DIR " + string(objPlayer.animationDirection)))
            draw_text(view_xview[0] + 333, view_yview[0] + 97+48, string("ACTION " + string(objPlayer.action)))
            draw_text(view_xview[0] + 333, view_yview[0] + 107+48, string("ANGLE " + string(objPlayer.angle) + "  " + string(objPlayer.angleCos) + "  " + string(objPlayer.angleSin)))
            draw_text(view_xview[0] + 333, view_yview[0] + 117+48, string("FPS " + string(fps) + "  " + string(fps_real)))
        }
    }
