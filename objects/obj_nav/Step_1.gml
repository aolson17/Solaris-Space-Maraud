/// @description Construction Movement

if room = ShipBuilder{
mask_index = spr_nav_mask

if mouse_check_button_pressed(mb_left) and mouse_x < x + sprite_width / 2 and mouse_x > x - sprite_width / 2 and mouse_y < y + sprite_height / 2 and mouse_y > y - sprite_height / 2{
    if hold = 0{
        conx = x
        cony = y
        hold = 1
    }
}
if mouse_check_button_released(mb_left) and mouse_x < x + sprite_width / 2 and mouse_x > x - sprite_width / 2 and mouse_y < y + sprite_height / 2 and mouse_y > y - sprite_height / 2{
    if hold = 1{
        if collide = 1{
            x = conx
            y = cony
        }
        hold = 0
        collide = 0
    }
} 
    
if hold = 1{
    x = mouse_x
    y = mouse_y
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
    image_speed = 0
    //Collision
    if collision_rectangle(x - sprite_width / 2,y - sprite_height / 2,x + sprite_width / 2 - 1,y+sprite_height / 2 - 1,par_wall,true,true) || collision_rectangle(x - sprite_width / 2,y - sprite_height / 2,x + sprite_width / 2 - 1,y+sprite_height / 2 - 1,par_obj,true,true){
        collide = 1
    }else{
        collide = 0
    }
}


}else{
    mask_index = spr_nav_floormask
}



/// Main
if room!=ShipBuilder{
movespeed = .2// level of speed each thruster gives
rotatespeed = .03// level of rotation each thrusther gives
thrust_cw = 0
thrust_ccw = 0
thrust_up = 0
thrust_down = 0
thrust_left = 0
thrust_right = 0

if ds_list_find_index(global.playership, id) != -1{// if in playership
if inship = 1{
//lateral movement
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_up = -keyboard_check(ord("W"));
//rotational movement
key_cw = -keyboard_check(ord("E"));
key_ccw = keyboard_check(ord("Q"));

thrust_cw = 0
thrust_ccw = 0
thrust_up = 0
thrust_down = 0
thrust_left = 0
thrust_right = 0

for(i=0;i<=ds_list_size(global.playership);i++){
    with(ds_list_find_value(global.playership,i)){
        if object_is_ancestor(object_index, par_thrust){
            
            if object_index = obj_thrustleft{other.thrust_left += 1}
            if object_index = obj_thrustright{other.thrust_right += 1}
            if object_index = obj_thrustup{other.thrust_up += 1}
            if object_index = obj_thrustdown{other.thrust_down += 1}
            
            if posx = "right"{
                if posy = "down"{ // lower right
                    if object_index = obj_thrustleft{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustright{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustup{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                } else if posy = "up"{// upper right
                    if object_index = obj_thrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustright{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustup{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustdown{other.thrust_cw += 1; rotpos = "cw"}
                }
            }else if posx = "left"{
                if posy = "down"{ // lower left
                    if object_index = obj_thrustleft{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustright{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustup{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                } else if posy = "up"{// upper left
                    if object_index = obj_thrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
                    if object_index = obj_thrustright{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustup{other.thrust_cw += 1; rotpos = "cw"}
                    if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                }
            }
        }
    }
}


//lateral movement
moveh = key_left + key_right;
movev = key_up + key_down;
if moveh > 0{
hsp = (moveh)*movespeed*(thrust_right);
} else if moveh < 0 {
hsp = (moveh)*movespeed*(thrust_left);
}else if moveh = 0 {hsp = 0}
if movev > 0{
vsp = (movev)*movespeed*(thrust_down);
} else if movev < 0 {
vsp = (movev)*movespeed*(thrust_up);
}else if movev = 0 {vsp = 0}
//rotational movement
mover = key_cw + key_ccw;
if mover > 0{
rsp = (mover)*rotatespeed*(thrust_ccw);
} else if mover < 0 {
rsp = (mover)*rotatespeed*(thrust_cw);
}else if mover = 0 {rsp = 0}

// Stop Ship Laterally
if keyboard_check(vk_space){
    tcurh = curh
    tcurv = curv
    if curv != 0 || curh != 0{
        
        vel = abs(curh) + abs(curv)
        velnum = 0
        
        //velup
        curh -= (lengthdir_x(movespeed*(thrust_up),orbit_angle - 90))
        curv -= (lengthdir_y(movespeed*(thrust_up),orbit_angle - 90))
        
        velup = abs(curh) + abs(curv)
        if thrust_up = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //veldown
        curh += (lengthdir_x(movespeed*(thrust_down),orbit_angle - 90))
        curv += (lengthdir_y(movespeed*(thrust_down),orbit_angle - 90))
        veldown = abs(curh) + abs(curv)
        
        if thrust_down = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velleft
        curh -= (lengthdir_x(movespeed*(thrust_left),orbit_angle))
        curv -= (lengthdir_y(movespeed*(thrust_left),orbit_angle))
        velleft = abs(curh) + abs(curv)
        
        if thrust_left = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velright
        curh += (lengthdir_x(movespeed*(thrust_right),orbit_angle))
        curv += (lengthdir_y(movespeed*(thrust_right),orbit_angle))
        velright = abs(curh) + abs(curv)
        
        if thrust_right = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        
        if velup < vel{
            vsp = -movespeed*(instance_number(obj_thrustup))
            velnum ++
        }
        if veldown < vel{
            vsp = movespeed*(instance_number(obj_thrustdown))
            velnum ++
        }
        if velleft < vel{
            hsp = -movespeed*(instance_number(obj_thrustleft))
            velnum ++
        }
        if velright < vel{
            hsp = movespeed*(instance_number(obj_thrustright))
            velnum ++
        }
        
        if velnum = 0{
            curh = 0
            curv = 0
        }
    }
}

// Stop Ship Rotation
if (keyboard_check(vk_space) || keyboard_check(vk_lalt)){
    if curr > 0{// When counterclockwise
        rsp = -rotatespeed*(thrust_cw)
        if curr < 0 && curr > -thrust_cw{
            curr = 0
        }
    }
    if curr < 0{// When clockwise
        rsp = rotatespeed*(thrust_ccw)
        if curr < 0 && curr > thrust_ccw{
            curr = 0
        }
    }   
}

//add horizontal speed 
curh += lengthdir_x(hsp,orbit_angle)
curv += lengthdir_y(hsp,orbit_angle)

//add vertical speed
curh += lengthdir_x(vsp,orbit_angle - 90)
curv += lengthdir_y(vsp,orbit_angle - 90)

curr += rsp
}

if floor(curr) == -1{
    orbit_angle += ceil(curr*10) / 10;
}else{
    orbit_angle += floor(curr*10) / 10;
}
//image_angle = round(orbit_angle*10)/10

x += round(curh)
y += round(curv)

has_moved_player = 0
for(i=0;i<=ds_list_size(global.playership);i++){
    with(ds_list_find_value(global.playership,i)){
        if object_index = obj_ai{
			ds_list_delete(global.playership,other.i)
			break
		}
        
        if object_index != obj_player{
			hsp = obj_player.navLink.hsp
			vsp = obj_player.navLink.vsp
            curh = obj_player.navLink.curh
            curv = obj_player.navLink.curv
        }
        if object_index != obj_player and object_index != obj_nav{
            
            
            
            //idealr = ang + navLink.orbit_angle
            //angle = point_direction(navLink.x,navLink.y,x,y) + floor(navLink.curr)
            
            x = navLink.x+lengthdir_x(dis,ang);
            y = navLink.y+lengthdir_y(dis,ang);
        }
        
        //image_angle = navLink.image_angle
        
        if other.inship=1{
            if object_get_parent(object_index) = par_thrust{// turn thrusters on
                if navLink.rsp > 0 && rotpos = "ccw"{
                    image_index = 1
                }else if navLink.rsp < 0 && rotpos = "cw"{
                    image_index = 1
                }else if navLink.hsp < 0 && (object_index = obj_thrustleft){
                    image_index = 1 
                }else if navLink.hsp > 0 && (object_index = obj_thrustright){
                    image_index = 1 
                }else if navLink.vsp < 0 && (object_index = obj_thrustup){
                    image_index = 1
                }else if navLink.vsp > 0 && (object_index = obj_thrustdown){
                    image_index = 1
                } else {
                    image_index = 0
                }
            }
        }
        if object_index = obj_player{
			if other.has_moved_player = 0{
	            //x = navLink.x + lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + navLink.adjcurr);
	            //y = navLink.y + lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + navLink.adjcurr);
				x += round(navLink.curh)
				y += round(navLink.curv)
				other.has_moved_player = 1
			}
        }
        
    }
}
}else if ds_list_find_index(global.enemyship, id) != -1{// If part of an enemy ship

    
    for(i=0;i<=ds_list_size(global.enemyship);i++){
        with(ds_list_find_value(global.enemyship,i)){
            if object_is_ancestor(object_index, par_thrust){
                
                if object_index = obj_thrustleft{other.thrust_left += 1}
                if object_index = obj_thrustright{other.thrust_right += 1}
                if object_index = obj_thrustup{other.thrust_up += 1}
                if object_index = obj_thrustdown{other.thrust_down += 1}
                
                if posx = "right"{
                    if posy = "down"{ // lower right
                        if object_index = obj_thrustleft{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustright{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustup{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                    } else if posy = "up"{// upper right
                        if object_index = obj_thrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustright{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustup{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustdown{other.thrust_cw += 1; rotpos = "cw"}
                    }
                }else if posx = "left"{
                    if posy = "down"{ // lower left
                        if object_index = obj_thrustleft{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustright{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustup{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                    } else if posy = "up"{// upper left
                        if object_index = obj_thrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
                        if object_index = obj_thrustright{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustup{other.thrust_cw += 1; rotpos = "cw"}
                        if object_index = obj_thrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
                    }
                }
            }
        }
    }
    
	
	//lateral movement
	moveh = key_left + key_right;
	movev = key_up + key_down;
	if moveh > 0{
	hsp = (moveh)*movespeed*(thrust_right);
	} else if moveh < 0 {
	hsp = (moveh)*movespeed*(thrust_left);
	}else if moveh = 0 {hsp = 0}
	if movev > 0{
	vsp = (movev)*movespeed*(thrust_down);
	} else if movev < 0 {
	vsp = (movev)*movespeed*(thrust_up);
	}else if movev = 0 {vsp = 0}
	//rotational movement
	mover = key_cw + key_ccw;
	if mover > 0{
	rsp = (mover)*rotatespeed*(thrust_ccw);
	} else if mover < 0 {
	rsp = (mover)*rotatespeed*(thrust_cw);
	}else if mover = 0 {rsp = 0}
	
    
    
	//add horizontal speed 
	curh += lengthdir_x(hsp,image_angle)
	curv += lengthdir_y(hsp,image_angle)

	//add vertical speed
	curh += lengthdir_x(vsp,image_angle - 90)
	curv += lengthdir_y(vsp,image_angle - 90)
	
	//add rotational speed
	curr += rsp
	
    x += curh
    y += curv
    
	
	if floor(curr) == -1{
	    orbit_angle += ceil(curr*10) / 10;
	}else{
	    orbit_angle += floor(curr*10) / 10;
	}
	//image_angle = round(orbit_angle*10)/10
    
    for(i=0;i<=ds_list_size(global.enemyship);i++){
        with(ds_list_find_value(global.enemyship,i)){
            
            
            if object_index != obj_player{
				hsp = other.hsp
				vsp = other.vsp
                curh = other.curh
                curv = other.curv
            }
            if object_index != obj_player and object_index != obj_nav{
                
                //idealr = ang + other.orbit_angle
                //angle = point_direction(other.x,other.y,x,y) + floor(other.curr)
                
                x = other.x+lengthdir_x(dis,ang);
                y = other.y+lengthdir_y(dis,ang);
            }
            
            if object_index != obj_player{
                image_angle = obj_ai.enavLink.image_angle
            }
            
            if object_get_parent(object_index) = par_thrust{// turn thrusters on
                if other.rsp > 0 && rotpos = "ccw"{
                    image_index = 1
                }else if other.rsp < 0 && rotpos = "cw"{
                    image_index = 1
                }else if other.hsp < 0 && (object_index = obj_thrustleft){
                    image_index = 1 
                }else if other.hsp > 0 && (object_index = obj_thrustright){
                    image_index = 1 
                }else if other.vsp < 0 && (object_index = obj_thrustup){
                    image_index = 1
                }else if other.vsp > 0 && (object_index = obj_thrustdown){
                    image_index = 1
                } else {
                    image_index = 0
                }
            }
        }
    }
}




}