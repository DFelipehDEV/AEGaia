#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main variables

    // -- Actions
    action = 0;

    // -- Jump
    jumpStrength = -6.5;        // -- Jump strength
    jumpAirTimer = 0;           // -- Amount of time the player can stay in air while jumping
    jumpDouble = 0;             // -- Check if the player has double jumped

    // -- Skid
    skidDec = 0.3;              // -- Skid deceleration
    skidSpeed = 4;              // -- Minimum speed that the player can skid

    // -- Slide
    slideDec = 0.11;            // -- Slide deceleration
    slideResetTimer = 35;       // -- How long it takes to back to normal action if the player is not holding the slide key

    // -- Spindash
    spindashStrength = 0;
    spindashStrengthMax = 8;

    // -- Roll
    rollDec = 0.05;             // -- Roll deceleration
    rollDecLight = 0.04;        // -- Roll deceleration while holding the forward direction
    rollDecFric = 0.07;         // -- Roll deceleration while holding the opposite direction
    rollDecSlopeUp = 0.08;      // -- Roll deceleration while going up a slope
    rollDecSlopeDown = 0.2;     // -- Roll deceleration while going down a slope

    // -- Boost
    boost = 0;                  // -- Checks if is boosting or not
    boostPossible = 1;          // -- Checks if is possible to boost
    boostSpeed = 11.2;          // -- Speed when the player starts boosting
    boostAir = 0;

    // -- Energy
    energyAmount = 87;          // -- Energy amount
    energyAmountMax = 87;       // -- Energy amount max

    // -- Airdash
    airdash = 1;                // -- Checks if the player can air dash
    airdashTimer = 22;          // -- How long it takes to back to the normal action
    airdashTimerCommon = 22;    // -- Keep the timer on track

    // -- Homing attack
    homingSpeed = 12;           // -- Speed while homing
    homingDistance = 200;       // -- Max distance that the player can homing attack
    homingPossible = false;
    homingTimer = 0;

    // -- Trick timer
    trickTimer = 15;            // -- Delay after doing a trick
    trickCombo = 0;             // -- Amount of tricks that the player did

    // -- Dead
    deadTimer = 103;

    // -- Horizontal speed (if you want to change the top or/and max speed values, change in the begin step physics code)
    xSpeed = 0;                 // -- Current horizontal speed
    xSpeedTop = 0;              // -- Horizontal speed while moving on flat ground
    xSpeedMax = 0;              // -- Horizontal speed limit
    xAcc = 0;                   // -- Horizontal acceleration
    xAccTemp = 0;
    xDec = 0;                   // -- Horizontal deceleration
    xSlopeFactor = 0.14;        // -- Horizontal momentum while moving up a slope
    xDecTemp = 0;               // -- Temporary horizontal deceleration
    xFricTemp = 0;              // -- Temporary Horizontal friction

    // -- Vertical speed
    ySpeed = 0;                 // -- Current vertical speed
    yAcc = 0.21;                // -- Gravity
    yAccCommon = yAcc;          // -- Keep the default gravity value on track
    yStuckTimer = 0;            // -- This keeps the player in the same y axis until it reaches into 0

    // -- Terrain
    ground = false;             // -- Checks whether the player is on the ground or not
    terrainType = "";            // -- Type of terrain the player is landed
    terrainSound[terFootstep1] = "sndPlayerFootstepStone1"; // -- Footstep sound depending on the terrain
    terrainSound[terFootstep2] = "sndPlayerFootstepStone2"; // -- Footstep sound depending on the terrain
    terrainSound[terLand] = "scrPlayerLand"; // -- Land sound effect on a certain terrain
    terrainSound[terSkid] = "sndPlayerSkidStone"; // -- Land sound effect on a certain terrain
    terrainPlatform = 0;
    footstep = 0;               // -- Checks if the footstep sound can play
    angle = 0;                  // -- Current player angle
    angleRelative = 0;          // -- Current player angle relative to the gravity angle
    angleHolder = 0;
    layerIndex = 0;             // -- Current terrain layer
    boundariesNear = 0;         // -- Checks if the player is near of the camera boundaries or the room limits



    // -- Camera
    yLookTimer = 0;


    // -- Interaction
    physicMode = 0;             // -- 0 - Normal physics   1 - Underwater physics
    underwaterDrownFrame = 0;   // -- Frame index to drown timer
    underwaterAir = 600;        // -- Time to be able to breath underwater
    invincibility = 0;          // -- Checks whether the player is invincible or not
    invincibilityTimer = 0;     // -- Size in frames of how long the invincibility remains
    shield = 0;                 // -- Check which shield the player has
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Input variables

    /*if (instance_exists(objControllerTitleCard))
    {
        allowKeys = 0;  // -- If can control the character or not
    }
    else
    {
        allowKeys = 1;  // -- If can control the character or not
    }*/
    allowKeys = 1;

    allowKeyTimer = 0;

    keyLeft                 = 0;
    keyRight                = 0;
    keyUp                   = 0;
    keyDown                 = 0;
    keyAction               = 0;
    keySpecial1             = 0;
    keySpecial2             = 0;
    keySpecial3             = 0;

    keyLeftPressed          = 0;
    keyRightPressed         = 0;
    keyUpPressed            = 0;
    keyDownPressed          = 0;
    keyActionPressed        = 0;
    keySpecial1Pressed      = 0;
    keySpecial2Pressed      = 0;
    keySpecial3Pressed      = 0;

    keyLeftReleased         = 0;
    keyRightReleased        = 0;
    keyUpReleased           = 0;
    keyDownReleased         = 0;
    keyActionReleased       = 0;
    keySpecial1Released     = 0;
    keySpecial2Released     = 0;
    keySpecial3Released     = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation variables

    scrAnimationInit();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Misc

    // -- Camera
    cam = instance_create(x, y, objCamera);

    // -- Sensor position
    scrPlayerSensorPosUpdate();

    // -- Sonic physics
    scrPlayerPhysicsSonic();

    // -- Voicelines
    scrPlayerVoicelines("SONIC");

    // -- Trail
    trailAlpha = 0;
    trailTimer = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Create dust effect

    scrDummyEffectCreate(x, y, sprVFXDust1, 0.3, 0, -1, bm_normal, 1, 1, 1, animationAngle);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Death handle

    if (action == actionDead)
    {
        y         += ySpeed;
        ySpeed    += 0.18;
        global.playerRings = 0;
        // -- Decrease restart time
        if (deadTimer > 0)
        {
            deadTimer -= 1;
        }
        else
        {
            room_restart();
        }
    }

    if (action == actionDead) exit;

    // -- Die if the player is on the room bottom
    if (y >= room_height)
    {
        xSpeed = 0;
        ySpeed = -6;
        ground = false;
        action = actionDead;
        scrAnimationApply("DEAD");

        //objControllerMusic.fadeOut = true;
        scrPlaySound("sndPlayerHurt", global.volumeSounds, 1, false);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main movement

    x   +=  (cos(degtorad(angle)) * xSpeed) * global.deltaMultiplier;
    y   -=  (sin(degtorad(angle)) * xSpeed) * global.deltaMultiplier;

    var repFactor;
    repFactor = 1;

    if (abs(xSpeed) > 9)
    {
        repFactor = round(abs(xSpeed)/9)
    }

    repeat (repFactor)
    {
        while (xSpeed > 0 && scrPlayerCollisionRight(x, y, angle, maskMid) == true)
        {
            x   -=  cos(degtorad(angle));
            y   +=  sin(degtorad(angle));
        }

        while (xSpeed < 0 && scrPlayerCollisionLeft(x, y, angle, maskMid) == true)
        {
            x   +=  cos(degtorad(angle));
            y   -=  sin(degtorad(angle));
        }

        // -- Slopes
        if (ground == true)
        {
            if (scrPlayerCollisionMain(x, y))
            {
                do
                {
                    x   -=  sin(degtorad(angle));
                    y   -=  cos(degtorad(angle));
                }
                until(!scrPlayerCollisionMain(x, y))
            }

            if (scrPlayerCollisionSlope(x, y, angle, maskMid) && scrPlayerCollisionMain(x, y) == false)
            {
                do
                {
                    x   +=  sin(degtorad(angle));
                    y   +=  cos(degtorad(angle));
                }until(scrPlayerCollisionMain(x, y))
            }


            // -- Fall if there is not enough speed.
            if (angle >= 75 && angle <= 285 && abs(xSpeed) < 4)
            {
                if (action != actionGrind)
                {
                    ySpeed =   -sin(degtorad(angle))*xSpeed;
                    xSpeed =   cos(degtorad(angle))*xSpeed;
                    ground =   false;
                }
            }

            // -- Fall off the ground if the edges aren't colliding
            if (angle != global.playerAngleGravity && (scrPlayerCollisionLeftEdge(x, y, angle) == false || scrPlayerCollisionRightEdge(x, y, angle) == false))
            {
                ySpeed =   -sin(degtorad(angleRelative))*xSpeed;
                xSpeed =   cos(degtorad(angleRelative))*xSpeed;
                ground =   false;
            } 
            
            // -- Get new angle
            if (scrPlayerCollisionLeftEdge(x, y, angle) && scrPlayerCollisionRightEdge(x, y, angle))
            {
                // -- Store the new angle
                angleHolder   =   scrPlayerAngleGet(x, y, angle);
            
                // -- Smooth angle
                if (abs(angle - angleHolder)<45)
                {
                    angle += (angleHolder-angle)*0.5;
                }
                else 
                {
                    angle = angleHolder;
                }
            }  
            else
            {
                scrPlayerAngleSet(global.playerAngleGravity);
            }                                      
        }
    }                    

    // -- Vertical movement        
    if (ground == false)
    {           
        angle = 0;           
        y += ySpeed * global.deltaMultiplier;
            
        // -- Ceiling
        if (ySpeed < 0 && scrPlayerCollisionTop(x, y, global.playerAngleGravity, maskBig))
        {
            if (scrPlayerCollisionLeftEdge(x, y, 180) && scrPlayerCollisionRightEdge(x, y, 180))
            {
                scrPlayerAngleSet(scrPlayerAngleGet(x, y, 180))
                                       
                if (angle < 140 || angle > 220)
                {
                    xSpeed =   -sin(degtorad(angle)) * (ySpeed*1.5);
                    ySpeed =    0;     
                    ground =   true;               
                }
                // -- Reset angle
                else
                {
                    scrPlayerAngleSet(global.playerAngleGravity);
                }
            }
        }

        
        
        // -- Move the player outside in case he has got stuck into the floor or the ceiling           
        while (ySpeed < 0 && scrPlayerCollisionTop(x, y, global.playerAngleGravity, maskMid))
        {
            y   +=  1;
        }            
        while (ySpeed > 0 && scrPlayerCollisionBottom(x, y, global.playerAngleGravity, maskMid))
        {
            y   -=  1;
        }
            

        // -- Wall collision (yeah, again, we should perform that since the y axys has recently changed)
        while (scrPlayerCollisionRight(x, y, angle, maskMid) == true)
        {
            x   -=  cos(degtorad(angle));
            y   +=  sin(degtorad(angle));
        }
        
        while (scrPlayerCollisionLeft(x, y, angle, maskMid) == true)
        {
            x   +=  cos(degtorad(angle));
            y   -=  sin(degtorad(angle));
        }
    }
 
    // -- Get new angle
    if (scrPlayerCollisionLeftEdge(x, y, angle) == true && scrPlayerCollisionRightEdge(x, y, angle) == true && ground == true)
    {   
        scrPlayerAngleSet(scrPlayerAngleGet(x, y, angle));
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Horizontal movement


    // -- Accelerations/Deceleration
    if (ground == true || action == actionCorkscrew)
    {
        xAccTemp  = xAcc * global.deltaMultiplier;
        xDecTemp  = xDec * global.deltaMultiplier;
        xFricTemp = (xDec * 1.7) * global.deltaMultiplier;
    }else
    {
        xAccTemp  = (xAcc * 1.2) * global.deltaMultiplier;
        xDecTemp  = 0;
        xFricTemp = 0;
    }

    // -- Only allow normal control while in these actions
    if (action == actionNormal || action == actionTurn || action == actionJump || action == actionSpring || action == actionCorkscrew || action == actionSkydive
    || action == actionBoostAir || action == actionWallrun)
    {
        // -- Acceleration
        // -- Accelerate to the left
        if (keyLeft == true && keyRight == false)
        {
            if xSpeed > -xSpeedTop
            {
                xSpeed -= xAccTemp;
            }


            // -- Friction
            if xSpeed > 0
            {
                xSpeed -= xFricTemp;
            }
        }
        // -- Accelerate to the right
        else
        if (keyRight == true && keyLeft == false)
        {
            if xSpeed < xSpeedTop
            {
                xSpeed += xAccTemp;
            }


            // -- Friction
            if xSpeed < 0
            {
                xSpeed += xFricTemp;
            }
        }
        // -- Decelerate when you are not pressing the right or left key
        else
        {
            if xSpeed < 0
            {
                xSpeed += xDecTemp;

                // -- Set to 0 when we stop
                if xSpeed > 0
                {
                    xSpeed = 0;
                }
            }

            if xSpeed > 0
            {
                xSpeed -= xDecTemp;

                // -- Set to 0 when we stop
                if xSpeed < 0
                {
                    xSpeed = 0;
                }
            }
        }
    }


    // -- Limit speed
    if (abs(xSpeed) > xSpeedMax)
    {
        xSpeed -= (xDecTemp * 2) * sign(xSpeed);
    }

    if (action != actionRoll)
    {
        // -- Deceleration on slopes
        if (ground == true && angleRelative > 35 && angleRelative < 325)
        {
            if (angleRelative > 40 && angleRelative < 320)
            {
                xSpeed -= sin(degtorad(angleRelative)) * xSlopeFactor;
            }
        }
    }


    // -- Stop when meet a wall/slide pass and isnt sliding
    if (xSpeed > 0 && (scrPlayerCollisionRight(x, y, angle, maskBig))|| xSpeed > 0 && scrPlayerCollisionObjectRight(x, y, angle, maskBig, objSlidepassSensor) && action != actionSlide && action != actionRoll)
    {
       xSpeed = 0;
    }
    if (xSpeed < 0 && (scrPlayerCollisionLeft(x, y, angle, maskBig)) || xSpeed < 0 && scrPlayerCollisionObjectLeft(x, y, angle, maskBig, objSlidepassSensor) && action != actionSlide && action != actionRoll)
    {
       xSpeed = 0;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Vertical Movement

    // -- Land
    if (ground == true)
    {
        // -- Back to the normal action while doing those actions and the player landed
        if (action == actionJump || action == actionSpring || action == actionSkydive || action == actionBoostAir)
        {
            action        = actionCrouchReset;
            scrAnimationApply("CROUCH_RESET");

        }

        // -- Leave the ground
        if (scrPlayerCollisionBottom(x, y, angle, maskBig) == false)
        {
            ground = false;
            scrPlayerAngleSet(global.playerAngleGravity);
        }
    }
    else
    {
        // -- Add gravity
        if (yStuckTimer == 0 && action != actionSkydive && action != actionCorkscrew && action != actionAirdash
        && action != actionHoming && action != actionWayLauncher)
        {
            ySpeed += yAcc * global.deltaMultiplier;
        }

        // -- Land
        if (ySpeed >= 0 && (scrPlayerCollisionBottom(x, y, global.playerAngleGravity, maskBig)))
        {
            if (scrPlayerCollisionLeftEdge(x, y, global.playerAngleGravity) && scrPlayerCollisionRightEdge(x, y, global.playerAngleGravity))
            {
                angle   =   scrPlayerAngleGet(x, y, global.playerAngleGravity);
            }
            xSpeed       -= sin(degtorad(angle)) * ySpeed;
            // -- Play landing sound effect
            if (abs(ySpeed) > 2)
            {
                scrPlaySound(terrainSound[terLand], global.volumeSounds, 1, false);
            }
            ySpeed        = 0;
            ground        = true;
        }

        // -- Check if we're on the air but we collided with the ceiling
        if (ySpeed < 0 && scrPlayerCollisionTop(x, y, global.playerAngleGravity, maskBig))
        {
            ySpeed = 0;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Actions

    // -- "Read" actions
    switch(action)
    {
        // -- Normal
        case actionNormal:
            scrPlayerActionNormal();
        break;

        // -- Spring
        case actionSpring:
            scrPlayerActionSpring();
        break;

        // -- Turn
        case actionTurn:
            scrPlayerActionTurn();
        break;

        // -- Jump!
        case actionJump:
            scrPlayerActionJump();
        break;

        // -- Air dash
        case actionAirdash:
            scrPlayerActionAirdash();
        break;

        // -- Roll!
        case actionRoll:
            scrPlayerActionRoll();
        break;

        // -- Crouch!
        case actionCrouch:
            scrPlayerActionCrouch();
        break;

        // -- Look up!
        case actionLookUp:
            scrPlayerActionLookup();
        break;

        // -- Spindash!
        case actionSpindash:
            scrPlayerActionSpindash();
        break;

        // -- Skid!
        case actionSkid:
            scrPlayerActionSkid();
        break;

        // -- Homing attack!
        case actionHoming:
            scrPlayerActionHomingAttack();
        break;

        // -- Walljump
        case actionWalljump:
            scrPlayerActionWalljump();
        break;

        // -- Grind!
        case actionGrind:
            scrPlayerActionGrind();
        break;

        // -- Slide!
        case actionSlide:
            scrPlayerActionSlide();
        break;

        // -- Stomp!
        case actionStomp:
            scrPlayerActionStomp();
        break;

        // -- Stomp land!
        case actionStompLand:
            scrPlayerActionStompLand();
        break;

        // -- Corkscrew!
        case actionCorkscrew:
            scrPlayerActionCorkscrew();
        break;

        // -- Lightspeed dash!
        case actionLightspeed:
            scrPlayerActionLightspeed();
        break;

        // -- Tricks!
        case actionTricks:
            scrPlayerActionTricks();
        break;

        // -- QTEKeys!
        case actionQTEKeys:
            scrPlayerActionQTEKeys()
        break;

        // -- Hurt!
        case actionHurt:
            scrPlayerActionHurt();
        break;
    }

    // -- Trigger actions
    scrPlayerActionTrigger();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Object handle
 // -- Handle collisions with objects


    // -- Layers
    scrPlayerHandleLayers();

    // -- Rings
    scrPlayerHandleRings();

    // -- Enemies
    scrPlayerHandleEnemy();

    // -- Projectiles
    scrPlayerHandleProjectile();

    // -- Checkpoint
    scrPlayerHandleCheckpoint();

    // -- Balloons
    scrPlayerHandleBalloons();

    // -- Springs
    scrPlayerHandleSprings();


    // -- Spikes
    scrPlayerHandleSpikes();


    // -- Dash (Pads, rings and ramps)
    scrPlayerHandleDash();

/*
    // -- Rails
    scrPlayerHandleRails();


    // -- Way launcher
    scrPlayerHandleWayLauncher();


    // -- Water
    scrPlayerHandleWater();


    // -- Fling ramp
    scrPlayerHandleFling();


    // -- Gimmicks
    scrPlayerHandleGimmicks();


    // -- Energy orb
    scrPlayerHandleEnergyOrb();


    // -- Crane
    scrPlayerHandleCrane();

    // -- Walljump
    scrPlayerHandleWallJump();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Invincibility handle


    // -- Decrease invincibility time
    if (invincibility != invincibilityHurt)
    {
        if (invincibilityTimer > 0)
        {
            invincibilityTimer -= 1;
        }
        // -- End invincibility
        else
        {
            if (invincibility == invincibilityMonitor)
            {
                if (instance_exists(objControllerMusic))
                {
                    with (objControllerMusic)
                    {
                        sound_stop(bgmInvincibility);
                        playTempMusic = -1;
                        fadeOut = false;
                        fadeIn = true;
                    }
                }
            }
            invincibility = invincibilityNoone;

        }
    }
    else
    {
        if (action != actionHurt)
        {
            invincibility = invincibilityNoone;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Launch handle

    if (ground == true && (angle >= 10 || angle <= 350) && abs(xSpeed) >= 1)
    {
        // -- Launch into the air
        if (scrPlayerCollisionObjectMain(x, y, objLaunchSensor))
        {
            ySpeed = -sin(degtorad(angle))*xSpeed;
            if (angle > 30 && angle < 150)
            {
                xSpeed = 0;
            }
            else
            {
                xSpeed = cos(degtorad(angle))*xSpeed;
            }
            ground = false;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Energy handle

    energyAmount = clamp(energyAmount, 0, energyAmountMax);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Homing target

    if (instance_exists(parHome) && ground == false)
    {
        if (homingPossible = true && instance_exists(objPlayerTarget) == false)
        {
            var homeenemy;
            homeenemy = instance_nearest(x + animationDirection*2, y + 2, parHome)
            with (instance_create(homeenemy.x, homeenemy.y, objPlayerTarget))
            {
                target = instance_nearest(objPlayer.x + objPlayer.animationDirection*2, objPlayer.y + 2, parHome);
            }
        }
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Keys

    allowKeyTimer = max(allowKeyTimer - 1, 0);
    if (allowKeys == false) exit;
    keyLeft                 = keyboard_check(vk_left)
    keyRight                = keyboard_check(vk_right)
    keyUp                   = keyboard_check(vk_up)
    keyDown                 = keyboard_check(vk_down)
    keyAction               = keyboard_check(ord("A"))
    keySpecial1             = keyboard_check(ord("S"))
    keySpecial2             = keyboard_check(ord("D"))
    keySpecial3             = keyboard_check(ord("F"))

    keyLeftPressed          = keyboard_check_pressed(vk_left)
    keyRightPressed         = keyboard_check_pressed(vk_right)
    keyUpPressed            = keyboard_check_pressed(vk_up)
    keyDownPressed          = keyboard_check_pressed(vk_down)
    keyActionPressed        = keyboard_check_pressed(ord("A"))
    keySpecial1Pressed      = keyboard_check_pressed(ord("S"))
    keySpecial2Pressed      = keyboard_check_pressed(ord("D"))
    keySpecial3Pressed      = keyboard_check_pressed(ord("F"))

    keyLeftReleased         = keyboard_check_released(vk_left)
    keyRightReleased        = keyboard_check_released(vk_right)
    keyUpReleased           = keyboard_check_released(vk_up)
    keyDownReleased         = keyboard_check_released(vk_down)
    keyActionReleased       = keyboard_check_released(ord("A"))
    keySpecial1Released     = keyboard_check_released(ord("S"))
    keySpecial2Released     = keyboard_check_released(ord("D"))
    keySpecial3Released     = keyboard_check_released(ord("F"))

    if (allowKeyTimer > 0)
    {
        keyLeft                 = 0;
        keyRight                = 0;
        keyUp                   = 0;
        keyDown                 = 0;
        keyAction               = 0;
        keySpecial1             = 0;
        keySpecial2             = 0;
        keySpecial3             = 0;

        keyLeftPressed          = 0;
        keyRightPressed         = 0;
        keyUpPressed            = 0;
        keyDownPressed          = 0;
        keyActionPressed        = 0;
        keySpecial1Pressed      = 0;
        keySpecial2Pressed      = 0;
        keySpecial3Pressed      = 0;

        keyLeftReleased         = 0;
        keyRightReleased        = 0;
        keyUpReleased           = 0;
        keyDownReleased         = 0;
        keyActionReleased       = 0;
        keySpecial1Released     = 0;
        keySpecial2Released     = 0;
        keySpecial3Released     = 0;
    }

    // -- Disable keys
    if (keyLeft == true && keyRight == true)
    {
        keyLeft  = false;
        keyRight = false;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Underwater

    if (physicMode == 1)
    {
        underwaterAir -= 1;

        if (underwaterAir mod 100 == 60)
        {
            instance_create(x, y, objWaterBubbleSmall);
        }


        if (underwaterAir < 120)
        {
            underwaterDrownFrame += 0.011;

            if (sound_isplaying("sndPlayerLossingAir") == false && action != actionDead)
            {
                scrPlaySound("sndPlayerLossingAir", global.volumeSounds, 1, false);
            }
            if (underwaterDrownFrame >= 5.9 && sound_isplaying(sndPlayerDrown) == false)
            {
                xSpeed = 0;
                ySpeed = -5;
                ground = false;
                action = actionDead;
                scrAnimationApply("DEAD");
                global.playerRings = 0;

                scrPlaySound("sndPlayerDrown", global.volumeSounds, 1, false);
                scrPlaySound("sndPlayerHurt", global.volumeSounds, 1, false);
                objControllerMusic.fadeOut = true;
            }
        }
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Normal animations and direction
 // -- Handle animations and direction


    // -- Check if the player is not doing any of these actions
    if (action != actionJump && action != actionAirdash && action != actionTurn && animationIndex != "LAUNCH" && animationIndex != "SPRING" && animationIndex != "LAND")
    {
        // -- Change direction to the left while going to the left
        if (xSpeed < 0)
        {
            animationDirection = -1;
        }

        // -- Change direction to the right while going to the right
        if (xSpeed > 0)
        {
            animationDirection = 1;
        }
    }


    // -- Normal action animations
    if (action == actionNormal)
    {
        if (ground == true)
        {
            // -- Idle animation
            if (xSpeed == 0 && animationIndex != "IDLE_WAIT")
            {
                // -- Check if its not been waiting for a long time
                if (animationTime < 300)
                {
                    // -- Idle animation
                    scrAnimationApply("IDLE");
                }
                else
                {
                    // -- Idle waiting animation
                    scrAnimationApply("IDLE_WAIT");
                }
            }


            // -- Walk animation
            if abs(xSpeed) > 0 && abs(xSpeed) < 2.4
            {
                scrAnimationApply("WALK_1");
            }


            // -- Walk 2 animation
            if (abs(xSpeed) >= 2.4 && abs(xSpeed) < 4)
            {
                scrAnimationApply("WALK_2");
            }


            // -- Jog animation
            if (abs(xSpeed) >= 4 && abs(xSpeed) < 6.1)
            {
                scrAnimationApply("JOG_1");
            }


            // -- Jog 2 animation
            if (abs(xSpeed) >= 6.1 && abs(xSpeed) < 10)
            {
                scrAnimationApply("JOG_2");
            }


            // -- Run animation
            if (abs(xSpeed) >= 10)
            {
                scrAnimationApply("RUN");
            }
        }
        else
        {
            if (animationIndex != "HOMED_1" && animationIndex != "HOMED_2" && animationIndex != "FALL" && animationIndex != "LAUNCH" && animationIndex != "FLING")
            {
                // -- Fall animation
                if (abs(ySpeed) >= 0.2)
                {
                    scrAnimationApply("LAND");
                }
            }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation system

    // -- Animation system
    scrAnimationSystem();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation speed and animation angle

    // -- Rotate Sprites
    if (xSpeed == 0 && ground == true
    || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parSolidNoAngle) || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parPlatformNoAngle)
    || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parLayer0NoAngle) || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parLayer1NoAngle)
    || action == actionRoll)
    {
        animationAngle = global.playerAngleGravity;
    }
    else
    {
        if (ground == true)
        {
            // -- Rotate while moving on the ground
            animationAngle = angle;
        }
        // -- Rotate until reaches to the normal angle
        else
        {
            animationAngle = scrAngleTowards(global.playerAngleGravity, animationAngle, 4);
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Stop action sounds


    // -- Stop grinding sound
    if (action != actionGrind && sound_isplaying("sndPlayerGrindContinue") == true)
    {
        sound_stop("sndPlayerGrindContinue");
    }

    // -- Stop sliding sound
    if (action != actionSlide && sound_isplaying("sndPlayerSlide") == true)
    {
        sound_stop("sndPlayerSlide");
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Footsteps


    if (animationIndex == "WALK_1" || animationIndex == "WALK_2" || animationIndex == "JOG_1" || animationIndex == "JOG_2"
    || animationIndex == "RUN" || animationIndex == "WALLRUN_STRAIGHT") && (floor(animationFrame) == 3 || floor(animationFrame) == 7)
    {
        if (footstep == false)
        {
            footstep = true;
            // -- Create water splash if the player is running in the water
            if (terrainType == "WATER" && scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) == true)
            {
                scrDummyEffectCreate(x, y, sprVFXWaterSplash, 0.45, 0, 1, bm_add, 1, animationDirection, 1,  0);
            }

            // -- Create dust effect
            if (terrainType != "WATER" && alarm[0] == -1)
            {
                alarm[0] = 1;
            }

            scrPlaySound(choose(terrainSound[terFootstep1],terrainSound[terFootstep2]), global.volumeSounds, 1, false);
        }
    }
    else
    {
        footstep = false;
    }
/*
    // -- Water terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorWater))
    {
        terrainType      = "WATER";
        terrainSound[terSkid]      = sndPlayerSkidWater;
        terrainSound[terLand]      = sndPlayerLandWater;
        terrainSound[terFootstep1] = sndPlayerFootstepWater2;
        terrainSound[terFootstep2] = sndPlayerFootstepWater2;
    }

    // -- Grass terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorGrass))
    {
        terrainType      = "GRASS";
        terrainSound[terSkid]      = sndPlayerSkidGrass;
        terrainSound[terLand]      = sndPlayerLandGrass;
        terrainSound[terFootstep1] = sndPlayerFootstepGrass1;
        terrainSound[terFootstep2] = sndPlayerFootstepGrass2;
    }

    // -- Dirt terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorDirt))
    {
        terrainType      = "DIRT";
        terrainSound[terSkid]      = sndPlayerSkidDirt;
        terrainSound[terLand]      = sndPlayerLandDirt;
        terrainSound[terFootstep1] = sndPlayerFootstepDirt1;
        terrainSound[terFootstep2] = sndPlayerFootstepDirt2;
    }

    // -- Stone terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorStone))
    {
        terrainType      = "STONE";
        terrainSound[terSkid]      = sndPlayerSkidStone;
        terrainSound[terLand]      = scrPlayerLand;
        terrainSound[terFootstep1] = sndPlayerFootstepStone1;
        terrainSound[terFootstep2] = sndPlayerFootstepStone2;
    }


    // -- Metal terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorMetal))
    {
        terrainType      = "METAL";
        terrainSound[terSkid]      = sndPlayerSkidMetal;
        terrainSound[terLand]      = sndPlayerLandMetal;
        terrainSound[terFootstep1] = sndPlayerFootstepMetal1;
        terrainSound[terFootstep2] = sndPlayerFootstepMetal2;
    }


    // -- Wood terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objFootstepSensorWood))
    {
        terrainType      = "WOOD";
        terrainSound[terSkid]      = sndPlayerSkidWood;
        terrainSound[terLand]      = sndPlayerLandWood;
        terrainSound[terFootstep1] = sndPlayerFootstepWood1;
        terrainSound[terFootstep2] = sndPlayerFootstepWood2;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Effects(Trail, Afterimage, invincibility)


    trailTimer -= 1;
    trailAlpha = lerp(trailAlpha, trailTimer/110, 0.08);
    // -- AfterImage
    if (abs(xSpeed) >= 11 || action == actionTricks || action == actionStomp || action == actionLightspeed || action == actionAirdash || action == actionHoming)
    {
        if (global.gameTime mod 4 == 2)
        {
            instance_create(x, y, objPlayerAfterimage)
        }
    }


    // -- Stars
    if (invincibility == invincibilityMonitor && invincibilityTimer mod 8 == 4)
    {
        var star1;
        star1             = instance_create(xprevious + random_range(-20, 20), yprevious + random_range(-20, 20), objVFXStar1);
        star1.starID      = id;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset action and stuck timer


    if (animationIndex == "CROUCH_RESET" || animationIndex == "LOOK_UP_RESET" || animationIndex == "STOMP_LAND")
    {
        if (animationFinished == true)
        {
            action = actionNormal;
        }
    }


    // -- Decrease y stuck timer
    if (yStuckTimer > 0)
    {
        yStuckTimer -= 1;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw character and debug

    if (physicMode == 1)
    {
        if (underwaterAir < 120 && action != actionDead)
        {
            draw_sprite(sprDrownTimer, underwaterDrownFrame, floor(x) + 16, floor(y) - 12);
        }
    }
    trailAlpha = 1;
    draw_set_blend_mode(bm_add)
    //scrDrawTrail(16, 18, c_blue, 0, 0, trailAlpha);
    draw_set_blend_mode(bm_normal)

    // -- Draw grind effect
    if (action == actionGrind)
    {
        draw_sprite_ext(sprVFXGrind, global.gameTime div 30, floor(x), floor(y), animationDirection, image_yscale, animationAngle, c_white, image_alpha);
    }

    if (invincibility != invincibilityBlink || (invincibility == invincibilityBlink && ((global.gameTime div 60) mod 3)))
    {
        // -- Draw character
        draw_sprite_ext(animationSprite, floor(animationFrame), floor(x), floor(y), animationDirection , image_yscale, animationAngle, image_blend, image_alpha);
    }

    // -- Draw spindash dust
    // -- Normal dust
    if (animationIndex == "SPINDASH")
    {
        draw_sprite_ext(sprVFXSpindashLow, global.gameTime div 40, floor(x), floor(y), animationDirection , image_yscale, animationAngle, c_white, image_alpha);
    }

    // -- Charging dust
    if (animationIndex == "SPINDASH_CHARGE")
    {
        draw_sprite_ext(sprVFXSpindashHigh, global.gameTime div 40, floor(x), floor(y), animationDirection , image_yscale, animationAngle, c_white, image_alpha);
    }

    if (global.debugIsAThing == true)
    {
        draw_sprite_ext(maskEdge, 0, x + sin(degtorad(angle)) * 11, y + cos(degtorad(angle)) * 11, 1, 1, 0, c_white, 0.6);
        draw_sprite_ext(maskBig, 0, x + sin(degtorad(angle)) * sensorBottomDistance, y + cos(degtorad(angle)) * sensorBottomDistance, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(maskBig, 0, x - sin(degtorad(angle)) * sensorTopDistance, y - cos(degtorad(angle)) * sensorTopDistance, image_xscale, image_yscale, 0, c_white, 1);

        draw_sprite_ext(maskBig, 0, x - cos(degtorad(angle)) * sensorLeftDistanceX, y + sin(degtorad(angle)) * sensorLeftDistanceY, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(maskBig, 0, x + cos(degtorad(angle)) * sensorRightDistanceX, y - sin(degtorad(angle)) * sensorRightDistanceY, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(maskHitbox, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(maskMain, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(maskLines, floor(angle), floor(x - cos(degtorad(angle)) * 8 + sin(degtorad(angle)) * sensorLeftDistanceX), floor(y + sin(degtorad(angle)) * 8 + cos(degtorad(angle)) * sensorLeftDistanceY), 1, 1, 0, c_white, 1)
        draw_sprite_ext(maskLines, floor(angle), floor(x + cos(degtorad(angle)) * 8 + sin(degtorad(angle)) * sensorRightDistanceX), floor(y - sin(degtorad(angle)) * 8 + cos(degtorad(angle)) * sensorRightDistanceX), 1, 1, 0, c_white, 1)
    }

    draw_text(bbox_left, bbox_top, string(boost))
