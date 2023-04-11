#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0;

    xSpeed = 0;         // -- Horizontal speed
    ySpeed = 0;         // -- Vertical speed
    yAcc = 0.1863;      // -- Gravity
    dropTimer = 120;    // -- Amount of time that the ring can live
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Bounce

    image_index = global.gameTime div 50;

    x += xSpeed;
    y += ySpeed;

    // -- Gravity
    if (place_meeting(x, y, parSolid)) == false
    {
        ySpeed += yAcc;
    }

    // -- Bounce if collided with a wall
    var widt, heig;
    widt = sprite_get_width(sprite_index) div 2;
    heig = sprite_get_height(sprite_index) div 2;

    // -- Left/Right
    if (place_meeting(x - widt, y - heig, parSolid) && xSpeed <= 0 || place_meeting(x + widt, y - heig, parSolid) && xSpeed >= 0)
    {
        xSpeed  = -xSpeed;
        xSpeed *= 0.99;
    }

    // -- Up/Bottom
    if (place_meeting(x, y, parSolid) && ySpeed <= 0 || place_meeting(x, y, parSolid) && ySpeed >= 0)
    {
        ySpeed  = -ySpeed;
        ySpeed *= 0.99;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Destroy

    // -- Destroy if the ring has faded
    if (image_alpha <= 0)
    {
        instance_destroy();
    }

    // -- Decrease timer
    dropTimer -= 1;

    // -- Start fading
    if (dropTimer <= 10)
    {
        image_alpha -= 0.05;
    }
