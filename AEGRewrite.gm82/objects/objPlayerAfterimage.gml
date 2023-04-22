#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation sprite, frame, angle, direction, alpha and color

    // -- Check if the player exists
    if (global.player == true)
    {
        sprite_index = objPlayer.animationSprite;     //Animation sprite
        image_single = objPlayer.animationFrame;      //Animation frame

        image_angle  = objPlayer.animationAngle;      //Animation angle
        image_xscale = objPlayer.animationDirection;  //Animation direction
    }
    image_alpha  = 1;  //Animation alpha

    // -- Colors

    // -- Sonic
    color1 = c_teal;
    color2 = c_blue;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Fade and destroy

    // -- Destroy
    if (image_alpha <= 0)
    {
        instance_destroy();
    }

    // -- Fade
    image_alpha -= 0.12;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw afterimage

    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color1, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color2, image_alpha);
    draw_set_blend_mode(bm_normal);
