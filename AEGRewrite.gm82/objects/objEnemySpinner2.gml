#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables and animation speed

    event_inherited();
    enemyBust     = false;  // -- Check if the enemy "busts" or not

    allowX          = 0;       // -- Flag to allow x movement
    allowY          = 0;       // -- Flag to allow y movement


    image_speed   = 0.5;    // -- Animation speed

    shockTimer = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description Insert description here
// -- You can write your code in this editor


    sound_stop("sndEnemySpinnerShockActive")
    sound_stop("sndEnemySpinnerShockCharge")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Shock

    if (scrViewIn(id))
    {
        shockTimer += 1;
        if (shockTimer == 70)
        {
            scrPlaySound("sndEnemySpinnerShockCharge", global.volumeSounds, 1, false)
        }


        if (shockTimer == 120)
        {
            sound_stop("sndEnemySpinnerShockCharge")
            scrPlaySound("sndEnemySpinnerShockActive", global.volumeSounds, 1, false)
            shockTimer = 0
            instance_create_depth(x, y, -1, objSpinnerShock);
            y = ystart;
        }


        if (shockTimer == 35 && sound_isplaying("sndEnemySpinnerShockActive"))
        {
            sound_stop("sndEnemySpinnerShockActive")
        }
    }

    scrEnemyInvincibility();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw spinner

    if (enemyBlinkTimer > 0 && (global.gameTime div 60) mod 3 || enemyBlinkTimer == 0)
    {
        // -- Draw enemy
        draw_sprite_ext(sprite_index, image_index, x, y - dsin(global.gameTime div 10)*4, image_xscale, image_yscale, dcos(global.gameTime/8)*12, image_blend, image_alpha);
    }

    // -- Draw HP bar
    if (enemyHP != noone)
    {
        draw_healthbar(x, y - 20, x + enemyHPMax * 6, y - 18, (enemyHP / enemyHPMax) * 100, c_dkgray, c_red, c_lime, 0, true, true);
    }
