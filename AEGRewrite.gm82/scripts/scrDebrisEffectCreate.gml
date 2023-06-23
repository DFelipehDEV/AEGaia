/// scrDebrisEffectCreate(x, y, depth, sprite, frame, animSpeed, xscale, yscale, rotate, hspeed, vspeed, gravity)
 // -- Creates a debris effect

    with (instance_create_depth(argument0, argument1, argument2, objDestructiveWall))
    {
        sprite_index = argument3;
        image_index = argument4;
        image_speed = argument5;
        image_xscale = argument6;
        image_yscale = argument7;
        rotate = argument8;

        hspeed = argument9;
        vspeed = argument10;
        gravity = argument11;
    }
