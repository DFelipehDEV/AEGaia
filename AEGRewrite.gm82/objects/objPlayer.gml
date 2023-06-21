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

    // -- Skid
    skidDec = 0.3;              // -- Skid deceleration
    skidSpeed = 4;              // -- Minimum speed that the player can skid

    // -- Slide
    slideDec = 0.11;            // -- Slide deceleration
    slideResetTimer = 35;       // -- How long it takes to back to normal action if the player is not holding the slide key

    // -- Spindash
    spindashStrength = 0;
    spindashStrengthMax = 10;

    // -- Roll
    rollDec = 0.05;             // -- Roll deceleration
    rollDecLight = 0.04;        // -- Roll deceleration while holding the forward direction
    rollDecFric = 0.07;         // -- Roll deceleration while holding the opposite direction
    rollDecSlopeUp = 0.06;      // -- Roll deceleration while going up a slope
    rollDecSlopeDown = 0.25;     // -- Roll deceleration while going down a slope

    // -- Boost
    boost = 0;                  // -- Checks if is boosting or not
    boostPossible = 1;          // -- Checks if is possible to boost
    boostSpeed = 11.2;          // -- Speed when the player starts boosting
    boostAir = 0;               // -- Amount of time the player can boost in the air

    // -- Energy
    energyAmount = 87;          // -- Energy amount
    energyAmountMax = 87;       // -- Energy amount max

    // -- Airdash
    airdash = 1;                // -- Checks if the player can air dash
    airdashTimer = 22;          // -- How long it takes to back to the normal action
    airdashTimerCommon = 22;    // -- Keep the timer on track

    // -- Homing attack
    homingSpeed = 12;           // -- Speed while homing
    homingDistance = 220;       // -- Max distance that the player can homing attack
    homingPossible = false;     // -- Weather the player can use homing attack or not
    homingTimer = 0;            // -- Time has passed since the homing attack was triggered

    // -- Trick timer
    trickTimer = 15;            // -- Delay after doing a trick
    trickCombo = 0;             // -- Amount of tricks that the player did

    // -- Dead
    deadTimer = 103;            // -- Time to reset the stage

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
    yStuckTimer = 0;            // -- This keeps the gravity unexistent

    // -- Terrain
    ground = false;             // -- Checks whether the player is on the ground or not
    terrainType = "";            // -- Type of terrain the player is landed
    terrainSound[terFootstep1] = "sndPlayerFootstepStone1"; // -- Footstep sound depending on the terrain
    terrainSound[terFootstep2] = "sndPlayerFootstepStone2"; // -- Footstep sound depending on the terrain
    terrainSound[terLand] = "scrPlayerLand"; // -- Land sound effect on a certain terrain
    terrainSound[terSkid] = "sndPlayerSkidStone"; // -- Land sound effect on a certain terrain
    terrainPlatform = 0;
    terrainPushing = false;     // -- Whether the player is pushing into a wall or not
    footstep = 0;               // -- Checks if the footstep sound can play
    angle = 0;                  // -- Current player angle
    angleHolder = 0;
    angleCos = 0;
    angleSin = 0;
    layerIndex = 0;             // -- Current terrain layer

    // -- Interaction
    physicMode = 0;             // -- 0 - Normal physics   1 - Underwater physics
    underwaterDrownFrame = 0;   // -- Frame index to drown timer
    underwaterAir = 600;        // -- Time to be able to breath underwater
    invincibility = 0;          // -- Checks whether the player is invincible or not
    invincibilityTimer = 0;     // -- Size in frames of how long the invincibility remains
    shield = 0;                 // -- Check which shield the player has
    goal = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Input variables

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
    trailx = ds_list_create()
    traily = ds_list_create()
    trailal= ds_list_create()
    trailLength = 19;
    trailTimer = 0;
    trailColor = make_color_rgb(25,100,255);
    trailAlpha = 0;

    // -- Stars
    starTimer = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Create dust effect

    scrDummyEffectCreate(x, y, sprVFXDust1, 0.3, 0, -1, bm_normal, 1, 1, 1, animationAngle);
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset player speed

    xSpeed = 0;
    ySpeed = 0;
    alarm[1] = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Death handle

    if (action == actionDead) exit;

    // -- Die if the player is on the room bottom
    if (y >= room_height)
    {
        ground = false;
        scrAnimationApply("DEAD");
        scrAnimationUpdate()
        action = actionDead;

        objControllerMusic.fadeOut = true;
        scrPlaySound("sndPlayerHurt", global.volumeSounds, 1, false);

        with (instance_create(x, y, objPlayerDead))
        {
            sprite_index = other.animationSprite;
            image_speed = other.animationFrameSpeed;
            animationFrameLoop = other.animationFrameLoop;
        }
        x = 0;
        y = 0;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main movement

    scrPlayerAngleLocals();

    x += (angleCos * xSpeed) * global.deltaMultiplier;
    y -= (angleSin * xSpeed) * global.deltaMultiplier;

    repFactor = 1;

    if (abs(xSpeed) > 11)
    {
        repFactor = round(abs(xSpeed)/9)
    }

    if (xSpeed > 0)
    {
        while (scrPlayerCollisionRight(x, y, angle, maskMid) == true)
        {
            x -= angleCos;
            y += angleSin;
        }
    }

    if (xSpeed < 0)
    {
        while (scrPlayerCollisionLeft(x, y, angle, maskMid) == true)
        {
            x += angleCos;
            y -= angleSin;
        }
    }

    // -- Check if the player is on the ground
    if (ground == true)
    {
        repeat (repFactor)
        {
            if (scrPlayerCollisionMain(x, y) && scrPlayerCollisionLeftEdge(x, y, angle) && scrPlayerCollisionRightEdge(x, y, angle))
            {
                while (scrPlayerCollisionMain(x, y))
                {
                    x -= angleSin;
                    y -= angleCos;
                }
            }

            if (scrPlayerCollisionSlope(x, y, angle, maskMid) && !scrPlayerCollisionMain(x, y))
            {
                while(!scrPlayerCollisionMain(x, y))
                {
                    x += angleSin;
                    y += angleCos;
                }
            }
        }

        // -- Fall if there is not enough speed.
        if (angle >= 75 && angle <= 285 && abs(xSpeed) < 4)
        {
            if (action != actionGrind)
            {
                ySpeed = -angleSin*xSpeed;
                xSpeed = angleCos*xSpeed;
                ground = false;
                scrPlayerAngleSet(0);
            }
        }

        // -- Fall off the ground if the edges aren't colliding
        if (angle != 0 && (scrPlayerCollisionLeftEdge(x, y, angle) == false || scrPlayerCollisionRightEdge(x, y, angle) == false))
        {
            ySpeed = -angleSin*xSpeed;
            xSpeed = angleCos*xSpeed;
            ground = false;
            scrPlayerAngleSet(0);
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
                scrPlayerAngleSet(angleHolder);
            }
        }  
        else
        {
            scrPlayerAngleSet(0);
        }                                      
    }                   

    // -- Vertical movement        
    if (ground == false)
    {                   
        y += ySpeed * global.deltaMultiplier;
            
        // -- Ceiling
        if (ySpeed < 0 && scrPlayerCollisionTop(x, y, 0, maskBig))
        {
            if (scrPlayerCollisionLeftEdge(x, y, 180) && scrPlayerCollisionRightEdge(x, y, 180))
            {
                scrPlayerAngleSet(scrPlayerAngleGet(x, y, 180))
                                       
                if (angle < 140 || angle > 220)
                {
                    xSpeed = -angleSin * (ySpeed*1.5);
                    ySpeed = 0;     
                    ground = true;               
                }
                // -- Reset angle
                else
                {
                    scrPlayerAngleSet(0);
                }
            }
        }
                
        // -- Move the player outside in case he has got stuck into the floor or the ceiling           
        while (ySpeed < 0 && scrPlayerCollisionTop(x, y, 0, maskMid))
        {
            y += 1;
        }            
        while (ySpeed > 0 && scrPlayerCollisionBottom(x, y, 0, maskMid))
        {
            y -= 1;
        }            

        // -- Wall collision (yeah, again, we should perform that since the y axys has recently changed)
        while (scrPlayerCollisionRight(x, y, angle, maskMid) == true)
        {
            x -= angleCos;
            y += angleSin;
        }
        
        while (scrPlayerCollisionLeft(x, y, angle, maskMid) == true)
        {
            x += angleCos;
            y -= angleSin;
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
        xAccTemp = xAcc * global.deltaMultiplier;
        xDecTemp = xDec * global.deltaMultiplier;
        xFricTemp = (xDec * 1.7) * global.deltaMultiplier;
    }else
    {
        xAccTemp  = (xAcc * 1.2) * global.deltaMultiplier;
        xDecTemp  = 0;
        xFricTemp = 0;
    }

    // -- Only allow normal control while in these actions
    switch (action)
    {
        case actionNormal:
        case actionTurn:
        case actionJump:
        case actionSpring:
        case actionCorkscrew:
        case actionSkydive:
        case actionBoostAir:
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
        break;
    }

    // -- Limit speed
    if (abs(xSpeed) > xSpeedMax)
    {
        xSpeed -= (xDecTemp * 1.2) * sign(xSpeed);
    }

    if (action != actionRoll)
    {
        // -- Acceleration and deceleration on slopes
        if (ground == true && angle > 35 && angle < 325)
        {
            if (angle > 40 && angle < 320)
            {
                xSpeed -= angleSin * xSlopeFactor;
            }
        }
    }

    // -- Stop when meet a wall/slide pass and isnt sliding
    if ((xSpeed > 0 && (scrPlayerCollisionRight(x, y, angle, maskBig))) || (xSpeed > 0 && scrPlayerCollisionObjectRight(x, y, angle, maskBig, objSlidepassSensor) && action != actionSlide && action != actionRoll))
    {
       xSpeed = 0;
       terrainPushing = true;
    }
    else if ((xSpeed < 0 && (scrPlayerCollisionLeft(x, y, angle, maskBig))) || (xSpeed < 0 && scrPlayerCollisionObjectLeft(x, y, angle, maskBig, objSlidepassSensor) && action != actionSlide && action != actionRoll))
    {
       xSpeed = 0;
       terrainPushing = true;
    }
    else
    {
        terrainPushing = false;
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
            action = actionNormal;
        }

        // -- Leave the ground
        if (scrPlayerCollisionBottom(x, y, angle, maskBig) == false)
        {
            ground = false;
            scrPlayerAngleSet(0);
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
        if (ySpeed >= 0 && (scrPlayerCollisionBottom(x, y, 0, maskBig)))
        {
            if (scrPlayerCollisionLeftEdge(x, y, 0) && scrPlayerCollisionRightEdge(x, y, 0))
            {
                scrPlayerAngleSet(scrPlayerAngleGet(x, y, angle));
            }

            xSpeed -= angleSin * ySpeed;
            // -- Play landing sound effect
            if (abs(ySpeed) > 2)
            {
                scrPlayerTerrainSndUpdate();
                scrPlaySound(terrainSound[terLand], global.volumeSounds, 1, false);
            }
            ySpeed = 0;
            ground = true;
        }

        // -- Check if we're on the air but we collided with the ceiling
        if (ySpeed < 0 && scrPlayerCollisionTop(x, y, 0, maskBig))
        {
            ySpeed = 0;
        }
    }
    
    // -- Decrease gravity freeze timer
    if (yStuckTimer > 0)
    {
        yStuckTimer -= 1;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Object handle
 // -- Handle collisions with objects

    // -- Launch sensor
    scrPlayerHandleLaunch();

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

    // -- Crane
    scrPlayerHandleCrane();

    // -- Walljump
    scrPlayerHandleWallJump();

    // -- Box
    scrPlayerHandleBox();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Actions

    // -- Execute the appropriate action function based on the current action/state
    switch(action)
    {
        // -- Normal routine
        case actionNormal:
            scrPlayerActionNormal();
        break;

        // -- Spring routine
        case actionSpring:
            scrPlayerActionSpring();
        break;

        // -- Turn routine
        case actionTurn:
            scrPlayerActionTurn();
        break;

        // -- Jump routine
        case actionJump:
            scrPlayerActionJump();
        break;

        // -- Air dash routine
        case actionAirdash:
            scrPlayerActionAirdash();
        break;

        // -- Roll routine
        case actionRoll:
            scrPlayerActionRoll();
        break;

        // -- Crouch routine
        case actionCrouch:
            scrPlayerActionCrouch();
        break;

        // -- Look up routine
        case actionLookUp:
            scrPlayerActionLookup();
        break;

        // -- Spindash routine
        case actionSpindash:
            scrPlayerActionSpindash();
        break;

        // -- Skid routine
        case actionSkid:
            scrPlayerActionSkid();
        break;

        // -- Homing attack routine
        case actionHoming:
            scrPlayerActionHomingAttack();
        break;

        // -- Walljump routine
        case actionWalljump:
            scrPlayerActionWalljump();
        break;

        // -- Grind routine
        case actionGrind:
            scrPlayerActionGrind();
        break;

        // -- Slide routine
        case actionSlide:
            scrPlayerActionSlide();
        break;

        // -- Stomp routine
        case actionStomp:
            scrPlayerActionStomp();
        break;

        // -- Stomp land routine
        case actionStompLand:
            scrPlayerActionStompLand();
        break;

        // -- Corkscrew routine
        case actionCorkscrew:
            scrPlayerActionCorkscrew();
        break;

        // -- Lightspeed dash routine
        case actionLightspeed:
            scrPlayerActionLightspeed();
        break;

        // -- Tricks routine
        case actionTricks:
            scrPlayerActionTricks();
        break;

        // -- QTEKeys routine
        case actionQTEKeys:
            scrPlayerActionQTEKeys();
        break;

        // -- Hurt routine
        case actionHurt:
            scrPlayerActionHurt();
        break;

        // -- Dead routine
        case actionDead:
            scrPlayerActionDead();
        break;
    }

    // -- Trigger actions
    scrPlayerActionTrigger();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Homing target

    if (instance_exists(parHome) && ground == false)
    {
        if (homingPossible == true && instance_exists(objPlayerTarget) == false)
        {
            var homeenemy;
            homeenemy = instance_nearest(x + animationDirection, y + 4, parHome);

            // -- Check if there is no terrain in the trajectory
            if (!collision_line(x, y, homeenemy.x, homeenemy.y, parTerrain, 1, 1))
            {
                // -- Create reticle at the nearest target
                var playerTarget;
                playerTarget = instance_create(homeenemy.x, homeenemy.y, objPlayerTarget)
                playerTarget.target = homeenemy;
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
    keyLeft                 = input.inputLeft;
    keyRight                = input.inputRight;
    keyUp                   = input.inputUp;
    keyDown                 = input.inputDown;
    keyAction               = input.inputAction;
    keySpecial1             = input.inputSpecial1;
    keySpecial2             = input.inputSpecial2;
    keySpecial3             = input.inputSpecial3;

    keyLeftPressed          = input.inputLeftPressed;
    keyRightPressed         = input.inputRightPressed;
    keyUpPressed            = input.inputUpPressed;
    keyDownPressed          = input.inputDownPressed;
    keyActionPressed        = input.inputActionPressed;
    keySpecial1Pressed      = input.inputSpecial1Pressed;
    keySpecial2Pressed      = input.inputSpecial2Pressed;
    keySpecial3Pressed      = input.inputSpecial3Pressed;

    keyLeftReleased         = input.inputLeftReleased;
    keyRightReleased        = input.inputRightReleased;
    keyUpReleased           = input.inputUpReleased;
    keyDownReleased         = input.inputDownReleased;
    keyActionReleased       = input.inputActionReleased;
    keySpecial1Released     = input.inputSpecial1Released;
    keySpecial2Released     = input.inputSpecial2Released;
    keySpecial3Released     = input.inputSpecial3Released;

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

    // -- Check if the player is underwater
    if (physicMode == 1)
    {
        // -- Reduce survive time while underwater
        underwaterAir -= 1;

        // -- Spawn some bubbles
        if (underwaterAir mod 100 == 60)
        {
            instance_create(x, y, objWaterBubbleSmall);
        }

        // -- Check if the player is starting to drown
        if (underwaterAir < 120)
        {
            // -- Animate visual drown counter
            underwaterDrownFrame += 0.009;

            // -- Play sound effect until you drown
            if (!sound_isplaying("sndPlayerLossingAir") && action != actionDead)
            {
                scrPlaySound("sndPlayerLossingAir", global.volumeSounds, 1, false);
            }

            // -- Check if we have drowned
            if (underwaterDrownFrame >= 5.9 && !sound_isplaying("sndPlayerDrown"))
            {
                action = actionDead;
                scrAnimationApply("DEAD");
                global.playerRings = 0;

                scrPlaySound("sndPlayerDrown", global.volumeSounds, 1, false);
                scrPlaySound("sndPlayerHurt", global.volumeSounds, 1, false);
                objControllerMusic.fadeOut = true;
                scrAnimationApply("DEAD");
                scrAnimationUpdate()

                with (instance_create(x, y, objPlayerDead))
                {
                    sprite_index = other.animationSprite;
                    image_speed = other.animationFrameSpeed;
                    animationFrameLoop = other.animationFrameLoop;
                }
                x = 0;
                y = 0;
            }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Goal


    if (goal == true)
    {
        if scrViewIn(id) == false
        {
            if (alarm[1] == -1)
            {
                alarm[1] = 60;
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
    if (action != actionJump && action != actionAirdash && action != actionTurn && animationIndex != "LAUNCH" && animationIndex != "SPRING" && animationIndex != "LANDING")
    {
        // -- Change direction based on the speed direction
        if (sign(xSpeed) != 0)
        {
            animationDirection = sign(xSpeed);
        }
    }

    // -- Normal action animations
    if (action == actionNormal)
    {
        scrPlayerAnimationNormal()
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
/// -- Animation angle

    // -- Rotate Sprites
    if (xSpeed == 0 && ground == true
    || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parSolidNoAngle) || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parPlatformNoAngle)
    || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parLayer0NoAngle) || scrPlayerCollisionObjectBottom(x, y, angle, maskBig, parLayer1NoAngle)
    || action == actionRoll)
    {
        animationAngle = 0;
    }
    else
    {
        if (ground == true)
        {
            // -- Rotate while moving on the ground
            animationAngle = scrAngleTowards(round(angle/8.25)*8.25, animationAngle, 5 + abs(floor(xSpeed))*0.7);
        }
        // -- Rotate until reaches to the normal angle
        else
        {
            animationAngle = scrAngleTowards(0, animationAngle, 4);
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Footsteps

    switch (animationIndex)
    {
        case "WALK_1":
        case "WALK_2":
        case "JOG_1":
        case "JOG_2":
        case "RUN":
            if(floor(animationFrame) == 3 || floor(animationFrame) == 7)
            {
                if (footstep == false)
                {
                    scrPlayerTerrainSndUpdate();
                    // -- Create water splash if the player is running in the water
                    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon))
                    {
                        scrDummyEffectCreate(x, y, sprVFXWaterSplash, 0.45, 0, 1, bm_add, 1, animationDirection, 1, 0);
                    }

                    // -- Create dust effect
                    if (terrainType != "WATER" && alarm[0] == -1)
                    {
                        alarm[0] = 1;
                    }
                    sound_stop(terrainSound[terFootstep1])
                    sound_stop(terrainSound[terFootstep2])
                    scrPlaySound(choose(terrainSound[terFootstep1],terrainSound[terFootstep2]), global.volumeSounds, 1, false);
                    footstep = true;
                }
            }
            else
            {
                footstep = false;
            }
        break;

        default:
            footstep = false;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Effects(Trail, Afterimage, Stars)

    trailTimer -= 1;
    trailAlpha = lerp(trailAlpha, trailTimer/110, 0.08);
    // -- AfterImage
    if abs(xSpeed) >= 11 || abs(ySpeed) >= 11 || action == actionTricks || action == actionLightspeed || action == actionHoming
    {
        if (global.roomTime mod 6 == 1)
        {
            instance_create(x, y, objPlayerAfterimage)
        }
    }

    // -- Trail
    scrTrailUpdate(
    floor(x)+dcos(angle+90)+angleCos*xSpeed,
    floor(y)-dsin(angle+90)+ySpeed-angleSin*xSpeed,
    trailAlpha > 0.1
    )

    starTimer = max(starTimer - 1, 0);
    // -- Stars
    if (starTimer > 0 && starTimer mod 5 == 1)
    {
        scrDummyEffectCreate(x + irandom_range(-25, 25), y + irandom_range(-25, 25), sprVFXStar1, 0.25, 0, choose(1, -2), bm_normal, 1, 1, 1, 0);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Sound managment

    // -- Stop grinding sound
    if (action != actionGrind && sound_isplaying("sndPlayerGrindContinue"))
    {
        sound_stop("sndPlayerGrindContinue");
    }

    // -- Stop sliding sound
    if (action != actionSlide && sound_isplaying("sndPlayerSlide"))
    {
        sound_stop("sndPlayerSlide");
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Invincibility

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
                        sound_stop("bgmInvincibility");
                        playTempMusic = "A";
                    }
                }
                scrMusicSetFade(false);
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
/// -- Shields

    if (shield == shieldElectricity)
    {
        if (physicMode == 1)
        {
            shield = 0;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Attraction

    var nearRing;
    nearRing = instance_nearest(x, y, objRing);

    if ((distance_to_object(nearRing) < 32 && boost == true) || (distance_to_object(nearRing) < 65 && shield == shieldElectricity))
    {
        with (nearRing)
        {
            instance_change(objRingMagnetic, 1)
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw character and debug

    //trailAlpha = 1;
    if (trailAlpha > 0.1)
    {
        draw_set_blend_mode(bm_add)
        draw_set_color(trailColor)
        draw_set_alpha(trailAlpha)
        scrDrawTrail(sprVFXTrail, 20, 1);
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_blend_mode(bm_normal)
    }

    // -- Draw grind effect
    if (action == actionGrind)
    {
        draw_sprite_ext(sprVFXGrind, global.gameTime div 30, floor(x), floor(y), animationDirection, image_yscale, animationAngle, c_white, image_alpha);
    }

    // -- Draw character if the player is not hurt. Blink when hurt
    if (invincibility != invincibilityBlink || (invincibility == invincibilityBlink && ((global.gameTime div 60) mod 3)))
    {
        // -- Draw character
        draw_sprite_ext(animationSprite, floor(animationFrame), floor(x), floor(y), animationDirection , image_yscale, animationAngle, image_blend, image_alpha);
    }

    // -- Spindash normal dust
    if (animationIndex == "SPINDASH")
    {
        draw_sprite_ext(sprVFXSpindashLow, global.gameTime div 40, floor(x), floor(y), animationDirection , image_yscale, animationAngle, c_white, image_alpha);
    }

    // -- Spindash charging dust
    if (animationIndex == "SPINDASH_CHARGE")
    {
        draw_sprite_ext(sprVFXSpindashHigh, global.gameTime div 40, floor(x), floor(y), animationDirection , image_yscale, animationAngle, c_white, image_alpha);
    }

    // -- Check if the player is underwater
    if (physicMode == 1)
    {
        // -- Check if the player is drowning
        if (underwaterAir < 120 && action != actionDead)
        {
            // -- If drowning, show time till you drown
            draw_sprite(sprDrownTimer, floor(underwaterDrownFrame), floor(x) + 16, floor(y) - 12);
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- DEBUG

    if (global.debugIsAThing == true)
    {
        // -- Draw main masks
        draw_sprite_ext(maskEdge, 0, floor(x + angleSin * 11), floor(y + angleCos * 11), 1, 1, 0, c_white, 0.8);
        draw_sprite_ext(maskHitbox, 0, floor(x), floor(y), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskMain, 0, floor(x), floor(y), image_xscale, image_yscale, 0, c_white, 0.8);

        // -- Draw sensor masks
        draw_sprite_ext(maskBig, 0, floor(x + angleSin * sensorBottomDistance), floor(y + angleCos * sensorBottomDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskMid, 0, floor(x + angleSin * 22), floor(y + angleCos * 22), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleSin * sensorTopDistance), floor(y - angleCos * sensorTopDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleCos * sensorLeftDistance), floor(y + angleSin * sensorLeftDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x + angleCos * sensorRightDistance), floor(y - angleSin * sensorRightDistance), image_xscale, image_yscale, 0, c_white, 0.8);

        // -- Draw lines masks
        draw_sprite_ext(maskLines, floor(angle), floor(x - angleCos * 8 + angleSin * sensorLeftDistance), floor(y + angleSin * 8 + angleCos * sensorLeftDistance), 1, 1, 0, c_white, 0.8);
        draw_sprite_ext(maskLines, floor(angle), floor(x + angleCos * 8 + angleSin * sensorRightDistance), floor(y - angleSin * 8 + angleCos * sensorRightDistance), 1, 1, 0, c_white, 0.8);
    }
