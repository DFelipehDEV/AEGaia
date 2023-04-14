#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    active = false;
    speedval = 4.131999

    image_speed = 0.1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Create results


    instance_create(0, 0, objFadeGoal)
    sound_stop_all();
    scrPlaySound("sndGoalRingFinish", global.volumeSounds, 1, false)
    instance_create(x, y, objVFXRainbow)

    alarm[1] = 60;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Goal ring

    if (active == true )
    {
        if alarm[0] = -1
        {
            speedval -= 0.032
            image_speed = speedval

            objPlayer.keyRight = true;
            if (image_speed < 0)
            {
                image_speed = 0
                alarm[0] = 80
            }
        }
        if (image_speed <= 0)
        {
            image_index = inch(image_index, 0, 0.1);
        }
    }
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Activate

    if (active == false)
    {
        scrPlaySound("sndGoalRingSpin", global.volumeSounds, 1, false)
        active = true;

        with (other)
        {
            allowKeys = false;
            keyRight = true;
            action = actionNormal;
        }

        objCamera.camTarget = id;
        objCamera.camXShift = 0;
        objCamera.camYShift = 0;
    }
