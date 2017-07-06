/// @description AI
if instance_number(obj_player.navLink) != 0{
    with(enavLink){
		
        tcurh = curh
        tcurv = curv
        
        closeness = 1000
        
        if scr_ai_target("lateral") > 200{
            
            vel = scr_ai_target("lateral")
            velnum = 0
            
            
            
            //velup
            curh -= (lengthdir_x(movespeed*thrust_up,image_angle - 90))
            curv -= (lengthdir_y(movespeed*thrust_up,image_angle - 90))
            
            targup = scr_ai_target("lateral")
            
            if thrust_up = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //veldown
            curh += (lengthdir_x(movespeed*thrust_down,image_angle - 90))
            curv += (lengthdir_y(movespeed*thrust_down,image_angle - 90))
            
            targdown = scr_ai_target("lateral")
            
            if thrust_down = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //velleft
            curh -= (lengthdir_x(movespeed*thrust_left,image_angle))
            curv -= (lengthdir_y(movespeed*thrust_left,image_angle))
            
            targleft = scr_ai_target("lateral")
            
            if thrust_left = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            //velright
            curh += (lengthdir_x(movespeed*thrust_right,image_angle))
            curv += (lengthdir_y(movespeed*thrust_right,image_angle))
            
            targright = scr_ai_target("lateral")
            
            if thrust_right = 0 {velnum ++}
            curh = tcurh
            curv = tcurv
            
            
            if targup < vel{
				if scr_ai_target("lateral") > 300{
					key_up = -1
				}else{key_up = -1}
                velnum ++
            }else{key_up = 0}
            if targdown < vel{
                if scr_ai_target("lateral") > 300{
					key_down = 1
				}else{key_down = 1}
                velnum ++
            }else{key_down = 0}
            if targleft < vel{
                if scr_ai_target("lateral") > 300{
					key_left = -1
				}else{key_left = -1}
                velnum ++
            }else{key_left = 0}
            if targright < vel{
                if scr_ai_target("lateral") > 300{
					key_right = 1
				}else{key_right = 1}
                velnum ++
            }else{key_right = 0}
            
            if velnum = 0{
                curh = 0
                curv = 0
            }
        }else{// stop
			
			tcurh = curh
		    tcurv = curv
		    if curv != 0 || curh != 0{
        
		        vel = abs(curh) + abs(curv)
		        velnum = 0
        
		        //velup
		        curh -= (lengthdir_x(movespeed*(thrust_up),image_angle - 90))
		        curv -= (lengthdir_y(movespeed*(thrust_up),image_angle - 90))
        
		        velup = abs(curh) + abs(curv)
		        if thrust_up = 0 {velnum ++}
		        curh = tcurh
		        curv = tcurv
		        //veldown
		        curh += (lengthdir_x(movespeed*(thrust_down),image_angle - 90))
		        curv += (lengthdir_y(movespeed*(thrust_down),image_angle - 90))
		        veldown = abs(curh) + abs(curv)
        
		        if thrust_down = 0 {velnum ++}
		        curh = tcurh
		        curv = tcurv
		        //velleft
		        curh -= (lengthdir_x(movespeed*(thrust_left),image_angle))
		        curv -= (lengthdir_y(movespeed*(thrust_left),image_angle))
		        velleft = abs(curh) + abs(curv)
        
		        if thrust_left = 0 {velnum ++}
		        curh = tcurh
		        curv = tcurv
		        //velright
		        curh += (lengthdir_x(movespeed*(thrust_right),image_angle))
		        curv += (lengthdir_y(movespeed*(thrust_right),image_angle))
		        velright = abs(curh) + abs(curv)
        
		        if thrust_right = 0 {velnum ++}
		        curh = tcurh
		        curv = tcurv
        
		        if velup < vel{
		            vsp = -movespeed*(thrust_up)
		            velnum ++
		        }
		        if veldown < vel{
		            vsp = movespeed*(thrust_down)
		            velnum ++
		        }
		        if velleft < vel{
		            hsp = -movespeed*(thrust_left)
		            velnum ++
		        }
		        if velright < vel{
		            hsp = movespeed*(thrust_right)
		            velnum ++
		        }
        
		        if velnum = 0{
		            curh = 0
		            curv = 0
		        }
		    }
			
			
		}
        
        
		
        //Rotation
        
		if abs(orbit_angle+curr - obj_player.navLink.orbit_angle) > 2{
		
			turnchoice = "none"
		
			if orbit_angle+curr*3 < obj_player.navLink.orbit_angle{
				curr += (rotatespeed*thrust_ccw)
				turnchoice = "ccw"
			}
		
			if orbit_angle+curr*3 > obj_player.navLink.orbit_angle{
				curr -= (rotatespeed*thrust_cw)
				turnchoice = "cw"
			}
		
		
			for(i=0;i<=ds_list_size(global.enemyship);i++){// turn ccw thrusters on
				with(ds_list_find_value(global.enemyship,i)){
					if object_get_parent(object_index) = par_thrust{
			            if other.turnchoice = "none"{
							//image_index = 0
						}else if other.turnchoice = "ccw"{
							if rotpos = "ccw"{
				                image_index = 1
				            }else{
								//image_index = 0
							}
						}else if other.turnchoice = "cw"{
							if rotpos = "cw"{
				                image_index = 1
				            }else{
								//image_index = 0
							}
						}
					}
				}
			}
		}
		
    }
}
    


