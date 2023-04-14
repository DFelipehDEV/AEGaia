/// scrDrawBackgroundRepeatHorizontal(bg, x, y, xscale, yscale, xSeperation)

    var bgWidth;
    bgWidth = background_get_width(argument0)
    var i;
    for (i = 0; i < (view_xview[view_current]+view_wview[view_current]+bgWidth+argument5)*bgWidth; i += bgWidth+argument5)
    {
        draw_background_ext(argument0, argument1 + i, argument2, argument3, argument4, 0, c_white, 1)
    }
