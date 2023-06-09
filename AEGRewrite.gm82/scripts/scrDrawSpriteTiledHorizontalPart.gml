/// scrDrawSpriteTiledHorizontalPart(sprite, frame, left, top, width, height, x, y, separation)

    var spriteStart, spriteEnd, spriteWidth;

    // Retrieve sprite properties
    spriteWidth = argument4;
    spriteStart = view_xview[view_current] + ((argument6 - view_xview[view_current]) mod (argument4 + argument8)) - (argument4 + argument8);
    spriteEnd = view_xview[view_current] + view_wview[view_current] + (argument4 + argument8);

    // Draw the sprite
    draw_sprite_ext(argument0, argument1, argument6, argument7, 1, 1, 0, c_white, 1);

    // Draw additional copies of the sprite
    var i;
    for (i = spriteStart; i < spriteEnd; i += (argument4 + argument8))
    {
        draw_sprite_ext(argument0, argument1, argument2 + i, argument7, 1, 1, 0, c_white, 1);
    }
