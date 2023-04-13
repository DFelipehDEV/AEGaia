/// scrPlayerShieldSet(shield)
 // -- Gives player a shield


    // -- Normal shield
    if (argument0 == "NORMAL")
    {
        shield    = shieldNormal;
        with(instance_create(x, y, objPlayerShieldNormal))
        {
            playerID = other.id;
        }
    }

    // -- Electricity shield
    if (argument0 == "ELECTRICITY")
    {
        shield    = shieldElectricity;
        with (instance_create(x, y, objPlayerShieldElectricity))
        {
            playerID = other.id;
        }
    }
