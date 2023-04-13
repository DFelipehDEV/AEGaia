/// scrDrawTrail(length,width,color,sprite,slim,alpha)
//Ex. scrDrawTrail(32,32,c_white,-1,1,1)
var Length,Width,Color,Sprite,Slim,Alpha,AlphaT,Texture,Dir,Dim,Min,Height;
    //Preparing variables
    Length = argument0; //How many previous coordinates will use the trail
    Width = argument1; //How wide will the trail be
    Color = argument2; //Which color will be used to tint the trail
    Sprite = argument3; //Which sprite's texture must be used for the trail. Must have "Used for 3D" marked. -1 for no sprite 
    Slim = argument4; //Whether the trail will slim down at the end
    Alpha = argument5; //The alpha to draw the trail with (0-1), optional
    var TrailX, TrailY, TrailDist;
    TrailX = ds_list_create();
    TrailY = ds_list_create();
    TrailDist = ds_list_create();
    ds_list_add(TrailX, x);
    ds_list_add(TrailY, y);
    ds_list_add(TrailDist, 0);
    //Getting distance between current and past coordinates
    if (ds_list_size(TrailX) > 1) {
        var x1, y1, x2, y2, dist;
        x1 = ds_list_find_value(TrailX, ds_list_size(TrailX) - 2);
        y1 = ds_list_find_value(TrailY, ds_list_size(TrailY) - 2);
        x2 = ds_list_find_value(TrailX, ds_list_size(TrailX) - 1);
        y2 = ds_list_find_value(TrailY, ds_list_size(TrailY) - 1);
        dist = point_distance(x1, y1, x2, y2) + ds_list_find_value(TrailDist, ds_list_size(TrailDist) - 2);
        ds_list_add(TrailDist, dist);
    }
    //Setting the texture
    if (Sprite >= 0) {
        Texture = sprite_get_texture(Sprite,0);
        Dim = sprite_get_width(Sprite)/sprite_get_width(Sprite)
    } else {
        Texture = -1;
        Dim = 1
    }
    texture_set_repeat(1);
    //Drawing the primitive
    draw_primitive_begin_texture(pr_trianglestrip,Texture);
    AlphaT = 1;
    Dir = 0;
    Min = min(ds_list_size(TrailX) - 1, Length);
    var i;
    for(i = 0; i < Min; i += 1)
    {
        var x1, y1, x2, y2, Len, XX, YY;
        x1 = ds_list_find_value(TrailX, i);
        y1 = ds_list_find_value(TrailY, i);
        x2 = ds_list_find_value(TrailX, i+1);
        y2 = ds_list_find_value(TrailY, i+1);
        if (x1 != x2 || y1 != y2)
            Dir = point_direction(x1, y1, x2, y2);
        Len = Width / 2 - ((i + 1) / Min * Width / 2) * Slim;
        XX = lengthdir_x(Len,Dir + 90); 
        YY = lengthdir_y(Len, Dir + 90);
        AlphaT = (Min - i) / (Min / 2) * Alpha;
        draw_vertex_texture_color(x + XX, y + YY, ArrayTrail[i, 2] / (Width * Dim), 0, Color, AlphaT);
        draw_vertex_texture_color(x - XX, y - YY, ArrayTrail[i, 2] / (Width * Dim), 1, Color, AlphaT);
    }
    draw_primitive_end();
    
    // Update the trail array
    var i;
    for (i = Min; i > 0; i -= 1) {
    ArrayTrail[i, 0] = ArrayTrail[i - 1, 0];
    ArrayTrail[i, 1] = ArrayTrail[i - 1, 1];
    ArrayTrail[i, 2] = ArrayTrail[i - 1, 2];
    }
    ArrayTrail[0, 0] = x;
    ArrayTrail[0, 1] = y;
    
    //return ds_list_mark_as_map(trailList, false);
