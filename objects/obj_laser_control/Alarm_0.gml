for (i = 0;i < ds_list_size(laser_x); i++){
    
    colision = collision_point(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),par_enemysolid,false,true)
    
    if collision != noone{
        show_message("hit")
        collision.hp --
        if collision.hp = 0 && collision.object_index != obj_turret && collision.object_index != obj_nav{
            
            with(collision){
                explosion = instance_create(x,y,obj_explosion)
                explosion.image_xscale = 1
                explosion.image_yscale = 1
                instance_destroy()
            }
            
        }else if collision.hp = 0 && collision.object_index = obj_enav{
            explosion = instance_create(obj_enav.x,obj_enav.y,obj_explosion)
            explosion.scale = 8
            obj_nav.alarm[1] = 120
            
            with(par_enemysolid){
            if object_index != obj_enav{instance_destroy()}}
            with(par_enemy){instance_destroy()}
            with(collision){instance_destroy()}
                
        }
        
        ds_list_delete(laser_x,i)
        ds_list_delete(laser_y,i)
        ds_list_delete(laser_angle,i)
        ds_list_delete(laser_hv,i)
        ds_list_delete(laser_vv,i)
        ds_list_delete(laser_time,i)
        ds_list_delete(laser_source,i)
    } 
}

/*for (i = 0;i < ds_list_size(elaser_x); i++){
    
    colision = collision_point(ds_list_find_value(elaser_x,i),ds_list_find_value(elaser_y,i),par_flyablesolid,false,true)
    
    if collision != noone{
        show_message("hit")
        collision.hp --
        if collision.hp = 0 && collision.object_index != obj_eturret && collision.object_index != obj_enav{
            
            with(collision){
                explosion = instance_create(x,y,obj_explosion)
                explosion.image_xscale = 1
                explosion.image_yscale = 1
                instance_destroy()
            }
            
        }else if collision.hp = 0 && collision.object_index = obj_nav{
            explosion = instance_create(obj_nav.x,obj_nav.y,obj_explosion)
            explosion.scale = 8
            
            with(par_flyablesolid){
            if object_index != obj_nav{instance_destroy()}}
            with(par_flyable){instance_destroy()}
            with(collision){instance_destroy()}
                
        }
        
        ds_list_delete(elaser_x,i)
        ds_list_delete(elaser_y,i)
        ds_list_delete(elaser_angle,i)
        ds_list_delete(elaser_hv,i)
        ds_list_delete(elaser_vv,i)
        ds_list_delete(elaser_time,i)
    } 
}*/

/* */
/*  */
