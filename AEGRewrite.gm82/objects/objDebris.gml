#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation

    if (rotate)
    {
        image_angle += 3 + abs(vspeed) + irandom_range(-1, 1);
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Destroy

    if (!scrViewInOffset(id, 128))
    {
        instance_destroy();
    }
