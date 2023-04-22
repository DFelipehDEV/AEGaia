#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation alpha, animation angle and sounds

    image_alpha = 0.1; // -- Animation alpha

    // -- Play boost sounds
    scrPlaySound("sndPlayerBoostContinue", global.volumeSounds, 1, false)
    scrPlaySound("sndPlayerBoostLoop", global.volumeSounds, 1, true)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Stop the sounds

    sound_stop("sndPlayerBoostLoop");
    sound_stop("sndPlayerBoostContinue");
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation alpha, animation angle and position

    // -- Destroy if the animation alpha is equal to 0
    if (image_alpha <= 0)
    {
        instance_destroy();
    }

    // -- Increase alpha if the player started to boost
    if (image_alpha < 0.9 && playerID.boost == true)
    {
        image_alpha += 0.05;
    }

    // -- Fade if the player stopped boosting
    if (playerID.boost == false || abs(playerID.xSpeed) < 2.2)
    {
        image_alpha -= 0.05;
    }

    // -- Stick to the player position
    x = playerID.x;
    y = playerID.y;

    // -- Animation angle
    image_angle = point_direction(playerID.xprevious, playerID.yprevious, x, y); // -- Animation angle
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw boost

    draw_set_blend_mode(bm_add);
    if (playerID.animationDirection == 1)
    {
        draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    else
    {
        draw_sprite_ext(sprite_index, image_index, floor(x) + 11*dsin(image_angle), floor(y + 11*dcos(image_angle)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    draw_set_blend_mode(bm_normal);
