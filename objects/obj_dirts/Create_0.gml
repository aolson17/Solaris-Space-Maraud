global.held = 0
holding = 0

if collision_point(x + 1,y -5,par_wall,false,true){
    sprite_index = spr_dirtunder
}else if !collision_point(x - 5,y +1,par_wall,false,true){
    sprite_index = spr_dirtleft
    depth -= 1
}

if !collision_point(x + 8,y +1,par_wall,false,true) && !collision_point(x + 1,y -5,par_wall,false,true){
    sprite_index = spr_dirtright
    depth -= 1
}

if !collision_point(x + 8,y +1,par_wall,false,true) && !collision_point(x - 5,y +1,par_wall,false,true) && !collision_point(x + 1,y -5,par_wall,false,true){
    sprite_index = spr_dirttop
    depth -= 2
}

alarm[0] = 20





action_snap(32, 32);
