instance_destroy()
other.hp --
if other.hp = 0 && other.object_index != obj_eturret && other.object_index != obj_enav{
    
    
    with(other){
        explosion = instance_create(x,y,obj_explosion)
        explosion.image_xscale = 1
        explosion.image_yscale = 1
        instance_destroy()
    }
        
        
    
}else if other.hp = 0 && other.object_index = obj_enav{
    explosion = instance_create(obj_enav.x,obj_enav.y,obj_explosion)
    explosion.scale = 8
    obj_nav.alarm[1] = 120
    
    with(par_enemysolid){
    if object_index != obj_enav{instance_destroy()}}
    with(par_enemy){instance_destroy()}
    with(other){instance_destroy()}
}


