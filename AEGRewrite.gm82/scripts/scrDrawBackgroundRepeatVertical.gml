/// scrDrawBackgroundRepeatVertical(bg, x, y, xscale, yscale, ySeparation, height)

    var bgHeight, spriteStep, spriteStart, spriteEnd;
    bgHeight = argument6;
    spriteStep = argument5 + bgHeight;
    spriteStart = view_yview[view_current] + ((argument2 - view_yview[view_current]) mod spriteStep) - bgHeight;
    spriteEnd = view_yview[view_current] + view_hview[view_current] + bgHeight;
    var i;
    for (i = spriteStart; i < spriteEnd; i += spriteStep)
    {
        draw_background_ext(argument0, argument1, i, argument3, argument4, 0, c_white, 1);
    }
