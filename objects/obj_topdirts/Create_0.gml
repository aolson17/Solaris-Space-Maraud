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

if room = Land{
    instance_create(x,y + 32,obj_dirts)
    instance_create(x,y + 64,obj_dirts)
    instance_create(x,y + 96,obj_longdirt)
    var chos = choose(0,1)
    if chos = 1{instance_create(x,y + 160,obj_dirts)}
    for (i=0;i<5;i++){
    if chos = 0{instance_create(x,y + 160+64*i,obj_longstone)}
    if chos = 1{instance_create(x,y + 192+64*i,obj_longstone)}
    }




}



action_snap(32, 32);
