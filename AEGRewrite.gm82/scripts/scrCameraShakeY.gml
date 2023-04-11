/// scrCameraShakeY(Time)

    if (instance_exists(objCamera))
    {
        //Start shaking
        with (objCamera)
        {
            camYShakeTimer = argument0;
        }
    }
