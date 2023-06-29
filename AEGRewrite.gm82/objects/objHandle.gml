#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    pull = 0;
    playerID = noone;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Pull

    if (pull == 1)
    {
        if (place_meeting(x, y, objCrane))
        {
            pull = 0;
            vspeed = 0;
            playerID.ySpeed = -6;
            playerID.action = actionSpring;
            if (sound_isplaying("sndPlayerJump") == false)
            {
                scrPlaySound("sndPlayerJump", global.volumeSounds, 1.1, false);
            }
            sound_stop("sndHandleMove");
            playerID.y -= 16;
            playerID.movementAllow = true;
            exit;
        }
        else
        {
            if (sound_isplaying("sndHandleMove") == false)
            {
                scrPlaySound("sndHandleMove", global.volumeSounds, 1, true);
            }
        }
        vspeed = lerp(vspeed, -10, 0.1);
        playerID.y = y + 4;

    }

    if (pull = 0)
    {
        y = inch(y, ystart, 6);
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw handle

    draw_sprite_ext(sprHandleLine, 0, floor(x), floor(y), image_xscale, -floor(y - crane.y), image_angle, image_blend, image_alpha);
    draw_sprite(sprite_index, 0, floor(x), floor(y));
