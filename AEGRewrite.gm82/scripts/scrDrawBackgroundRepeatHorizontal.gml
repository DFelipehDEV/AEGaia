/// scrDrawBackgroundRepeatHorizontal(bg, x, y, xscale, yscale, xSeperation, width)

    var bgWidth, spriteStep, spriteStart, spriteEnd;
    bgWidth = argument6;
    spriteStep = argument5 + bgWidth;
    spriteStart = view_xview[view_current] + ((argument1 - view_xview[view_current]) mod spriteStep) - bgWidth;
    spriteEnd = view_xview[view_current] + view_wview[view_current] + bgWidth;
    var i;
    for (i = spriteStart; i < spriteEnd; i += spriteStep)
    {
        draw_background_ext(argument0, i, argument2, argument3, argument4, 0, c_white, 1);
    }
