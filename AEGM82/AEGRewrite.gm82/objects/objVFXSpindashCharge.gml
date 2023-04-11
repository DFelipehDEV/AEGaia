#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Size/scale, color and alpha

    image_blend  = make_color_rgb(0, 160, 255);
    image_xscale = 0.47;
    image_yscale = 0.47;

    image_angle  = random_range(0,360);

    depth        = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Destroy, increase size and fade

    // -- Destroy
    if (image_alpha <= 0)
    {
        instance_destroy();
    }

    // -- Fade
    image_alpha -= 0.13;

    // -- Increase size/scale
    image_xscale += 0.12;
    image_yscale += 0.12;

    // -- Rotate
    image_angle  += scrAngleWrap(20);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw effect

    draw_set_blend_mode(bm_add);
    draw_self();
    draw_set_blend_mode(bm_normal);
