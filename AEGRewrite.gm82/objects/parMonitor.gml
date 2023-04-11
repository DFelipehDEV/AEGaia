#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0;

    playerID = 0;
    icon     = -1;     //Current icon
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Destroy


    monIcon             = instance_create(x, y, objMonitorIcon);
    monIcon.playerID    = other.id;
    monIcon.icon        = icon;

    if (other.action == actionJump && other.ySpeed > 0)
    {
        other.ySpeed *= -0.9;
    }
    if (other.action == actionHoming)
    {
        other.action             = actionNormal;

        other.animationIndex     = choose("HOMED_1", "HOMED_2");
        other.allowKeyTimer      = 15;
        other.xSpeed             = 0;
        other.ySpeed             = -5.8;
    }

    // -- Create explosion
    scrDummyEffectCreate(x, y, sprVFXExplosion1, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);
    scrPlaySound("sndExplosion1", global.volumeSounds, 1, false);
    scrPlaySound("sndMonitorBreak", global.volumeSounds, 1, false);
    instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw monitor and icon

    draw_sprite(sprMonitorIcons, icon, x, y);
    draw_sprite(sprMonitor, 0, x, y);
