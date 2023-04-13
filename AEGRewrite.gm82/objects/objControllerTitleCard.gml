#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// @description  Variables

    cardZoneScale  = screenWidth;            //Scale of the zone card (when it starts to fade it it starts to split)

    cardCenterX    = screenWidth/2;          //X screen center
    cardCenterY    = screenHeight/2;         //Y screen center

    cardColor1     = make_color_rgb(21,153,224);   //Main color used
    cardColor2     = make_color_rgb(120,228,225);  //Second main color used

    cardBackAlpha  = 1;                             //Background alpha
    cardLineAlpha  = 1;                             //Lines and card alpha

    cardTimer      = 230;                           //Frames to end


    cardCharX      = 0;                             //Character pose speed
    cardCharSpeed  = 1;                             //Character pose speed

    cardDashX      = 0;                             //"dash" signs position

    cardShape1X    = cardCenterX;                   //Bottom Shape x
    cardShape1Y    = cardCenterY;                   //Bottom Shape y

    cardShape2X    = cardCenterX;                   //Top Shape x
    cardShape2Y    = cardCenterY;                   //Top Shape y


    cardReturnOffset = 0;
    cardResultOffset = 0;

    delay = 20;
    shapeTimer = 0;

    //Remove player control
    if (instance_exists(objPlayer))
    {
        with (objPlayer)
        {
            allowKeys = false;
        }
    }
#define Step_0
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



    // -- Dash sign position
    cardDashX += 6;


    // -- Back to the start if it has reached the screen limit
    if (cardDashX > (cardCenterX*2) + sprite_get_width(sprTitleCardDash))
    {
        cardDashX = -sprite_get_width(sprTitleCardDash);
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


    if (cardTimer < 28)
    {
        if (cardTimer < 5)
        {
            cardReturnOffset += 4;
            cardResultOffset = lerp(cardResultOffset, cardReturnOffset, 0.1);
        }


        if (cardZoneScale > 0)
        {
            cardZoneScale -= 15;
        }


        // -- Destroy card
        if (cardTimer < -30)
        {
            instance_destroy();
        }


        // -- Give player control
        if (instance_exists(objPlayer))
        {
            objPlayer.allowKeys  = true;
            global.gameTimeAllow = true;
        }
    }



    // -- Fade background
    if (cardTimer < 55)
    {
        if (cardBackAlpha > 0)
        {
            cardBackAlpha -= 0.05;
        }


        if (instance_exists(objPlayer) && cardTimer > 0 && global.playerCheckX == 0)
        {
            objPlayer.xSpeed = 8;
        }
    }


    // -- Shapes
    if (cardTimer < 210)
    {
        var time;
        time = 90;

        shapeTimer = min(shapeTimer + 1, time);
        //Approach to the borders of the screen
        cardShape1X = scrEasings(shapeTimer, cardCenterX, (screenWidth+25)-cardCenterX, time, "easeOutExpo");

        cardShape2X = scrEasings(shapeTimer, cardCenterX, cardCenterX - (screenWidth), time, "easeOutExpo");
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw title card


    // -- Draw background
    draw_sprite_tiled_ext(sprTitleCardBG, 0, view_xview[0], view_yview[0], 1, 1, c_white, cardBackAlpha);


    // -- Draw character
    draw_sprite_ext(sprTitleCardChar, 0, view_xview[0] + cardCharX + + cardResultOffset*6, view_yview[0] + cardCenterY, 1, 1, 0, c_white, 1);


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
    draw_text(view_xview[0] + cardCharX + cardResultOffset*7, view_yview[0] + cardCenterY + 10, string(global.stageName));
    draw_set_halign(-1);
    draw_set_font(1);


    // -- Draw bottom shape
    draw_sprite_ext(sprTitleCardShapes, 0, (view_xview[0] + cardResultOffset) + cardShape1X, view_yview[0] + cardResultOffset, 1, 1, 0, c_white, cardLineAlpha);


    // -- Draw top shape
    draw_sprite_ext(sprTitleCardShapes, 1, (view_xview[0] - cardResultOffset) + cardShape2X, view_yview[0] - cardResultOffset, 1, 1, 0, c_white, cardLineAlpha);


    // -- Draw a line in the top
    draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + cardCenterX*2, (view_yview[0] - cardResultOffset) + 10, cardColor2, cardColor2, cardColor2, cardColor2, 0);


    // -- Draw a line in the bottom
    draw_rectangle_color(view_xview[0], view_yview[0] + cardCenterY*2, view_xview[0] + cardCenterX*2, (view_yview[0] + cardResultOffset) + (cardCenterY*2)-10, cardColor2, cardColor2, cardColor2, cardColor2, 0);


    draw_set_alpha(1);
