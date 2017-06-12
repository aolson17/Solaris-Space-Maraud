/// @description General

if round(image_index) = image_number {
    forward = 0
}else if round(image_index) = 0 {
    forward = 1
}

if forward = 1{
    image_speed = .05
}else{
    image_speed = -.05
}

if room = ShipBuilder {
    mask_index = spr_turret_mask
}

if instance_number(obj_player)>0{
    mangle = point_direction(x,y,mouse_x,mouse_y) - obj_player.navLink.image_angle
}else{
    mangle = point_direction(x,y,mouse_x,mouse_y) - obj_nav.image_angle
}
if mangle >= 360{while (mangle >= 360){mangle -= 360}}
if mangle <= 0{while (mangle <= 0){mangle += 360}}
range = 5000
if distance_to_point(mouse_x,mouse_y) <= range && room != ShipBuilder{
    if !collision_line(x,y,mouse_x,mouse_y,par_flyablesolid,false,true) && ds_list_find_index(global.playership, id) != -1{
        
        if object_index = obj_turret{
            mi = 0//   min
            ma = 179// max
        }else if object_index = obj_turretdown{
            mi = 180// min
            ma = 360// max
        }else if object_index = obj_turretleft{
            mi = 90//  min
            ma = 269// max
        }else if object_index = obj_turretright{
            mi = 270// min
            ma = 449// max
            if mangle <= 90{mangle += 360}
        }
        
        if mouse_check_button(mb_left) && shoot = 1 && mangle <= ma && mangle >= mi{
            shoot = 0
            alarm[1] = 1//25
            
            
            ds_list_add(obj_laser_control.laser_x,x)
            ds_list_add(obj_laser_control.laser_y,y)
            ds_list_add(obj_laser_control.laser_angle,point_direction(x,y,mouse_x,mouse_y))
            ds_list_add(obj_laser_control.laser_hv,obj_player.navLink.curh+lengthdir_x(15,point_direction(x,y,mouse_x,mouse_y)))
            ds_list_add(obj_laser_control.laser_vv,obj_player.navLink.curv+lengthdir_y(15,point_direction(x,y,mouse_x,mouse_y)))
            ds_list_add(obj_laser_control.laser_time,150)
            ds_list_add(obj_laser_control.laser_source,id)
            /*instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)
            instance_create(x,y,obj_laser)*/
        }
        
        
        
        
        
        if mangle <= ma && mangle >= mi{
            image_speed = 0
            for (i = 0;i <= image_number;i ++){
                if mangle <= ((i+1)/image_number)*180 + mi && mangle >= mi + (i/image_number)*180{image_index = image_number - 1 - i}
            }
        }
    }
}






/* */
/*  */
