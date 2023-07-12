/// scrPlayerHandleEnemy()
 // -- Handle enemies collision

    var enemy;
    enemy = scrPlayerCollisionHitbox(x, y, parEnemy);

    // -- Check if the player is meeting the enemy and it has no invincibility
    if (enemy != noone)
    {
        // -- Check if the player is doing any of these actions
        if (attackPossible)
        {
            // -- Check if the enemy does not have invincibility frames
            if (enemy.enemyBlinkTimer == 0)
            {
                // -- Decrease enemy HP
                if (enemy.enemyHP > 0)
                {
                    // -- Decrease enemy HP and give him small invincibility
                    with (enemy)
                    {
                        enemyBlinkTimer = 20;
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

                var enemyX, enemyY;
                enemyX = enemy.x;
                enemyY = enemy.y;
                // -- Check if the enemy has no HP
                if (enemy.enemyHP == noone || enemy.enemyHP <= 0)
                {
                    // -- Check if the enemy "bust", in that case it is false so it will just explode
                    if (enemy.enemyBust == false)
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
                        }
                    }
                    else
                    // -- Otherwise, bust him
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
                    }

                    with (enemy)
                    {
                        instance_destroy();
                    }
                }

                // -- Stop homing if the player was homing
                scrPlayerHomingReset(ActionNormal, 0, -6.7, 35, enemyX, enemyY);

                // -- Bounce on the enemy
                if (action == ActionJump && ySpeed >= 0)
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

                scrCameraShakeY(17);

                scrDummyEffectCreate(x, y, sprVFXHit, 0.45, 0, -0.1, bm_add, 1, 1, 1, 0);
                // -- Play sound
                scrPlaySound(choose("sndPlayerEnemyHit1", "sndPlayerEnemyHit2", "sndPlayerEnemyHit3"), global.volumeSounds, 1, false);

                scrPlayerEnergyAdd(8);
            }
        }
        else
        {
            scrPlayerHurtSet();
        }
    }
