/// scrDrawSpriteTiledPart(sprite, left, top, width, height, x, y, x sep, y sep);

    var spriteXStart, spriteXEnd, spriteXCurrent, spriteXStep;
    var spriteYStart, spriteYEnd, spriteYCurrent, spriteYStep;

    // Retrieve background properties
    spriteXStep  = argument3+argument7;
    spriteXStart = view_xview[view_current]+((argument5-view_xview[view_current]) mod spriteXStep)-spriteXStep;
    spriteXEnd   = view_xview[view_current]+view_wview[view_current]+spriteXStep;
    spriteYStep  = argument4+argument8;
    spriteYStart = view_yview[view_current]+((argument6-view_yview[view_current]) mod spriteYStep)-spriteYStep;
    spriteYEnd   = view_yview[view_current]+view_hview[view_current]+spriteYStep;

    for (spriteYCurrent = spriteYStart; spriteYCurrent <= spriteYEnd; spriteYCurrent += spriteYStep)
     for (spriteXCurrent = spriteXStart; spriteXCurrent <= spriteXEnd; spriteXCurrent += spriteXStep)
            draw_sprite_part(argument0, image_index, argument1, argument2, argument3, argument4, spriteXCurrent, spriteYCurrent);
