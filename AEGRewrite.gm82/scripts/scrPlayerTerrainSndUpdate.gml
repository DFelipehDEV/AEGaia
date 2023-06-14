/// scrPlayerTerrainSndUpdate()
 // -- Updates the player terrain sound effect

    // -- Water terrain
    if (scrPlayerCollisionObjectBottom(x, y, angle, maskBig, objWaterHorizon) || scrPlayerCollisionObjectMain(x, y, objFootstepSensorWater))
    {
        terrainType      = "WATER";
        terrainSound[terSkid]      = "sndPlayerSkidWater";
        terrainSound[terLand]      = "sndPlayerLandWater";
        terrainSound[terFootstep1] = "sndPlayerFootstepWater2";
        terrainSound[terFootstep2] = "sndPlayerFootstepWater2";
    }

    // -- Grass terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorGrass))
    {
        terrainType      = "GRASS";
        terrainSound[terSkid]      = "sndPlayerSkidGrass";
        terrainSound[terLand]      = "sndPlayerLandGrass";
        terrainSound[terFootstep1] = "sndPlayerFootstepGrass1";
        terrainSound[terFootstep2] = "sndPlayerFootstepGrass2";
    }

    // -- Dirt terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorDirt))
    {
        terrainType      = "DIRT";
        terrainSound[terSkid]      = "sndPlayerSkidDirt";
        terrainSound[terLand]      = "sndPlayerLandDirt";
        terrainSound[terFootstep1] = "sndPlayerFootstepDirt1";
        terrainSound[terFootstep2] = "sndPlayerFootstepDirt2";
    }

    // -- Stone terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorStone))
    {
        terrainType      = "STONE";
        terrainSound[terSkid]      = "sndPlayerSkidStone";
        terrainSound[terLand]      = "scrPlayerLand";
        terrainSound[terFootstep1] = "sndPlayerFootstepStone1";
        terrainSound[terFootstep2] = "sndPlayerFootstepStone2";
    }

    // -- Metal terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorMetal))
    {
        terrainType      = "METAL";
        terrainSound[terSkid]      = "sndPlayerSkidMetal";
        terrainSound[terLand]      = "sndPlayerLandMetal";
        terrainSound[terFootstep1] = "sndPlayerFootstepMetal1";
        terrainSound[terFootstep2] = "sndPlayerFootstepMetal2";
    }

    // -- Wood terrain
    if (scrPlayerCollisionObjectMain(x, y, objFootstepSensorWood))
    {
        terrainType      = "WOOD";
        terrainSound[terSkid]      = "sndPlayerSkidWood";
        terrainSound[terLand]      = "sndPlayerLandWood";
        terrainSound[terFootstep1] = "sndPlayerFootstepWood1";
        terrainSound[terFootstep2] = "sndPlayerFootstepWood2";
    }
