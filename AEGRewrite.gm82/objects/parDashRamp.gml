#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    dashXStrength  = 0;           //X Strength
    dashYStrength  = 0;           //Y Strength

    dashRampPAct   = ActionNormal; //Player action when he meets the dash ramp

    dashAllow      = true;        //Checks if the player can dash into the dash
    dashAllowTimer = 0;           //Checks how remains to be able to dash again
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Handle

    if (dashAllow == false)
    {
        if (dashAllowTimer > 0)
        {
            dashAllowTimer -= 1;
        }
        //Allow the player to be able to dash
        else
        {
            dashAllow = true;
        }
    }
