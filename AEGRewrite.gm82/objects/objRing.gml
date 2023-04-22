#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation speed and attration

    image_index = global.gameTime div 80;

    playerNear = instance_nearest(x, y, objPlayer);

    if ((distance_to_object(playerNear) < 45 && playerNear.boost == true /*&& (playerNear.x > x + 20|| playerNear.x < x - 20 && sign(playerNear.x - x) == -1)*/ || distance_to_object(playerNear) < 64 && playerNear.shield == shieldElectricity))
    {
        instance_change(objRingMagnetic, 1)
    }
