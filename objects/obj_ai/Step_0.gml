/// @description AI
if instance_number(obj_player.navLink) != 0{
    with(enavLink){
        tcurh = curh
        tcurv = curv
        
        closeness = 400
        
        if abs(point_distance(x+curh,y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness) > 10{
            
            vel = abs(point_distance(x+curh,y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness)//abs(curh) + abs(curv)
            velnum = 0
            
            
            
            //velup
            curh -= (lengthdir_x(movespeed*thrust_up,image_angle - 90))
            curv -= (lengthdir_y(movespeed*thrust_up,image_angle - 90))
            
            targup = abs(point_distance(x+curh,y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness)//velup = abs(curh) + abs(curv)
            
            if thrust_up = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //veldown
            curh += (lengthdir_x(movespeed*thrust_down,image_angle - 90))
            curv += (lengthdir_y(movespeed*thrust_down,image_angle - 90))
            
            targdown = abs(point_distance(x+curh,y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness)//veldown = abs(curh) + abs(curv)
            
            if thrust_down = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //velleft
            curh -= (lengthdir_x(movespeed*thrust_left,image_angle))
            curv -= (lengthdir_y(movespeed*thrust_left,image_angle))
            
            targleft = abs(point_distance(x+curh,y+curv,obj_player.navLink.x,obj_player.navLink.y) - closeness)//velleft = abs(curh) + abs(curv)
            
            if thrust_left = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //velright
            curh += (lengthdir_x(movespeed*thrust_right,image_angle))
            curv += (lengthdir_y(movespeed*thrust_right,image_angle))
            
            targright = abs(distance_to_point(obj_player.navLink.x+curh,obj_player.navLink.y+curv) - closeness)//velright = abs(curh) + abs(curv)
            
            if thrust_right = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            
            
            if targup < vel{
                //vsp = -movespeed*(instance_number(obj_ethrustup))
                key_up = -1
                velnum ++
            }else{key_up = 0}
            if targdown < vel{
                //vsp = movespeed*(instance_number(obj_ethrustdown))
                key_down = 1
                velnum ++
            }else{key_down = 0}
            if targleft < vel{
                //hsp = -movespeed*(instance_number(obj_ethrustleft))
                key_left = -1
                velnum ++
            }else{key_left = 0}
            if targright < vel{
                //hsp = movespeed*(instance_number(obj_ethrustright))
                key_right = 1
                velnum ++
            }else{key_right = 0}
            
            if velnum = 0{
                curh = 0
                curv = 0
            }
        }
        
        
        //Rotation
        
        
        if image_angle > point_direction(x,y,obj_player.navLink.x,obj_player.navLink.y) + 30{// When clockwise
            key_cw = -1
        }else {key_cw = 0}
        
        if image_angle < point_direction(x,y,obj_player.navLink.x,obj_player.navLink.y) - 30{// When counterclockwise
            key_ccw = 1
        }else{key_ccw = 0}
        
        
        
        key_up = -1
        
    }
}
    


