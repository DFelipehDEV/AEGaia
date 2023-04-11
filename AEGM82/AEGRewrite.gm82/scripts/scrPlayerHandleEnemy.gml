/// scrPlayerHandleEnemy()
 // -- Handle enemies collision


    var enemy;
    enemy = scrPlayerCollisionHitbox(x, y, parEnemy);

    // -- Check if the player is meeting the enemy and it has no invincibility
    if (enemy != noone)
    {
        // -- Check if the player is doing any of these actions
        if (boost == true || invincibility == invincibilityMonitor || action == actionJump || action == actionRoll || action == actionAirdash
        || action == actionHoming || action == actionStomp || action == actionSlide)
        {
            if (enemy.enemyBlinkTimer == 0)
            {
                // -- Decrease enemy HP
                if (enemy.enemyHP > 0)
                {
                    // -- Decrease enemy HP and give him small invincibility
                    with (enemy)
                    {
                        enemyBlinkTimer = 25;
                        enemyHP        -= 1;
                    }

                    // -- Deal more damage while boosting
                    if (boost == true)
                    {
                        with (enemy)
                        {
                            enemyHP -= 1;
                        }
                    }
                }


                // -- Check if the enemy "bust", in that case it is false so it will just explode
                if (enemy.enemyBust == false)
                {
                    // -- Check if the enemy has no HP
                    if (enemy.enemyHP == noone || enemy.enemyHP <= 0)
                    {
                        with(enemy)
                        {
                            // -- Create explosion
                            scrDummyEffectCreate(x, y, sprVFXExplosion1, 0.35, 0, -0.1, bm_normal, 1, 1, 1, 0);


                            // -- Play sound
                            scrPlaySound(choose("sndExplosion1", "sndExplosion2"), global.volumeSounds, 1, false);

                            // -- Spawn metal parts
                            repeat(6)
                            {
                                metal = instance_create(x, y, objEnemyMetal);
                                metal.hspeed = random_range(-3, 3);
                                metal.vspeed = random_range(-5, -3);
                            }

                            instance_destroy();
                        }
                    }
                }
                // -- Otherwise, bust him
                else
                {
                    // -- Check if the enemy has no HP
                    if (enemy.enemyHP == noone || enemy.enemyHP <= 0)
                    {
                        // -- Made a separated object for this to prevent bugs to happen
                        var enemyDeath;
                        enemyDeath = instance_create(enemy.x, enemy.y, objEnemyDeath);
                        enemyDeath.hspeed = xSpeed * 1.05;


                        if (ground == true)
                        {
                            enemyDeath.vspeed = -6;
                        }
                        else
                        {
                            enemyDeath.vspeed = ySpeed * 0.7;
                        }

                        enemyDeath.gravity = 0.2;


                        enemyDeath.alarm[0] = 40;
                        enemyDeath.sprite_index = enemy.sprite_index;


                        with (enemy)
                        {
                            instance_destroy();
                        }
                    }
                }


                // -- Bounce on the enemy
                if (action == actionJump && ySpeed >= 0)
                {
                    // -- Check if the player is holding the jump key
                    if (keyAction == true)
                    {
                        ySpeed = -ySpeed * 1.15;
                    }
                    // -- Otherwise, give less height
                    else
                    {
                        ySpeed = -ySpeed * 0.99;
                    }
                }


                // -- Stop homing if the player was homing
                if (action == actionHoming)
                {
                    // -- Give player invincibility to avoid dying
                    if (invincibilityTimer == 0)
                    {
                        invincibilityTimer = 35;
                    }


                    action             = actionNormal;

                    animationIndex     = choose("HOMED_1", "HOMED_2");
                    allowKeyTimer      = 20;
                    xSpeed             = 0;
                    ySpeed             = -5.8;
                }

                scrCameraShakeY(15);

                scrDummyEffectCreate(x, y, sprVFXHit, 0.45, 0, -0.1, bm_add, 1, 1, 1, 0);
                // -- Play sound
                scrPlaySound(choose("sndPlayerEnemyHit1", "sndPlayerEnemyHit2", "sndPlayerEnemyHit3"), global.volumeSounds, 1, false);

                energyAmount += 8;
            }
        }
        else
        {
            scrPlayerHurtSet();
        }
    }
