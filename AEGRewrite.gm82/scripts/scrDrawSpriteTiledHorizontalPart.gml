var spriteStart, spriteEnd, spriteCurrent, spriteStep, spriteWidth;

// Retrieve sprite properties
spriteWidth = sprite_get_width(argument0);
spriteStep = argument4 + argument8;
spriteStart = view_xview[view_current]+((argument6-view_xview[view_current]) mod spriteStep)-spriteStep;
spriteEnd = view_xview[view_current]+view_wview[view_current]+spriteStep;
var i;
for (i = spriteStart; i < spriteEnd; i += spriteStep)
{
    draw_sprite_part(argument0, argument1, argument2, argument3, argument4, argument5, i, argument7);
}
