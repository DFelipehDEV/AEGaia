/// scrPlayerTerrainSndUpdate()
 // -- Updates the player terrain sound effect

    // -- Water terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) || scrPlayerCollisionObjectMain(x, y, objFootstepSensorWater))
    {
        terrainType      = "WATER";
        terrainSound[TerSkid]      = "sndPlayerSkidWater";
        terrainSound[TerLand]      = "sndPlayerLandWater";
        terrainSound[TerFootstep1] = "sndPlayerFootstepWater2";
        terrainSound[TerFootstep2] = "sndPlayerFootstepWater2";
    }

    // -- Grass terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorGrass))
    {
        terrainType      = "GRASS";
        terrainSound[TerSkid]      = "sndPlayerSkidGrass";
        terrainSound[TerLand]      = "sndPlayerLandGrass";
        terrainSound[TerFootstep1] = "sndPlayerFootstepGrass1";
        terrainSound[TerFootstep2] = "sndPlayerFootstepGrass2";
    }

    // -- Dirt terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorDirt))
    {
        terrainType      = "DIRT";
        terrainSound[TerSkid]      = "sndPlayerSkidDirt";
        terrainSound[TerLand]      = "sndPlayerLandDirt";
        terrainSound[TerFootstep1] = "sndPlayerFootstepDirt1";
        terrainSound[TerFootstep2] = "sndPlayerFootstepDirt2";
    }

    // -- Stone terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorStone))
    {
        terrainType      = "STONE";
        terrainSound[TerSkid]      = "sndPlayerSkidStone";
        terrainSound[TerLand]      = "scrPlayerLand";
        terrainSound[TerFootstep1] = "sndPlayerFootstepStone1";
        terrainSound[TerFootstep2] = "sndPlayerFootstepStone2";
    }

    // -- Metal terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorMetal))
    {
        terrainType      = "METAL";
        terrainSound[TerSkid]      = "sndPlayerSkidMetal";
        terrainSound[TerLand]      = "sndPlayerLandMetal";
        terrainSound[TerFootstep1] = "sndPlayerFootstepMetal1";
        terrainSound[TerFootstep2] = "sndPlayerFootstepMetal2";
    }

    // -- Wood terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorWood))
    {
        terrainType      = "WOOD";
        terrainSound[TerSkid]      = "sndPlayerSkidWood";
        terrainSound[TerLand]      = "sndPlayerLandWood";
        terrainSound[TerFootstep1] = "sndPlayerFootstepWood1";
        terrainSound[TerFootstep2] = "sndPlayerFootstepWood2";
    }
