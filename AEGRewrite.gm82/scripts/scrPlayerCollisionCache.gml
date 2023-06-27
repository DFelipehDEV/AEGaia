/// scrPlayerCollisionCache()

    // -- Cache collisions
    edgeCollision = scrPlayerCollisionLeftEdge(x, y, angle) && scrPlayerCollisionRightEdge(x, y, angle);
    bottomCollision = scrPlayerCollisionBottom(x, y, angle, maskBig);
