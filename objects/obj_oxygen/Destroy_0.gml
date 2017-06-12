

/*
with(obj_plat){mask_index = spr_metal}
if collision_point(x + 48,y + 16,obj_oxygen,true,true){
    with(collision_point(x + 48,y + 16,obj_oxygen,true,true)){instance_destroy()}//Right
}
if collision_point(x - 16,y + 16,obj_oxygen,true,true){
    with(collision_point(x - 16,y + 16,obj_oxygen,true,true)){instance_destroy()}//Left
}
if collision_point(x + 16,y + 48,obj_oxygen,true,true){
    with(collision_point(x + 16,y + 48,obj_oxygen,true,true)){instance_destroy()}//Down
}
if collision_point(x + 16,y - 16,obj_oxygen,true,true){
    with(collision_point(x + 16,y - 16,obj_oxygen,true,true)){instance_destroy()}//Up
}
with(obj_plat){mask_index = spr_plat}

/* */
/*  */
