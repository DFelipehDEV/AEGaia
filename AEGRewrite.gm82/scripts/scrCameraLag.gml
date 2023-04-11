/// scrCameraLag(Frames)

	    if (instance_exists(objCamera) == true)
	    {
	        if (objCamera.camLagTimer == 0)
	        {
	            objCamera.camLagTimer   =   argument0;
	            objCamera.camStuck      =   true;
	        }
	    }
