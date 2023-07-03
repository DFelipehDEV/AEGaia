#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    color = c_black;

    roomgo = -1;
    image_alpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Fade and go to the room

    image_alpha += 0.03;

    if (image_alpha >= 1.5)
    {
        room_goto(roomgo)
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description  Draw fade

    draw_set_alpha(image_alpha);
    draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + screenWidth, view_yview[0] + screenHeight, color, color, color, color, 0);
    draw_set_alpha(1);
