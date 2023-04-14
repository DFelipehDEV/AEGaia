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
        if (instance_exists(objPlayer))
        {
            objPlayer.x = lerp(objPlayer.x, mouse_x, 0.2);
            objPlayer.y = lerp(objPlayer.y, mouse_y, 0.2);
            objPlayer.xSpeed = 0;
            objPlayer.ySpeed = 0;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug

    if (global.debugIsAThing == true)
    {
        if (instance_exists(objPlayer))
        {
            draw_sprite_ext(sprTrigger, 0, view_xview[0] + 333, view_yview[0] + 103, 179, 185, 0, c_black, 1);
            draw_set_color(c_white)
            draw_set_font(fontDebug)
            draw_set_halign(fa_left)
            draw_text(view_xview[0] + 403, view_yview[0] + 57+48, string(string(objPlayer.x)))
            draw_text(view_xview[0] + 403, view_yview[0] + 67+48, string(string(objPlayer.y)))
            draw_text(view_xview[0] + 403, view_yview[0] + 77+48, string(string(objPlayer.terrainPlatform)))
            draw_text(view_xview[0] + 333, view_yview[0] + 57+48, string("XSPEED- " + string(objPlayer.xSpeed)))
            draw_text(view_xview[0] + 333, view_yview[0] + 67+48, string("YSPEED- " + string(objPlayer.ySpeed)))
            draw_text(view_xview[0] + 333, view_yview[0] + 77+48, string("GROUND- " + string(objPlayer.ground)))
            draw_text(view_xview[0] + 333, view_yview[0] + 87+48, string("DIR- " + string(objPlayer.animationDirection)))
            draw_text(view_xview[0] + 333, view_yview[0] + 97+48, string("ACTION- " + string(objPlayer.action)))
            draw_text(view_xview[0] + 333, view_yview[0] + 107+48, string("ANGLE- " + string(objPlayer.angle)))
            draw_text(view_xview[0] + 333, view_yview[0] + 117+48, string("FPS- " + string(fps) + "  " + string(fps_real)))
            draw_text(view_xview[0] + 333, view_yview[0] + 127+48, string("SFXVOLUME- " + string(global.volumeSounds)))
            draw_text(view_xview[0] + 333, view_yview[0] + 137+48, string("VOLUMEREAL- " + string(objControllerMusic.musicVolumeReal)))
            draw_text(view_xview[0] + 333, view_yview[0] + 147+48, string("FADEIN- " + string(objControllerMusic.fadeIn)))
            draw_text(view_xview[0] + 333, view_yview[0] + 157+48, string("FADEOUT- " + string(objControllerMusic.fadeOut)))
            draw_text(view_xview[0] + 333, view_yview[0] + 167+48, string("BGMVOLUME- " + string(global.volumeMusic)))
        }
    }
