/// @description General

if round(image_index) = image_number {//if image_index >= 8.6 && image_index <= 9 {//
    forward = 0
}else if round(image_index) = 0 {//}else if image_index >= 9.1 || image_index <= 0.7 {//
    forward = 1
}

if forward = 1{
    image_speed = .05
}else{
    image_speed = -.05
}

if instance_number(obj_nav) != 0{
    
    mangle = point_direction(x,y,obj_nav.x,obj_nav.y) - obj_enav.image_angle
    if mangle >= 360{while (mangle >= 360){mangle -= 360}}
    if mangle <= 0{while (mangle <= 0){mangle += 360}}
    range = 5000
    if distance_to_point(obj_nav.x,obj_nav.y) <= range && room != ShipBuilder{
        if !collision_line(x,y,obj_nav.x,obj_nav.y,par_enemysolid,false,true){
            
            
            
            
            
            mi = 0//   min
            ma = 179// max
            
            if mangle <= ma && mangle >= mi{
                image_speed = 0
                for (i = 0;i <= image_number;i ++){
                    if mangle <= ((i+1)/image_number)*180 + mi && mangle >= mi + (i/image_number)*180{image_index = image_number - 1 - i}
                }
                if shoot = 1{
                    shoot = 0
                    alarm[1] = 10
                    //ds_list_add(obj_laser_control.elaser_x,x)
                    //ds_list_add(obj_laser_control.elaser_y,y)
                    //ds_list_add(obj_laser_control.elaser_angle,point_direction(x,y,obj_nav.x,obj_nav.y))
                    //ds_list_add(obj_laser_control.elaser_hv,obj_enav.curh+lengthdir_x(15,point_direction(x,y,obj_nav.x,obj_nav.y)))
                    //ds_list_add(obj_laser_control.elaser_vv,obj_nav.curv+lengthdir_y(15,point_direction(x,y,obj_nav.x,obj_nav.y)))
                    //ds_list_add(obj_laser_control.elaser_time,250)
                    instance_create(x,y,obj_elaser)
                }
            }
        }
    }
}





