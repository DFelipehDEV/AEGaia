#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Inputs

    inputs = true;

    inputLeft                 = 0
    inputRight                = 0
    inputUp                   = 0
    inputDown                 = 0
    inputAction               = 0
    inputSpecial1             = 0
    inputSpecial2             = 0
    inputSpecial3             = 0

    inputLeftPressed          = 0
    inputRightPressed         = 0
    inputUpPressed            = 0
    inputDownPressed          = 0
    inputActionPressed        = 0
    inputSpecial1Pressed      = 0
    inputSpecial2Pressed      = 0
    inputSpecial3Pressed      = 0

    inputLeftReleased         = 0
    inputRightReleased        = 0
    inputUpReleased           = 0
    inputDownReleased         = 0
    inputActionReleased       = 0
    inputSpecial1Released     = 0
    inputSpecial2Released     = 0
    inputSpecial3Released     = 0

    joystick_set_deadzone(0.9);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Inputs

    if (inputs == false) exit;

    inputLeft = keyboard_check(vk_left) || joystick_axis(0, 0) < 0
    inputRight = keyboard_check(vk_right) || joystick_axis(0, 0) > 0
    inputUp = keyboard_check(vk_up) || joystick_axis(0, 1) < 0
    inputDown = keyboard_check(vk_down) || joystick_axis(0, 1) > 0 || joystick_check_button(0, 1);
    inputAction = keyboard_check(ord("A")) || joystick_check_button(0, 0);
    inputSpecial1 = keyboard_check(ord("S")) || joystick_check_button(0, 2);
    inputSpecial2 = keyboard_check(ord("D")) || joystick_check_button(0, 1);
    inputSpecial3 = keyboard_check(ord("F")) || joystick_check_button(0, 3);

    inputLeftPressed = keyboard_check_pressed(vk_left);
    inputRightPressed = keyboard_check_pressed(vk_right);
    inputUpPressed = keyboard_check_pressed(vk_up);
    inputDownPressed = keyboard_check_pressed(vk_down);
    inputActionPressed = keyboard_check_pressed(ord("A")) || joystick_check_button_pressed(0, 0);
    inputSpecial1Pressed = keyboard_check_pressed(ord("S")) || joystick_check_button_pressed(0, 2);
    inputSpecial2Pressed = keyboard_check_pressed(ord("D")) || joystick_check_button_pressed(0, 1);
    inputSpecial3Pressed = keyboard_check_pressed(ord("F")) || joystick_check_button_pressed(0, 3);

    inputLeftReleased = keyboard_check_released(vk_left);
    inputRightReleased = keyboard_check_released(vk_right);
    inputUpReleased = keyboard_check_released(vk_up);
    inputDownReleased = keyboard_check_released(vk_down);
    inputActionReleased = keyboard_check_released(ord("A")) || joystick_check_button_released(0, 0);
    inputSpecial1Released = keyboard_check_released(ord("S")) || joystick_check_button_released(0, 1);
    inputSpecial2Released = keyboard_check_released(ord("D")) || joystick_check_button_released(0, 2);
    inputSpecial3Released = keyboard_check_released(ord("F")) || joystick_check_button_released(0, 3);

    // -- Disable inputs
    if (inputLeft == true && inputRight == true)
    {
        inputLeft = false;
        inputRight = false;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Activate debug mode

    if (keyboard_check_pressed(vk_caps))
    {
        if (DEBUG == 1 && global.debug == 0)
        {
            global.debug = 1;
            global.debugIsAThing = 1;
            scrPlaySound("sndRing", global.volumeSounds, 1, false);
            instance_create(0, 0, objControllerDebug);
        }
    }
