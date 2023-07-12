#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    bridgeLogs      = image_xscale; // -- Number of logs wich the bridge has
    bridgeLogWidth  = 24;
    bridgeWidth     = bridgeLogs*bridgeLogWidth;
    bridgeWidthHalf = bridgeWidth / 2;      // -- Half the width of the bridge (GASP)
    bridgeTension   = 14;                   // -- Max tension (height) possible

    // -- Create logs
    for (i=0; i < bridgeLogs; i+=1)
    {
        heights[i] = 0;
        logs[i]    = instance_create(x + i*bridgeLogWidth, y, objBridgeLog);
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Log management

    // -- Set all logs heights to 0
    for (i=0; i<bridgeLogs; i+=1) heights[i] = 0;

    // -- Find out the logs height depending on the player objects
    if (collision_rectangle(x, y - 16, x + bridgeWidth, y + bridgeTension * 0.8, objPlayer, true, false))
    {
        var _playerPosition;
        _playerPosition = round(objPlayer.x/bridgeLogWidth)*bridgeLogWidth;

        // -- Find tension point and calculate left and right and their gradients
        bridgeTensionNum  = min(max(floor((_playerPosition - x)/bridgeLogWidth),0),bridgeLogs-1);
        leftGrad  = scrSafeDivision(pi*0.5, bridgeTensionNum);
        rightGrad = scrSafeDivision(pi*0.5, bridgeLogs - bridgeTensionNum)
        left           = 0;
        right          = pi;

        // -- Calculate distance from center
        distanceHalfWidth = bridgeTension * (1-(abs(floor(_playerPosition - x-bridgeWidthHalf)/bridgeWidthHalf)));

        // -- Reposition all bridge logs
        for (j=0; j <= bridgeTensionNum; j+=1)
        {
            heightsCurrent = sin(left)*distanceHalfWidth;
            if (heights[j] < heightsCurrent) heights[j] = heightsCurrent;

            left           += leftGrad;
        }
        for (j=bridgeLogs-1; j>bridgeTensionNum; j-=1)
        {
            heightsCurrent = sin(right)*distanceHalfWidth;
            if (heights[j] < heightsCurrent) heights[j] = heightsCurrent;

            right          -= rightGrad;
        }
    }

    // -- Now, change bridge's height
    for (i=0; i<bridgeLogs; i+=1)
    {
        if (instance_exists(logs[i]))
        {
            logs[i].y = lerp(logs[i].y, y+heights[i], 0.2);
        }
    }
