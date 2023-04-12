#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
action_inherited();
//Variables


    turnTimer     = 15;           //How long it takes to turn
    turnTimerTemp = turnTimer;    //Keep the original value on track
    action        = "NORMAL";
    nearPlayer    = 0;            //Checks if the player is near of the enemy

    delay = 0;

    enemyBust     = true;

    enemyHP       = noone;
    enemyHPMax    = noone;

    image_speed = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset timer

    turnTimer = turnTimerTemp;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Start chasing the player

    action = "CHASE";
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Movement

    // -- Detects collisions with solids and applies basic movement
    event_inherited();

    switch (action)
    {
        case "NORMAL":
            // -- Walk at normal speed
            xSpeed = 1.6 * image_xscale;

            // -- Check if the player is in front of the enemy
            if (distance_to_object(objPlayer) < 100 && distance_to_object(objEnemyTurn) > 8)
            {
                if (image_xscale = sign(objPlayer.x - x))
                {
                    // -- Player was spotted
                    action = "SPOTTED";
                }
            }
        break;

        case "SPOTTED":
            // -- Slow down the enemy's speed when in the spotted state
            xSpeed = lerp(xSpeed, 0, 0.12);            
            // -- Play warning sound and spotted effect.          
            if (alarm[1] == -1)
            {
                alarm[1] = 15;
                scrPlaySound("sndEnemyWarn", global.volumeSounds, 1, false);
                scrDummyEffectCreate(x - 10 * image_xscale, y - 25, sprVFXEnemyWarn, 0.25, 0, 1, bm_normal, 1, 1,1, 0);
            }
        break;
        
        
        case "CHASE":
            // -- Set the enemy's speed when in the chase state.
            playerID = instance_nearest(x, y, objPlayer);
            xSpeed = 4 * image_xscale;

            // -- If the player is too far away or too close to the enemy's turn sensor, switch to the normal state.
            if (distance_to_object(objPlayer) > 130 || distance_to_object(objEnemyTurn) < 8)
            {
                action = "NORMAL";
            }
        break;
    }

    // -- Decrease the turn delay timer
    delay = max(delay - 1, 0)
    // -- Check if the enemy is coliding the turn sensor
    if (place_meeting(x, y, objEnemyTurn) && action == "NORMAL" && delay == 0)
    {        
        // -- If the turn timer is not expired, pause the enemy's movement
        if (turnTimer > 0)
        {
            turnTimer -= 1;
            xSpeed = 0;
        }
        else
        {
            // -- Otherwise, switch to the turn state and reset the turn timer
            if (alarm[0] == -1)
            {
                action = "TURN";
                image_index = 0;
            }
        }
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animations

    switch (action)
    {
        case "NORMAL":
            if (xSpeed == 0)
            {
                // -- Idle animation
                sprite_index = sprEnemyEggpawn1Idle;
                image_speed = 0.2;
            }
            else
            {
                // -- Walk animation
                sprite_index = sprEnemyEggpawn1Walk;
                image_speed = max(0.15, 0.15 + abs(xSpeed)/12);
            }
        break;

        case "CHASE":
            // -- Run animation
            sprite_index = sprEnemyEggpawn1Run;
            image_speed = max(0.3, 0.3 + abs(xSpeed)/12);
        break;

        case "TURN":
            // -- Turn animation
            sprite_index = sprEnemyEggpawn1Turn;
            image_speed = 0.2;
        break;
    }

    // -- Direction
    if (xSpeed > 0)
    {
        image_xscale = 1;
    }
    else if (xSpeed < 0)
    {
        image_xscale = -1;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Handle invincibility

    if (enemyBlinkTimer > 0)
    {
        enemyBlinkTimer -= 1;
    }
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Back to the normal action

    if (action == "TURN")
    {
        image_xscale = -image_xscale;
        action       = "NORMAL";
        delay        = 90;
        if (alarm[0] == -1)
        {
            alarm[0] = 30;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    event_inherited()
