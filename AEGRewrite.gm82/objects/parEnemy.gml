#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    enemyBust       = false;    // -- Flag that checks whether the enemy will be thrown after defeated or not

    enemyHP         = noone;   // -- Current HP of the enemy (no HP if set to noone)
    enemyHPMax      = enemyHP; // -- Maximum HP of the enemy

    enemyBlinkTimer = 0;       // -- Timer for enemy "invincibility" after losing HP

    xSpeed          = 0;       // -- Current horizontal speed of the object
    ySpeed          = 0;       // -- Current vertical speed of the object

    allowX          = true;    // -- Flag that allows/disallows horizontal movement
    allowY          = true;    // -- Flag that allows/disallows vertical movement
    ceiling         = false;   // -- Flag that checks whether the object has collided with a ceiling
    ground          = false;   // -- Flag that checks whether the object has collided with the ground

    wallLeft        = noone;   // -- ID of the object the object has collided with on the left side
    wallRight       = noone;   // -- ID of the object the object has collided with on the right side
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Realtime collision

    scrCollisionMovementBasic();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Invincibility

    if (enemyBlinkTimer > 0)
    {
        enemyBlinkTimer -= 1;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw enemy and HP

    // -- If the enemy is blinking or not, draw it
    if (enemyBlinkTimer > 0 && (global.gameTime div 60) mod 3 || enemyBlinkTimer == 0)
    {
        // -- Draw enemy
        draw_self();
    }

    // -- Draw HP bar
    if (enemyHP != noone)
    {
        draw_healthbar(x, y - 20, x + enemyHPMax * 6, y - 18, (enemyHP / enemyHPMax) * 100, c_dkgray, c_red, c_lime, 0, true, true);
    }
