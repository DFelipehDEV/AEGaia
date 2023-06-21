	if (debug_mode)
{
	room_goto_next();
}

with (objControllerMusic)
	{
          scrPlayMusic("bgmTitle", 1, 191.9, 33.7, false)
	fadeIn =true;
	musicVolumeReal = 0
	scrPlaySound("sndMenuStartup", 1, global.volumeSounds, false)
	}
