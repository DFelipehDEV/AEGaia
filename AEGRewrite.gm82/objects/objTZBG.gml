#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Parallax

    event_inherited()
    shiftApproach = 0.88;
    image_speed = 0.1;

    // -- Space
    scrParallaxAddNode(ParallaxBGHorizontal, bgTZBG2, 1, 0.1, 0, 0, 0, shiftApproach, 0, 0, -69, 0, 0, 0, 512, 288);

    // -- Earth
    scrParallaxAddNode(ParallaxBGHorizontal, bgTZBG1, 1, 0.1, 0, 0, 0, shiftApproach, 0, 0, 111, 0, 0, 0, 240, 64);

    // -- Metal walls
    scrParallaxAddNode(ParallaxSpriteHorizontal, sprTZBG1, 0.94, 0, 0, 0, 0, shiftApproach, 0, 0, 175, 0, 0, 0, 512, 328);
