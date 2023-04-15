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
/// Render optimization
 // -- "Disable offset" views objects

    delay -= 1;
    if (delay == 0)
    {
        // -- Deactivate all objects
        instance_deactivate_all(1);

        // -- Activate deactivated objects if they are in the view
        instance_activate_region(view_xview[0] - (screenWidth / 2)- 64, view_yview[0] - (screenHeight / 2)- 64, view_wview + (screenWidth) + 64, view_hview + (screenHeight)+ 64, 1);

        // -- Activate the main objects
        instance_activate_object(parActivate);

        if (instance_exists(objRingDrop))
        {
            instance_activate_region(objRingDrop.x - 20, objRingDrop.y - 20, objRingDrop.x + 20, objRingDrop.y + 20, 1);
        }

        if (instance_exists(objPlayer))
        {
            instance_activate_region(objPlayer.x - 64, objPlayer.y - 64, objPlayer.x + 64, objPlayer.y + 64, 1);
        }

        delay = 30;
    }
