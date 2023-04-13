#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation

    image_speed = 0.35;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Position, angle and destroy

    // -- Shift to the player position
    x = floor(playerID.x);
    y = floor(playerID.y);

    // -- Rotate
    image_angle = playerID.animationAngle;

    // -- Check if the player has other shield
    if (playerID.shield != shieldElectricity)
    {
        instance_destroy();
    }

    // -- Depth
    if (floor(image_index) mod 2 == 0)
    {
        depth = -2;
    }
    else
    {
        depth = 1;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw shield

    if (playerID.invincibility == invincibilityNoone)
    {
        draw_set_blend_mode(bm_add);
        draw_self();
        draw_set_blend_mode(bm_normal);
    }
