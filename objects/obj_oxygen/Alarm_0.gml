/// @description Expand Oxygen and Destroy
dist = 96
if collision_point(x + 48,y + 16,obj_wall,false,true) && !collision_point(x + 48,y + 16,obj_oxygen,false,true) && !collision_point(x + 48,y + 16,par_wall,false,true) && distance_to_object(target) < dist{
    make = instance_create(collision_point(x + 48,y + 16,obj_wall,false,true).x,collision_point(x + 48,y + 16,obj_wall,false,true).y,obj_oxygen)//Right
    make.target = target
}
if collision_point(x - 16,y + 16,obj_wall,false,true) && !collision_point(x - 16,y + 16,obj_oxygen,false,true) && !collision_point(x - 16,y + 16,par_wall,false,true) && distance_to_object(target) < dist{
    make = instance_create(collision_point(x - 16,y + 16,obj_wall,false,true).x,collision_point(x - 16,y + 16,obj_wall,false,true).y,obj_oxygen)//Left
    make.target = target
}
if collision_point(x + 16,y + 48,par_life,false,true) && !collision_point(x + 16,y + 48,obj_oxygen,false,true) && !collision_point(x + 16,y + 48,par_wall,false,true) && distance_to_object(target) < dist{
    make = instance_create(collision_point(x + 16,y + 48,obj_wall,false,true).x,collision_point(x + 16,y + 48,obj_wall,false,true).y,obj_oxygen)//Down
    make.target = target
}
if collision_point(x + 16,y - 16,par_life,false,true) && !collision_point(x + 16,y - 16,obj_oxygen,false,true) && !collision_point(x + 16,y - 16,par_wall,false,true) && distance_to_object(target) < dist{
    make = instance_create(collision_point(x + 16,y - 16,obj_wall,false,true).x,collision_point(x + 16,y - 16,obj_wall,false,true).y,obj_oxygen)//Up
    make.target = target
}

alarm[0] = 10
//if target.out = 1{instance_destroy()}

if !collision_point(x + sprite_width/2,y + sprite_height/2,par_life,false,true){
    //instance_destroy()
    with(obj_oxygen){instance_destroy()}
}
/*
if !collision_point(x + 48,y + 16,par_wall,true,true)&& !collision_point(x + 48,y + 16,par_life,true,true){
    instance_destroy()//Right
}
if !collision_point(x - 16,y + 16,par_wall,true,true)&& !collision_point(x - 16,y + 16,par_life,true,true){
    instance_destroy()//Left
}
if !collision_point(x + 16,y + 48,par_wall,true,true)&& !collision_point(x + 16,y + 48,par_life,true,true){
    instance_destroy()//Down
}
if !collision_point(x + 16,y - 16,par_wall,true,true)&& !collision_point(x + 16,y - 16,par_life,true,true){
    instance_destroy()//Up
}

/* */
/*  */
