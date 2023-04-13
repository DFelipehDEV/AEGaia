#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description  Create player

    if (global.playerCheckX == 0 && global.playerCheckY == 0)
    {
        instance_create(x, y - 10, objPlayer);
    }
    else
    {
        instance_create(global.playerCheckX, global.playerCheckY - 28, objPlayer);
    }
