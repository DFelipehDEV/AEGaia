#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    event_inherited();
    xSpeed = 2.2;
    ySpeed = -10;

    enemyBust     = true;

    enemyHP       = noone;
    enemyHPMax    = noone;


    allowX         = 1;             // -- Flag to allow x movement
    allowY         = 1;             // -- Flag to allow y movement
    allowCollision = 0;             // -- Flag to allow collision routines


    image_speed    = 0.3;           // -- Animation speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// --   Movement

    x += xSpeed;
    y += ySpeed;

    ySpeed = inch(ySpeed, 12, 0.45);


    // -- Invert direction
    if (ySpeed > 0 && y >= ystart)
    {
        xSpeed = -xSpeed;
        ySpeed = -ySpeed;
        image_yscale = sign(xSpeed);
    }

    image_angle = point_direction(xprevious, yprevious, x, y);
