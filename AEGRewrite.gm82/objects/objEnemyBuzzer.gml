#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    event_inherited();
    turnTimer     = 20;           //How long it takes to turn
    turnTimerTemp = turnTimer;    //Keep the original value on track
    action        = actionNormal;
    nearPlayer    = 0;            //Checks if the player is near of the enemy

    enemyBust     = true;

    enemyHP       = noone;
    enemyHPMax    = noone;


    shootTimer    = 80;
    allowX        = 1;       //Flag to allow x movement
    allowY        = 0;       //Flag to allow y movement
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
/// -- Start following the player

    nearPlayer = true;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Shoot

    // -- Release projectile
    if (action == actionNormal)
    {
        xSpeed     = 0;

        shootTimer = 80;

        var playerID;
        playerID = instance_nearest(x, y, objPlayer);
        // -- Create projectile
        proj        = instance_create(x + 9 * image_xscale, y + 9, objProjectileBuzzer);
        proj.hspeed = 5 * dcos(point_direction(x, y, playerID.x, playerID.y));
        proj.vspeed = -5 * dsin(point_direction(x, y, playerID.x, playerID.y));

        scrPlaySound("sndShot", global.volumeSounds, 1, false);
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Movement


    if (sprite_index != sprEnemyBuzzerAttack)
    {
        event_inherited();
    }

    if (action == actionNormal && place_meeting(x, y, objEnemyTurn) == false && global.player == true)
    {
        playerID = instance_nearest(x, y, objPlayer);
        xSpeed     = 2 * image_xscale;

        // -- Trigger shot
        if (distance_to_object(playerID) < 235 && sign(playerID.x - x) == image_xscale)
        {
            if (shootTimer > 0)
            {
                shootTimer -= 1;
            }
            else
            {
                if (alarm[2] == -1 && nearPlayer == true)
                {
                    alarm[2] = 20;
                }
            }

            // -- Warn enemy
            if (nearPlayer == false)
            {
                nearPlayer = true;
                scrPlaySound("sndEnemyWarn", global.volumeSounds, 1, false);
                scrDummyEffectCreate(x - 15 * image_xscale, y - 20, sprVFXEnemyWarn, 0.2, 0, 1, bm_normal, 1, 1, 1, 0);
            }
        }
        else
        {
            nearPlayer = false;
        }
    }

    // -- Turn
    // -- Check if the enemy is coliding the turn sensor
    if (place_meeting(x, y, objEnemyTurn) && action == actionNormal)
    {
        // -- Turn
        if (turnTimer > 0)
        {
            turnTimer -= 1;
            xSpeed     = 0;
        }
        else
        {
            if (alarm[0] == -1)
            {
                action    = actionTurn;
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

    // -- Direction
    if (xSpeed > 0)
    {
        image_xscale = 1;
    }

    if (xSpeed < 0)
    {
        image_xscale = -1;
    }

    // -- Animations
    // -- Move animation
    if (action == actionNormal)
    {
        sprite_index = sprEnemyBuzzerMove;
        image_speed  = 0.32;
    }


    // -- Attack animation
    if (action == actionNormal && alarm[2] < 30 && alarm[2] > 0)
    {
        sprite_index = sprEnemyBuzzerAttack;
        image_speed  = 0.15;
    }


    // -- Turn animation
    if (action == actionTurn)
    {
        sprite_index = sprEnemyBuzzerTurn;
        image_speed  = 0.25;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Handle invincibility

    scrEnemyInvincibility();
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Back to the normal action


    if (action == actionTurn)
    {
        image_xscale = -image_xscale;
        action       = actionNormal;
        xSpeed       = 2.2 * image_xscale;
        if (alarm[0] == -1)
        {
            alarm[0]     = 15;
        }
    }
