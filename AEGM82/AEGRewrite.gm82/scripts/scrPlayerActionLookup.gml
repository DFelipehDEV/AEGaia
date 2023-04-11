/// scrPlayerActionLookup()

	    yLookTimer += 1;

	    // -- Reset
	    if (keyUp == false || keyDown == true)
	    {
	        action         = actionLookUpReset;
	        scrAnimationApply("LOOK_UP_RESET");
	    }
