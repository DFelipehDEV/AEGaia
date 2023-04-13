/// scrDrawSpriteTiledVerticalPart(sprite, frame, left, top, width, height, x, y);

    var spriteStart, spriteEnd, spriteCurrent, spriteStep;

    // Retrieve sprite properties
    spriteStep  = argument5 + argument8; //sprite_get_height(argument0);
    spriteStart = view_yview+((argument7-view_yview) mod spriteStep)-spriteStep;
    spriteEnd   = view_yview+view_hview+spriteStep;

    repeat((spriteEnd - spriteStart)/spriteStep)
    {
        draw_sprite_part(argument0, argument1, argument2, argument3, argument4, argument5, argument6, spriteStart);
        spriteStart += spriteStep;
    }
