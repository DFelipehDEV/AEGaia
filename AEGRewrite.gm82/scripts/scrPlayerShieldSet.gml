/// scrPlayerShieldSet(shield)
 // -- Gives player a shield

    // -- Check if the shield is different from the current shield
    if (shield != argument0)
    {
        // -- Check the type of shield
        switch (argument0)
        {
            case ShieldNormal:
                shield = ShieldNormal;
                // -- Create a normal shield object
                with(instance_create(x, y, objPlayerShieldNormal))
                {
                    playerID = other.id; // -- Assign player ID to the shield
                }
            break;

            case ShieldElectricity:
                shield = ShieldElectricity;
                // -- Create an electricity shield object
                with (instance_create(x, y, objPlayerShieldElectricity))
                {
                    playerID = other.id; // -- Assign player ID to the shield
                }
            break;
        }
    }
