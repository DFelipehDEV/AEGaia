/// scrPlayerShieldSet(shield)
 // -- Gives player a shield

    // -- Check if the shield is different from the current shield
    if (shield != argument0)
    {
        // -- Check the type of shield
        switch (argument0)
        {
            case shieldNormal:
                shield    = shieldNormal;
                // -- Create a normal shield object
                with(instance_create(x, y, objPlayerShieldNormal))
                {
                    playerID = other.id; // -- Assign player ID to the shield
                }
            break;

            case shieldElectricity:
                shield    = shieldElectricity;
                // -- Create an electricity shield object
                with (instance_create(x, y, objPlayerShieldElectricity))
                {
                    playerID = other.id; // -- Assign player ID to the shield
                }
            break;
        }
    }
