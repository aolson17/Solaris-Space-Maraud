instance_destroy()
if global.tgm = 1{
    other.hp --
}
if other.hp = 0 && other.object_index != obj_nav{
    
    
    with(other){
        explosion = instance_create(x,y,obj_explosion)
        explosion.image_xscale = 1.5
        explosion.image_yscale = 1.5
        explosion.curh = obj_nav.curh
        explosion.curv = obj_nav.curv
        instance_destroy()
    }
        
        
    
}else if other.hp = 0 && other.object_index = obj_nav{
    instance_create(obj_nav.x,obj_nav.y,obj_explosion)
    //obj_nav.alarm[1] = 60
    
    with(par_flyablesolid){
    if object_index != obj_nav{instance_destroy()}}
    with(par_flyable){if object_index != obj_player{instance_destroy()}}
    show_message("You blew up! Try again")
    room_restart()
}

