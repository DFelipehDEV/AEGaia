#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    scale = 5;

    creationTimer = 0;

    angle[0] = 0;
    angle[1] = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation

    if (instance_exists(target))
    {
        x = lerp(x, target.x, 0.4);
        y = lerp(y, target.y, 0.4);
    }
    creationTimer = min(creationTimer + 1, 20);
    scale = scrEasings(creationTimer, 5, -4, 20, "easeOutBack");

    if (creationTimer == 4)
    {
        scrPlaySound("sndLockOn", global.volumeSounds, 1, false);
    }
    if (creationTimer > 15)
    {
        angle[0] += 1;
        angle[1] += 4;
    }


    if (objPlayer.homingPossible = false || distance_to_object(objPlayer) > 210 || objPlayer.y > y + 5|| distance_to_object(objPlayer) < 4 || objPlayer.ground == true)
    {
        instance_destroy();
    }
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw target

    draw_sprite_ext(sprite_index, 0, x, y, scale, scale, angle[0], image_blend, image_alpha);
    draw_sprite_ext(sprite_index, 1, x, y, scale, scale, angle[1], image_blend, image_alpha);
