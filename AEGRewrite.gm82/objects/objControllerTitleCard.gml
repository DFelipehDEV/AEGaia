#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    // -- Destroy while in GMdebug mode
    if (debug_mode)
    {
        instance_destroy();
        exit;
    }

    cardZoneScale  = 1;            //Scale of the zone card (when it starts to fade it it starts to split)

    cardCenterX    = screenWidthMid;          //X screen center
    cardCenterY    = screenHeightMid;         //Y screen center

    cardColor1     = make_color_rgb(21,153,224);   //Main color used
    cardColor2     = make_color_rgb(120,228,225);  //Second main color used

    cardBackAlpha  = 1;                             //Background alpha
    cardLineAlpha  = 1;                             //Lines and card alpha

    cardTimer      = 230;                           //Frames to end

    cardCharX      = 0;                             //Character pose speed
    cardCharSpeed  = 1;                             //Character pose speed
    cardCharAlpha  = 1;

    cardDashX      = 0;                             //"dash" signs position

    cardShape1X    = cardCenterX;                   //Bottom Shape x
    cardShape1Y    = cardCenterY;                   //Bottom Shape y

    cardShape2X    = cardCenterX;                   //Top Shape x
    cardShape2Y    = cardCenterY;                   //Top Shape y

    cardReturnOffset = 0;
    cardResultOffset = 0;

    delay = 30;
    shapeTimer = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Disable player input

    if (delay == 29)
    {
        // -- Disable player control
        if (global.player == true)
        {
            with (objPlayer)
            {
                allowKeys = false;
            }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Position

    delay = max(delay - 1, 0)

    // -- Exit while waiting for delay
    if (delay) exit;
    cardCharX += cardCharSpeed;

    // -- While far of the center of the screen, keep going fast
    if (cardCharX < cardCenterX - 157)
    {
        cardCharSpeed = 5.5;
    }
    else
    {
        // -- Decelerate while getting near of the center
        if (cardCharSpeed > 0.1)
        {
            cardCharSpeed -= 0.1;
        }
    }

    if (cardTimer < 210)
    {
        // -- Dash sign position
        cardDashX += 6;

        // -- Back to the start if it has reached the screen limit
        if (cardDashX > (screenWidth) + sprite_get_width(sprTitleCardDash))
        {
            cardDashX = -sprite_get_width(sprTitleCardDash);
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Timers

    // -- Exit while waiting for delay
    if (delay) exit;

    cardTimer -= 1;

    if (cardTimer < 30)
    {
        if (cardTimer < 5)
        {
            cardReturnOffset += 4;
            cardResultOffset = lerp(cardResultOffset, cardReturnOffset, 0.1);
            // -- Give player control
            if (global.player == true)
            {
                objPlayer.allowKeys  = true;
                global.gameTimeAllow = true;
            }
        }

        if (cardZoneScale > 0)
        {
            cardZoneScale -= 12;
        }


        // -- Destroy card
        if (cardTimer < -50)
        {
            instance_destroy();
        }
    }

    // -- Fade background
    if (cardTimer < 40)
    {
        if (cardBackAlpha > 0)
        {
            cardBackAlpha -= 0.02;
        }

        if (global.player == true && cardTimer > 0 && global.playerCheckX == 0)
        {
            objPlayer.xSpeed = 8;
        }
    }

    // -- Shapes
    if (cardTimer < 230 && cardTimer > 120)
    {
        var time;
        time = 90;

        shapeTimer = min(shapeTimer + 1, time);
        //Approach to the borders of the screen
        cardShape1X = scrEasings(shapeTimer, cardCenterX, (screenWidth+25)-cardCenterX, time, "easeOutExpo");

        cardShape2X = scrEasings(shapeTimer, cardCenterX, cardCenterX - (screenWidth), time, "easeOutExpo");


        cardZoneScale = min(cardZoneScale + 12, screenWidth);
    }

    if (cardTimer < 9)
    {
        cardCharAlpha -= 0.04;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw title card

    // -- Draw background left
    draw_sprite_ext(sprTitleCardBG, 0, (view_xview[0] - cardResultOffset*8), view_yview[0], 1, 1, 0, c_white, cardBackAlpha);

    // -- Draw background right
    draw_sprite_ext(sprTitleCardBG, 0, (view_xview[0] + cardResultOffset*8) + 256, view_yview[0], 1, 1, 0, c_white, cardBackAlpha);

    // -- Draw character
    draw_sprite_ext(sprTitleCardChar, 0, view_xview[0] + cardCharX + cardResultOffset*9, (view_yview[0] + dsin(current_time/6)*8) + cardCenterY, 1 + cardResultOffset/12, 1 + cardResultOffset/12, 0, c_white, cardCharAlpha);

    draw_set_alpha(cardLineAlpha);

    // -- Draw zone card
    draw_sprite_ext(sprTitleCardZoneCard, 0, view_xview[0], view_yview[0] + cardCenterY, cardZoneScale, 1, 0, c_white, cardLineAlpha);

    if (cardResultOffset == 0)
    {
        // -- Draw dash sign
        draw_sprite_ext(sprTitleCardDash, 0, view_xview[0] + cardDashX, view_yview[0] + cardCenterY, 1, 1, 0, c_white, cardLineAlpha);
    }

    // -- Draw text
    draw_set_font(global.fontTitleCard);
    draw_set_halign(fa_center);
    draw_text(view_xview[0] + cardCharX + cardResultOffset*7, (view_yview[0]) + cardCenterY + 10, string(global.stageName));
    draw_set_halign(-1);
    draw_set_font(1);

    // -- Draw bottom shape
    draw_sprite_ext(sprTitleCardShapes, 0, (view_xview[0] + cardResultOffset) + cardShape1X, view_yview[0] + cardResultOffset, 1, 1, 0, c_white, cardLineAlpha);

    // -- Draw top shape
    draw_sprite_ext(sprTitleCardShapes, 1, (view_xview[0] - cardResultOffset) + cardShape2X, view_yview[0] - cardResultOffset, 1, 1, 0, c_white, cardLineAlpha);

    // -- Draw a line in the top
    draw_sprite(sprTitleCardBar, 0, view_xview[0], view_yview[0] - cardResultOffset*2.5);

    // -- Draw a line in the bottom
    draw_sprite(sprTitleCardBar, 0, view_xview[0], (view_yview[0] + screenHeight-11) + cardResultOffset*2.5);
    draw_set_alpha(1);
