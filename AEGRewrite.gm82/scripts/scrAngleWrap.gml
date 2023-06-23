/// scrAngleWrap(Angle)
 // -- Used to make sure that the angles are between 0 and 360

   while(argument0 < 0)
   {
         argument0 += 360;
   }

   while(argument0 >= 360)
   {
         argument0 -= 360;
   }

   return argument0;
