#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    button = "BOOST";
#define Collision_objPlayer
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Button


    if (instance_exists(objControllerStage))
    {
        if (objControllerStage.hudButton == "")
        {
            objControllerStage.hudButton = button;
            objControllerStage.hudButtonTimer = 80;
            instance_destroy();
        }
    }
