if collision_point(x - 4,y +1,obj_dirts,false,true) && collision_point(x,y -5,obj_dirts,false,true){
    //sprite_index = spr_stoneleft
}

if collision_point(x + 8,y +1,obj_dirts,false,true) && collision_point(x,y -5,obj_dirts,false,true){
    sprite_index = spr_stoneright
}

if collision_point(x + 8,y +1,obj_dirts,false,true) && collision_point(x - 4,y +1,obj_dirts,false,true) && collision_point(x,y -5,obj_dirts,false,true){
    sprite_index = spr_stonetop
}

alarm[0] = 10

action_snap(32, 32);
