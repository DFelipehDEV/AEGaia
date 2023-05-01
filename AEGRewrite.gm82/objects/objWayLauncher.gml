#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description  Variables

    image_speed = 0;
    dir         = "";          // -- Direction of the launcher
    timerExit   = 0;         // -- How long it takes to exit of the launcher
    radius = 3;
    thickness = 10;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Launch


    // -- Check if is colliding with the player
    if (objPlayer.action == actionWayLauncher && place_meeting(x, y, objPlayer) == true)
    {
        if (timerExit < 140)
        {
            timerExit += 1;
        }
        else
        {
            with (objPlayer)
            {
                action  = actionHurt;
                scrAnimationApply("HURT_FALL");
                visible = true;
            }
            sound_stop("sndWayLauncherWait");
            scrPlaySound("sndWayLauncherLaunch", global.volumeSounds, 0.85, false);
        }
        //Up Direction
        if (objPlayer.keyUp == true && objPlayer.keyDown == false && objPlayer.keyLeft == false && objPlayer.keyRight == false)
        {
            if (sprite_index != sprWayLauncherUp)
            {
                sprite_index = sprWayLauncherUp;
                image_index  = 0;
                scrPlaySound("sndWayLauncherChangeDir", global.volumeSounds, 1, false);
            }


            //Animation
            if (image_index < sprite_get_number(sprite_index) - 1)
            {
                image_index += 0.35;
            }


            //Launch
            if (floor(image_index) == 3)
            {
                image_speed = 0;
                if (objPlayer.keyActionPressed == true)
                {
                    with (objPlayer)
                    {
                        action = actionSpring;
                        ySpeed = -9.5;
                        visible = true;
                        starTimer = 50;

                        sound_stop("sndWayLauncherWait");
                        scrPlaySound("sndTrick", global.volumeSounds, 1, false);
                        scrPlaySound("sndWayLauncherLaunch", global.volumeSounds, 1, false);
                    }
                }
            }
        }

        //Down Direction
        if (objPlayer.keyDown == true && objPlayer.keyUp == false && objPlayer.keyLeft == false && objPlayer.keyRight == false)
        {
            if (sprite_index != sprWayLauncherDown)
            {
                sprite_index = sprWayLauncherDown;
                image_index = 0;
                scrPlaySound("sndWayLauncherChangeDir", global.volumeSounds, 1, false);
            }


            //Animation
            if (image_index < sprite_get_number(sprite_index) - 1)
            {
                image_index += 0.35;
            }


            //Launch
            if (floor(image_index) == 3)
            {
                image_speed = 0;
                if (objPlayer.keyActionPressed == true)
                {
                    with (objPlayer)
                    {
                        action = actionNormal;
                        ySpeed = 9.5;
                        visible = true;
                        starTimer = 50;

                        sound_stop("sndWayLauncherWait");
                        scrPlaySound("sndTrick", global.volumeSounds, 1, false);
                        scrPlaySound("sndWayLauncherLaunch", global.volumeSounds, 1, false);
                    }
                }
            }
        }

        //Left Direction
        if (objPlayer.keyLeft == true && objPlayer.keyUp == false && objPlayer.keyDown == false && objPlayer.keyRight == false)
        {
            if (sprite_index != sprWayLauncherLeft)
            {
                sprite_index = sprWayLauncherLeft;
                image_index  = 0;
                scrPlaySound("sndWayLauncherChangeDir", global.volumeSounds, 1, false);
            }


            //Animation
            if (image_index < sprite_get_number(sprite_index) - 1)
            {
                image_index += 0.35;
            }


            //Launch
            if (floor(image_index) == 3)
            {
                image_speed = 0;
                if (objPlayer.keyActionPressed == true)
                {
                    with (objPlayer)
                    {
                        action             = actionNormal;
                        animationDirection = -1;
                        animationIndex     = "LAUNCH";
                        yStuckTimer        = 16;
                        xSpeed             = -9;
                        visible = true;
                        starTimer = 50;

                        sound_stop("sndWayLauncherWait");
                        scrPlaySound("sndTrick", global.volumeSounds, 1, false);
                        scrPlaySound("sndWayLauncherLaunch", global.volumeSounds, 1, false);
                    }
                }
            }
        }

        //Right Direction
        if (objPlayer.keyRight == true && objPlayer.keyUp == false && objPlayer.keyLeft == false && objPlayer.keyDown == false)
        {
            if sprite_index != sprWayLauncherRight
            {
                sprite_index = sprWayLauncherRight;
                image_index  = 0;
                scrPlaySound("sndWayLauncherChangeDir", global.volumeSounds, 1, false);
            }


            //Animation
            if (image_index < sprite_get_number(sprite_index) - 1)
            {
                image_index += 0.35;
            }


            //Launch
            if (floor(image_index) == 3)
            {
                image_speed = 0;
                if (objPlayer.keyActionPressed == true)
                {
                    with (objPlayer)
                    {
                        action             = actionNormal;
                        animationDirection = 1;
                        animationIndex     = "LAUNCH";
                        yStuckTimer        = 16;
                        xSpeed             = 9;
                        visible        = true;
                        starTimer = 50;

                        sound_stop("sndWayLauncherWait");
                        scrPlaySound("sndTrick", global.volumeSounds, 1, false);
                        scrPlaySound("sndWayLauncherLaunch", global.volumeSounds, 1, false);
                    }
                }
            }
        }
    }
    else
    {
        if (timerExit > 0)
        {
            timerExit -= 2;
        }
    }

    // -- Cancel Directions
    //Check if it has released the specific direction key
    if (objPlayer.keyDown == false && objPlayer.keyUp == false && objPlayer.keyLeft == false && objPlayer.keyRight == false
    && (sprite_index == sprWayLauncherUp || sprite_index == sprWayLauncherDown || sprite_index == sprWayLauncherLeft || sprite_index == sprWayLauncherRight)
    || objPlayer.action != actionWayLauncher)
    {
        if (floor(image_index) == 0)
        {
            sprite_index = sprWayLauncher;
        }
        else
        {
            image_index -= 0.4;
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw launcher

    // -- Draw timer
    draw_circle_color(x - 1, y - 1, 13, c_gray, c_gray, 0);
    /// scrDrawCircularBar(x,y,radius,thickness,maxsegments,segments,startangle,totalangle,direction,colour)
    // scrDrawCircularBar(x, y, value, max, colour, radius, transparency, width)
    scrDrawCircularBar(x, y, radius, thickness, 40, 40 - timerExit*0.285, 0, 360, 1, c_aqua);

    // -- Draw launcher
    draw_self();

    draw_sprite_ext(sprWayLauncher, 1, x, y, image_xscale, image_yscale, round((image_angle + timerExit*4)/8)*8, image_blend, image_alpha);
