#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    view_object[0] = id;
    view_hborder[0] = screenWidthMid;
    view_vborder[0] = screenHeightMid;

    camTarget       =   objPlayer;      // -- Camera target to follow the object
    camStuck        =   0;              // -- Check if the camera is "stuck" or not
    camLagTimer     =   0;              // -- Size in frames of how long the lag remains

    camXShift       =   0;              // -- Horizontal position shift
    camYShift       =   0;              // -- Vertical position shift

    camYShakeValue  =   48;             // -- Positon of the camera if the camera is shacking
    camXShakeTimer  =   0;              // -- Duration of how longs the horizontal shake
    camYShakeTimer  =   0;              // -- Duration of how longs the vertical shake

    camBorderLeft   =   0;              // -- Camera left border
    camBorderRight  =   room_width;     // -- Camera right border
    camBorderTop    =   0;              // -- Camera top border
    camBorderBottom =   room_height;    // -- Camera bottom border
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Shake


    // -- Horizontal Shake
    if (camXShakeTimer > 0)
    {
        x              += random_range(-17, 17);
        camXShakeTimer -= 1;
    }

    // -- Vertical Shake
    if (camYShakeTimer > 0)
    {
        camYShift      = inch(camYShift, camYShakeValue - round(camYShakeTimer/2)*2, 12)
        y = lerp(y, y + camYShift, 0.17);

        if (camYShakeTimer mod 6 == 4)
        {
            camYShakeValue = -camYShakeValue;
        }
        camYShakeTimer -= 1;
    }


    if (sign(camYShakeValue) == -1)
    {
        if (camYShakeTimer == 0)
        {
            camYShakeValue = -camYShakeValue;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Decrease lag timer


    // -- Check if the camera is stuck
    if (camLagTimer > 0 && camStuck == true)
    {
        camLagTimer -=  1;
    }

    // -- "Free" the camera
    if (camLagTimer == 0 && camStuck == true)
    {
        camStuck   =   false;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Shift to the target position

    if (camStuck == true || instance_exists(camTarget) == false) exit;

    x = clamp(x, camBorderLeft + screenWidthMid, camBorderRight + screenWidthMid);
    y = clamp(y, camBorderTop + screenHeightMid, camBorderBottom - screenHeightMid);

    if (camTarget != objPlayer)
    {
        // -- Shift to the target position
        x += floor(camTarget.x + camXShift - x) * 0.2;
        y += floor(camTarget.y + camYShift - y) * 0.1;
    }
    // -- Follow the player
    else
    {
        if (camTarget.action != actionDead)
        {
            // -- Shift to the player position
            // -- I could just have used lerp
            x = lerp(x, (camTarget.x + camXShift), 0.2);
            y = lerp(y, (camTarget.y + camYShift), 0.16);
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Camera Shift

    // -- Check if the player exists and is the current camera target
    if (global.player == true && camTarget == objPlayer)
    {
        // -- Shift x-axis camera position
        switch(camTarget.action)
        {
            // -- Shift the camera forward while spindashing
            case actionSpindash:
                camXShift = inch(camXShift, 120 * camTarget.animationDirection, 6);
            break;

            // -- Shift the camera in the direction you are pressing while in a way launcher
            case actionWayLauncher:
                if (camTarget.keyLeft == true)
                {
                    camXShift = inch(camXShift, -80, 10);
                }
                else if (camTarget.keyRight == true)
                {
                    camXShift = inch(camXShift, 80, 10);
                }
            break;

            // -- Shift the camera based on the player's speed and angle in all other states
            default:
                camXShift = inch(camXShift, ((camTarget.xSpeed) * 15) * lengthdir_x(1, round(camTarget.angle)), 7);
        }
        
        // -- Shift y-axis camera position
        switch(camTarget.action)
        {
            // -- Shift the camera up while looking up
            case actionLookUp:                
                camYShift = inch(camYShift, -90, 3);
            break;
            
            // -- Shift the camera down while crouching
            case actionCrouch:                
                camYShift = inch(camYShift, 90, 3);
            break;
            
            // -- Shift the camera in the direction you are pressing while in a way launcher
            case actionWayLauncher:
                if (camTarget.keyUp == true)
                {
                    camYShift = inch(camYShift, -80, 10);
                }            
                else if (camTarget.keyDown == true)
                {
                    camYShift = inch(camYShift, 80, 10);
                }
            break;
            
            // -- Shift the camera based on the player's speed and angle in all other states
            default:
                // -- Only shift the camera if the y-shake timer is not active
                if (camYShakeTimer == 0)
                {
                    camYShift = inch(camYShift, ((camTarget.ySpeed) * 5) + lengthdir_y(camTarget.xSpeed * 9, round(camTarget.angle)), 9);
                }
        }
    }
