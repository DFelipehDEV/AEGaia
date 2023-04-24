#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables, animation and gravity

    image_speed = 0;

    gravity = 0.23;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Flames and rotation

    // -- Rotate
    image_angle += 3 + abs(vspeed);

    if (scrViewIn(id) == false)
    {
        var timer;
        timer = 0;

        timer += 1;

        if (timer > 30)
        {
            instance_destroy();
        }
    }
