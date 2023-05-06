#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0.17;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Movement

    vspeed = inch(vspeed, -0.9, 0.17);

    if (image_index > 7)
    {
        image_index = 5;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Pop

    if (place_meeting(x, y - 22, objWater) == false)
    {
        instance_destroy();
    }
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Air

    with (other)
    {
        xSpeed = 0;
        ySpeed = 0;
        underwaterAir = 600;
        underwaterDrownFrame = 0;
    }
    scrPlaySound("sndPlayerBreathe", global.volumeSounds, 1, false);
    instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw bubble

    draw_set_blend_mode(bm_add)
    draw_sprite(sprite_index, image_index, x + dcos(global.gameTime/5)*4, y);
    draw_set_blend_mode(bm_normal)
