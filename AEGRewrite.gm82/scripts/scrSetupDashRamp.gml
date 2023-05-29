/// scrSetupDashRamp(XStrength, YStrength, PlayerAction, [QTEfailXspeed], [QTEfailYspeed])

    dashXStrength  = argument0; // -- X Strength
    dashYStrength  = argument1; // -- Y Strength

    dashRampPAct   = argument2; // -- Player action when he meets the dash ramp

    // -- Optional arguments
    if (argument_count > 3)
    {
        dashRampQTEFailedXSpeed = argument3;
        dashRampQTEFailedYSpeed = argument4;
    }
