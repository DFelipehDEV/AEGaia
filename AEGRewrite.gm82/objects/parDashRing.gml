#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    dashRingType = "NORMAL"; // -- Dash ring type  "NORMAL" - Normal dash ring  "RAINBOW" - Rainbow dash ring

    dashStrength  = 0;      // -- Strength

    dashAllow = true;       // -- Checks if the player can dash into the dash
    dashAllowTimer = 0;     // -- Checks how remains to be able to dash again
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset

    if (dashAllow == false)
    {
        if (dashAllowTimer > 0)
        {
            dashAllowTimer -= 1;
        }
        // -- Allow the player to be able to dash
        else
        {
            dashAllow = true;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation

    // -- Deshrink animation
    if (image_xscale < 1 && image_yscale < 1)
    {
        image_xscale = min(image_xscale + 0.04, 1);
        image_yscale = image_xscale;
    }
