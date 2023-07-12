#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    delay = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Render optimization
 // -- "Disable offset" views objects

    // -- Deactivate all objects
    instance_deactivate_all(true);

    // -- Activate the main objects
    instance_activate_object(parActivate);
    instance_activate_object(parPlatformMove);
    instance_activate_object(objHandle);
    instance_activate_object(gm82core_object)

    // -- Activate deactivated objects if they are in the view
    instance_activate_region(view_xview[0] - 64, view_yview[0] - 64, ScreenWidth + 128, ScreenHeight + 128, 1);

    if (instance_exists(objRingDrop))
    {
        instance_activate_region(objRingDrop.x - 16, objRingDrop.y - 16, 64, 64, 1);
    }

    if (global.player)
    {
        instance_activate_region(objPlayer.x - 64, objPlayer.y - 64, 128, 128, 1);
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variable updating

    delay += 1;
    global.player = instance_exists(objPlayer);

    if (delay == 90)
    {
        global.gamepad = joystick_count() == 1;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset delay

    if (delay == 100)
    {
        delay = 0;
    }
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset player existance

    global.player = false;
