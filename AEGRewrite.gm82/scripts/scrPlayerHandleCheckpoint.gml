/// scrPlayerHandleCheckpoint()
 //Handle checkpoint collision

    var checkpoint;
    checkpoint = scrPlayerCollisionHitbox(x, y, objCheckpoint);

    //Check if the player is meeting the checkpoint
    if (checkpoint != noone)
    {
        if (checkpoint.activated == false)
        {
            //Check if the player hadnt passed the checkpoint before
            if (global.playerCheckX != checkpoint.x && global.playerCheckY != checkpoint.y)
            {
                //Respawn point
                global.playerCheckTime = global.gameTime;
                global.playerCheckX = checkpoint.x;
                global.playerCheckY = checkpoint.y;


                with (checkpoint)
                {
                    activated = true;
                    scrPlaySound("sndCheckpoint", global.volumeSounds, 1, 0);
                }
            }
            else
            {
                with (checkpoint)
                {
                    activated = true;
                }
            }
        }
    }
