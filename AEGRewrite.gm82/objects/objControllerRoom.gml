#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    global.roomTime = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Center window

    window_center();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Timer

    global.roomTime += 1;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset timer

    global.roomTime = 0;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Resize

    // -- Set to the minimum size if the window is too big
    if (global.screenSize >= 4 || global.screenSize != 3 && window_get_fullscreen())
    {
        global.screenSize = 1;
        window_set_fullscreen(false);
    }

    window_set_size(screenWidth * global.screenSize, screenHeight * global.screenSize);
    window_set_region_size(screenWidth, screenHeight, 1);

    // -- Fullscreen
    if (global.screenSize == 3)
    {
        window_set_size(screenWidth, screenHeight);
        window_set_fullscreen(true);
        //window_set_fullscreen_ext(true);
    }

    // -- Center window
    alarm[0] = 2;
#define KeyPress_115
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Change resolution

    global.screenSize += 1;
    event_user(0);
