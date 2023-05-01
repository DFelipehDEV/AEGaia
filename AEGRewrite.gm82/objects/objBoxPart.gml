#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables, animation and gravity

    image_speed = 0;

    gravity = 0.23;
    image_xscale = random_range(1, 0.6);

    timer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Rotation and destroy

    // -- Calculate random rotation speed based on vertical speed
    var rotationSpeed;
    rotationSpeed = 3 + abs(vspeed) + irandom_range(-1, 1);

    // -- Rotate
    image_angle += rotationSpeed;

    if (scrViewIn(id) == false)
    {
        timer += 1;

        if (timer > 60)
        {
            instance_destroy();
            show_debug_message("destroyed plank");
        }
    }
