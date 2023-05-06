#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

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

    signPlayerX = sign(playerNear.x - x);
    signPlayerY = sign(playerNear.y - y);

    movX = (sign(hspeed) == signPlayerX);
    movY = (sign(vspeed) == signPlayerY);

    hspeed += attractAcc[movX] * signPlayerX;
    vspeed += attractAcc[movY] * signPlayerY;
