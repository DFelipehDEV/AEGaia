#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    color = c_black;
    image_alpha = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Fade and go to the room

    image_alpha -= 0.05;

    if (image_alpha <= 0)
    {
        instance_destroy();
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw fade


    draw_set_alpha(image_alpha);
    draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + screenWidth, view_yview[0] + screenHeight, color, color, color, color, 0);
    draw_set_alpha(1);
