#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    view_object[0] = id;
    view_hborder[0] = ScreenWidthHalf*0.99;
    view_vborder[0] = ScreenHeightHalf*0.98;

    camTarget       =   objPlayer;      // -- Camera target to follow the object
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
        camYShift      = inch(camYShift, camYShakeValue - round(camYShakeTimer/2)*2, 10)
        y = lerp(y, floor(y + camYShift), 0.17);

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
    if (camLagTimer > 0)
    {
        camLagTimer -=  1;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Camera Shift

    // -- Check if the player exists and is the current camera target
    if (global.player == true && camTarget == objPlayer)
    {
        var angle;
        angle = round(camTarget.angle/5)*5
        // -- Shift x-axis camera position
        switch(camTarget.action)
        {
            // -- Shift the camera in the direction you are pressing while in a way launcher
            case ActionWayLauncher:
                if (camTarget.keyLeft == true)
                {
                    camXShift = inch(camXShift, -80, 10);
                }
                else if (camTarget.keyRight == true)
                {
                    camXShift = inch(camXShift, 80, 10);
                }
                else
                {
                    camXShift = inch(camXShift, 0, 10);
                }
            break;

            // -- Shift the camera based on the player's speed and angle in all other states
            default:
                var targetSpeed;
                //targetSpeed = ((camTarget.xSpeed) * 12) * lengthdir_x(1, floor(angle));
                targetSpeed = (((camTarget.x - camTarget.xprevious)/global.deltaMultiplier) * 12);
                camXShift = inch(camXShift, round(targetSpeed), 5);
        }

        // -- Shift y-axis camera position
        switch(camTarget.action)
        {
            // -- Shift the camera up while looking up
            case ActionLookUp:                
                camYShift = inch(camYShift, -90, 3);
            break;
            
            // -- Shift the camera down while crouching
            case ActionCrouch:                
                camYShift = inch(camYShift, 90, 3);
            break;
            
            // -- Shift the camera in the direction you are pressing while in a way launcher
            case ActionWayLauncher:
                if (camTarget.keyUp == true)
                {
                    camYShift = inch(camYShift, -80, 10);
                }            
                else if (camTarget.keyDown == true)
                {
                    camYShift = inch(camYShift, 80, 10);
                }
                else
                {
                    camYShift = inch(camYShift, 0, 10);
                }
            break;
            
            case ActionStomp:
                camYShift = inch(camYShift, 210, 3);
            break;
            
            // -- Shift the camera based on the player's speed and angle in all other states
            default:
                // -- Only shift the camera if the y-shake timer is not active
                if (camYShakeTimer == 0)
                {
                    //camYShift = inch(camYShift, ((camTarget.ySpeed) * 5) + lengthdir_y(camTarget.xSpeed * 8, floor(angle)), 9); // *5, *9
                    camYShift = inch(camYShift, floor(((camTarget.y - camTarget.yprevious)/global.deltaMultiplier) * 5), 6); // *5, *9
                }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Shift to the target position

    if (camLagTimer > 0 || instance_exists(camTarget) == false) exit;

    if (camTarget != objPlayer)
    {
        // -- Shift to the target position
        x = floor(lerp(x, camTarget.x + camXShift, 0.2));
        y = floor(lerp(y, camTarget.y + camYShift, 0.1));
    }
    // -- Follow the player
    else
    {
        if (camTarget.action != ActionDead)
        {
            // -- Shift to the player position
            // -- I could just have used lerp
            x = floor(lerp(x, camTarget.x + camXShift, 0.2));
            y = floor(lerp(y, camTarget.y + camYShift, 0.2)); //0.16
        }
    }

    x = clamp(x, camBorderLeft + ScreenWidthHalf, camBorderRight + ScreenWidthHalf);
    y = clamp(y, camBorderTop + ScreenHeightHalf, camBorderBottom - ScreenHeightHalf);
