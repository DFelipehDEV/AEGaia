#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    timer = 0;
    // -- Background
    backX = 0;
    backY = 0;
    backSpeed = 6;
    backOffset = 20;
    backOffsetV = 20;
    outlineScale = 0;
    gaiaAlpha = 0;

    sonicScale = 0;


    // -- Foreground
    logoY = screenHeight + 200;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Movement

    timer += 1;
    backOffset = inch(backOffset, backOffsetV, 3);

    if (timer mod 30 == 7)
    {
        backOffsetV = random_range(20, 30);
    }

    backX = lerp(backX, dcos(current_time/backSpeed)*backOffset, 0.02)
    backY = lerp(backY, dsin(current_time/backSpeed)*backOffset, 0.02);

    logoY = lerp(logoY, screenHeight/1.9, 0.1)

    if (timer > 10)
    {
        outlineScale = lerp(outlineScale, 0.6, 0.2);
    }

    if (timer == 20)
    {
        scrPlaySound("sndResultsScoreTotal", global.volumeSounds, 1, false)
    }

    if (timer > 40)
    {
        gaiaAlpha = lerp(gaiaAlpha, 1, 0.1);
        sonicScale = lerp(sonicScale, 0.6, 0.15)
    }

    if (timer == 220)
    {
        with(instance_create(0, 0, objFadeNext))
        {
            color = c_white;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    // -- Sonic
    draw_sprite_ext(sprAstralLogo, 3, screenWidthMid, 70, sonicScale, sonicScale, dcos(current_time/14)*18, c_white, 1);

    // -- Outline
    draw_sprite_ext(sprAstralLogo, 1, screenWidthMid, logoY - dsin(current_time/9)*6, outlineScale, outlineScale, 0, c_white, 1);

    // -- Gaia text
    draw_sprite_ext(sprAstralLogo, 2, screenWidthMid, logoY - dsin(current_time/9)*6, outlineScale, outlineScale, 0, c_white, gaiaAlpha);

    // -- Logo
    draw_sprite_ext(sprAstralLogo, 0, screenWidthMid, logoY - dsin(current_time/9)*6, 0.6, 0.6, 0, c_white, 1);
