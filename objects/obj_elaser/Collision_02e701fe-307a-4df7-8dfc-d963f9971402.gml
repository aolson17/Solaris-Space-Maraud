instance_destroy()
if global.tgm = 1{
    other.hp --
}
if other.hp = 0{
    
    
    with(other){if object_index != obj_player{
        explosion = instance_create(x,y,obj_explosion)
        explosion.image_xscale = 1.5
        explosion.image_yscale = 1.5
        explosion.curh = obj_nav.curh
        explosion.curv = obj_nav.curv
        instance_destroy()
    }}
        
        
    
}


