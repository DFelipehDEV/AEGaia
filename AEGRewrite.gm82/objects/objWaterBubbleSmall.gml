#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Movement

    vspeed = scrApproach(vspeed, -0.9, 0.17);

    if (scrViewIn(id) == false)
    {
        instance_destroy();
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw bubble

    draw_set_blend_mode(bm_add)
    draw_sprite(sprite_index, global.gameTime/30, x + dcos(global.gameTime/3)*5, y);
    draw_set_blend_mode(bm_normal)
