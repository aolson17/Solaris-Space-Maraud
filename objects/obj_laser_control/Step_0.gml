/// @description Move Lasers

for(j=0;j<=ds_list_size(global.playership);j++){
    with(ds_list_find_value(global.playership,j)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.j)
			break
		}
        
		if object_index != obj_player{
		
			tempx = x
			tempy = y
			tempangle = image_angle
		
			image_angle = navLink.image_angle
	        x = navLink.x + lengthdir_x(point_distance(x, y, navLink.x, navLink.y),ang + navLink.orbit_angle);
		    y = navLink.y + lengthdir_y(point_distance(x, y, navLink.x, navLink.y),ang + navLink.orbit_angle);
        
		}
    }
}

for (i = 0;i < ds_list_size(laser_x); i++){
    
    ds_list_replace(laser_x,i,ds_list_find_value(laser_x,i)+ds_list_find_value(laser_hv,i))
    ds_list_replace(laser_y,i,ds_list_find_value(laser_y,i)+ds_list_find_value(laser_vv,i))
    ds_list_replace(laser_time,i,ds_list_find_value(laser_time,i)-1)
    if ds_list_find_value(laser_time,i) <= 0{
        ds_list_delete(laser_x,i)
        ds_list_delete(laser_y,i)
        ds_list_delete(laser_angle,i)
        ds_list_delete(laser_hv,i)
        ds_list_delete(laser_vv,i)
        ds_list_delete(laser_time,i)
        ds_list_delete(laser_source,i)
    }
    
    // Collision
    if !(is_undefined(ds_list_find_value(laser_x,i)) && is_undefined(ds_list_find_value(laser_y,i))){
       // if point_distance(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),obj_nav.x,obj_nav.y) < 150{
            if position_meeting(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),par_flyable) {
                var collision_id = instance_place(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),par_flyable)
                if instance_exists(collision_id){
                    if collision_id.object_index != obj_player{
                        with(collision_id){
                            hp --
                            if collision_id.hp = 0{
                                explosion = instance_create(x,y,obj_explosion)
                                explosion.scale = 1
                                if instance_exists(collision_id){
                                    explosion.curh = collision_id.curh
                                    explosion.curv = collision_id.curv
                                }
                                instance_destroy()
                            }
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
                
            }else if position_meeting(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),par_flyablesolid){
                var collision_id = instance_place(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),par_flyablesolid)
                if instance_exists(collision_id){
                    //if id = ds_list_find_value(obj_laser_control.laser_source,obj_laser_control.i){
                    if collision_id.object_index != ds_list_find_value(laser_source,i) && !(collision_id.object_index = obj_turret||collision_id.object_index = obj_turretdown||collision_id.object_index = obj_turretright||collision_id.object_index = obj_turretleft) /*!object_is_ancestor(collision_id,par_turret)*/{
                        with(collision_id){
                            //collision_id.object_index != obj_turret{
                            hp --
                            
                            if collision_id.hp = 0 && collision_id.object_index != obj_nav{
                                explosion = instance_create(x,y,obj_explosion)
                                explosion.scale = 1
                                if instance_exists(collision_id){
                                    explosion.curh = collision_id.curh
                                    explosion.curv = collision_id.curv
                                }
                                instance_destroy()
                            }else if collision_id.hp = 0{
                                explosion = instance_create(collision_id.x,collision_id.y,obj_explosion)
                                explosion.scale = 8
                                explosion.curh = collision_id.curh
                                explosion.curv = collision_id.curv
                                with(par_flyable){
                                    if navLink = collision_id{
                                        instance_destroy()
                                    }
                                }
                                with(par_flyablesolid){
                                    if navLink = collision_id || object_index = collision_id{
                                        instance_destroy()
                                    }
                                }
                            }
                        } 
                        //}
                        ds_list_delete(laser_x,i)
                        ds_list_delete(laser_y,i)
                        ds_list_delete(laser_angle,i)
                        ds_list_delete(laser_hv,i)
                        ds_list_delete(laser_vv,i)
                        ds_list_delete(laser_time,i)
                        ds_list_delete(laser_source,i)
                    }
                }
                
            }
        //}
    }
}


for(j=0;j<=ds_list_size(global.playership);j++){
    with(ds_list_find_value(global.playership,j)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.j)
			break
		}
		if object_index != obj_player{
			x = tempx
			y = tempy
			image_angle = tempangle
		}
    }
}