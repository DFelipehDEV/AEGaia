#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    attract = false;      //Ring attraction by the player
    attractAcc[0] = 0.85;
    attractAcc[1] = 0.2875;

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

    // -- Check if the ring is being attracted
    if (attract == true)
    {
        signPlayerX = sign(playerNear.x - x);
        signPlayerY = sign(playerNear.y - y);

        movX = (sign(hspeed) == signPlayerX);
        movY = (sign(vspeed) == signPlayerY);

        hspeed += attractAcc[movX] * signPlayerX;
        vspeed += attractAcc[movY] * signPlayerY;
    }

    if (attract == false && (distance_to_object(playerNear) < 45 && playerNear.boost == true /*&& (playerNear.x > x + 20|| playerNear.x < x - 20 && sign(playerNear.x - x) == -1)*/ || distance_to_object(playerNear) < 64 && playerNear.shield == shieldElectricity))
    {
        attract = true;
    }



/* */
/*  */
