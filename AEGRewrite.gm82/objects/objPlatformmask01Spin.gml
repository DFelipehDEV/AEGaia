#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    ySpeed = 0;
    xSpeed = 0;
    chainLength = 110;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Move

    x += xSpeed;
    y += ySpeed;

    direction += 2;
    xSpeed = dcos(direction)*4
    ySpeed = -dsin(direction)*4


    // -- Move the player to our position
    var playerID;
    playerID = instance_place(x, y - 5, objPlayer);
    if (playerID != noone)
    {
        if (playerID.ySpeed >= 0 && playerID.ground == true)
        {
            playerID.x += x - xprevious;
            playerID.y = bbox_top - 12;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    // Draw the chain
    var chainPosX, chainPosY;
    chainPosX = xstart;
    chainPosY = ystart - 128;
    var i;
    for (i = 0; i < chainLength; i += sprite_get_width(sprRing))
    {
        var x_pos, y_pos;
        x_pos = (chainPosX) + lengthdir_x(i, point_direction(chainPosX, chainPosY, x, y));
        y_pos = (chainPosY) + lengthdir_y(i, point_direction(chainPosX, chainPosY, x, y));

        draw_sprite(sprVFXRingSparkle3, current_time div 60, x_pos, y_pos);
    }

// Draw the platform object
draw_self();
