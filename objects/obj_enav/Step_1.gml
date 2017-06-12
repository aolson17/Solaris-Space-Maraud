/// @description  Main

/*//lateral movement
key_right = keyboard_check(ord("J"));
key_left = -keyboard_check(ord("G"));
key_down = keyboard_check(ord("H"));
key_up = -keyboard_check(ord("Y"));
//rotational movement
key_cw = -keyboard_check(ord("U"));
key_ccw = keyboard_check(ord("T"));*/

movespeed = .2// level of speed each thruster gives
rotatespeed = .03// level of rotation each thrusther gives

moveh = key_left + key_right;
movev = key_up + key_down;
if moveh > 0{
hsp = (moveh)*movespeed*(instance_number(obj_ethrustright));
} else if moveh < 0 {
hsp = (moveh)*movespeed*(instance_number(obj_ethrustleft));
}else if moveh = 0 {hsp = 0}
if movev > 0{
vsp = (movev)*movespeed*(instance_number(obj_ethrustdown));
} else if movev < 0 {
vsp = (movev)*movespeed*(instance_number(obj_ethrustup));
}else if movev = 0 {vsp = 0}

//rotational movement
thrust_cw = 0
thrust_ccw = 0
with(par_ethrust){
    if posx = "right"{
        if posy = "down"{ // lower right
            if object_index = obj_ethrustleft{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustright{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustup{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
        } else if posy = "up"{// upper right
            if object_index = obj_ethrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustright{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustup{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustdown{other.thrust_cw += 1; rotpos = "cw"}
        }
    }else if posx = "left"{
        if posy = "down"{ // lower left
            if object_index = obj_ethrustleft{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustright{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustup{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
        } else if posy = "up"{// upper left
            if object_index = obj_ethrustleft{other.thrust_ccw += 1; rotpos = "ccw"}
            if object_index = obj_ethrustright{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustup{other.thrust_cw += 1; rotpos = "cw"}
            if object_index = obj_ethrustdown{other.thrust_ccw += 1; rotpos = "ccw"}
        }
}   }
mover = key_cw + key_ccw;
if mover > 0{
rsp = (mover)*rotatespeed*(thrust_ccw);
} else if mover < 0 {
rsp = (mover)*rotatespeed*(thrust_cw);
}else if mover = 0 {rsp = 0}


// Stop Ship Laterally
if keyboard_check(ord("N")){
    tcurh = curh
    tcurv = curv
    if curv != 0 || curh != 0{
        
        vel = abs(curh) + abs(curv)
        velnum = 0
        
        //velup
        curh -= (lengthdir_x(movespeed*(instance_number(obj_ethrustup)),image_angle - 90))
        curv -= (lengthdir_y(movespeed*(instance_number(obj_ethrustup)),image_angle - 90))
        
        velup = abs(curh) + abs(curv)
        if instance_number(obj_ethrustup) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //veldown
        curh += (lengthdir_x(movespeed*(instance_number(obj_ethrustdown)),image_angle - 90))
        curv += (lengthdir_y(movespeed*(instance_number(obj_ethrustdown)),image_angle - 90))
        
        veldown = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustdown) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velleft
        curh -= (lengthdir_x(movespeed*(instance_number(obj_ethrustleft)),image_angle))
        curv -= (lengthdir_y(movespeed*(instance_number(obj_ethrustleft)),image_angle))
        velleft = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustleft) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velright
        curh += (lengthdir_x(movespeed*(instance_number(obj_ethrustright)),image_angle))
        curv += (lengthdir_y(movespeed*(instance_number(obj_ethrustright)),image_angle))
        velright = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustright) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        
        
        if velup < vel{
            vsp = -movespeed*(instance_number(obj_ethrustup))
            velnum ++
        }
        if veldown < vel{
            vsp = movespeed*(instance_number(obj_ethrustdown))
            velnum ++
        }
        if velleft < vel{
            hsp = -movespeed*(instance_number(obj_ethrustleft))
            velnum ++
        }
        if velright < vel{
            hsp = movespeed*(instance_number(obj_ethrustright))
            velnum ++
        }
        
        if velnum = 0{
            curh = 0
            curv = 0
        }
    }
}

//add horizontal speed
curh += lengthdir_x(hsp,image_angle)
curv += lengthdir_y(hsp,image_angle)

//add vertical speed
curh += lengthdir_x(vsp,image_angle - 90)
curv += lengthdir_y(vsp,image_angle - 90)

//add rotational speed

// Stop Ship Rotation
if (keyboard_check(ord("N")) || keyboard_check(ord("M"))){
    if curr > 0{// When clockwise
        rsp = -rotatespeed*(thrust_ccw)
        if curr < 0 && curr > -thrust_ccw{
        curr = 0
    }
    }
    if curr < 0{// When counterclockwise
        rsp = rotatespeed*(thrust_cw)
        if curr < 0 && curr > thrust_cw{
        curr = 0
    }
    }   
    
}
curr += rsp;

global.curh = curh
global.curv = curv
global.curr = curr
global.hsp = hsp
global.vsp = vsp
global.rsp = rsp

// check rotation collision
prevangle = image_angle
if floor(curr) == -1{
    adjcurr = ceil(curr*10) / 10
    orbit_angle += ceil(curr*10) / 10;
    //orbit_angle += ceil(curr)
}else{
    adjcurr = floor(curr*10) / 10
    orbit_angle += floor(curr*10) / 10;
    //orbit_angle += floor(curr)
}
image_angle = floor(orbit_angle*10)/10
if room != ShipBuilder{
with (par_enemy){

idealr = ang + other.orbit_angle

angle = point_direction(obj_enav.x,obj_enav.y,x,y) + floor(other.curr)

//x = obj_nav.x+lengthdir_x(dis,angle);
//y = obj_nav.y+lengthdir_y(dis,angle);

if object_index != obj_player{
x = obj_enav.x+lengthdir_x(dis,idealr);
y = obj_enav.y+lengthdir_y(dis,idealr);
}



image_angle = other.image_angle//idealr//other.orbit_angle

}
with (par_enemysolid){
if object_index != obj_player and object_index != obj_enav{

idealr = ang + other.orbit_angle

angle = point_direction(obj_enav.x,obj_enav.y,x,y) + floor(other.curr)

//x = obj_nav.x+lengthdir_x(dis,angle);
//y = obj_nav.y+lengthdir_y(dis,angle);

x = obj_enav.x+lengthdir_x(dis,idealr);
y = obj_enav.y+lengthdir_y(dis,idealr);

image_angle = other.image_angle//idealr

}}
}

// check collision x
//if !collision_rectangle(instance_nearest(-room_width,y,par_flyablesolid).x + curh,instance_nearest(x,-room_height,par_flyablesolid).y,instance_nearest(room_width*2,y,par_flyablesolid).x + curh + 5,instance_nearest(x,room_height*2,par_flyablesolid).y,par_enemy,false,true) {

if borders = 1{
if x + curh > left && x + curh < right{
with (par_enemysolid){

// Allow thrusters to recieve updated hsp and vsp
hsp = other.hsp
curh = other.curh


x += round(curh)

}
with (par_enemy){
curh = other.curh


x += round(curh)

}}else {curh = 0}}/*if borders don't = 1 */else{
with (par_enemysolid){

// Allow thrusters to recieve updated hsp and vsp
hsp = other.hsp
curh = other.curh


x += round(curh)

}
with (par_enemy){
curh = other.curh


x += round(curh)

}}/*Done with toggled borders*/


// check collision y
//if !collision_rectangle(instance_nearest(-room_width,y,par_flyablesolid).x,instance_nearest(x,-room_height,par_flyablesolid).y + curv,instance_nearest(room_width*2,y,par_flyablesolid).x,instance_nearest(x,room_height*2,par_flyablesolid).y + curv + 5,par_enemy,false,true) {

if borders = 1{
if y + curv > top && y + curv < bottom{
with (par_enemysolid){

// Allow thrusters to recieve updated hsp and vsp
curv = other.curv
vsp = other.vsp

y += round(curv)

}
with (par_enemy){

curv = other.curv

y += round(curv)

}}else {curv = 0}}/*if borders don't = 1 */else{
with (par_enemysolid){

// Allow thrusters to recieve updated hsp and vsp
vsp = other.vsp
curv = other.curv

y += round(curv)

}
with (par_enemy){

curv = other.curv

y += round(curv)

}}/*Done with toggled borders*/

// turn thrusters on
with(par_ethrust){

if other.rsp > 0 && rotpos = "ccw"{
    image_index = 1
}else if other.rsp < 0 && rotpos = "cw"{
    image_index = 1
}else if other.hsp < 0 && (object_index = obj_ethrustleft){
    image_index = 1 
}else if other.hsp > 0 && (object_index = obj_ethrustright){
    image_index = 1 
}else if other.vsp < 0 && (object_index = obj_ethrustup){
    image_index = 1
}else if other.vsp > 0 && (object_index = obj_ethrustdown){
    image_index = 1
} else {
    image_index = 0
}

}



/* */
///AI
if instance_number(obj_nav) != 0{

    tcurh = curh
    tcurv = curv
    
    closeness = 400
    
    if abs(point_distance(x+curh,y+curv,obj_nav.x,obj_nav.y) - closeness) > 10{
        
        vel = abs(point_distance(x+curh,y+curv,obj_nav.x,obj_nav.y) - closeness)//abs(curh) + abs(curv)
        velnum = 0
        
        
        
        //velup
        curh -= (lengthdir_x(movespeed*(instance_number(obj_ethrustup)),image_angle - 90))
        curv -= (lengthdir_y(movespeed*(instance_number(obj_ethrustup)),image_angle - 90))
        
        targup = abs(point_distance(x+curh,y+curv,obj_nav.x,obj_nav.y) - closeness)//velup = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustup) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //veldown
        curh += (lengthdir_x(movespeed*(instance_number(obj_ethrustdown)),image_angle - 90))
        curv += (lengthdir_y(movespeed*(instance_number(obj_ethrustdown)),image_angle - 90))
        
        targdown = abs(point_distance(x+curh,y+curv,obj_nav.x,obj_nav.y) - closeness)//veldown = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustdown) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velleft
        curh -= (lengthdir_x(movespeed*(instance_number(obj_ethrustleft)),image_angle))
        curv -= (lengthdir_y(movespeed*(instance_number(obj_ethrustleft)),image_angle))
        
        targleft = abs(point_distance(x+curh,y+curv,obj_nav.x,obj_nav.y) - closeness)//velleft = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustleft) = 0 {velnum ++}
        curh = tcurh
        curv = tcurv
        //velright
        curh += (lengthdir_x(movespeed*(instance_number(obj_ethrustright)),image_angle))
        curv += (lengthdir_y(movespeed*(instance_number(obj_ethrustright)),image_angle))
        
        targright = abs(distance_to_point(obj_nav.x+curh,obj_nav.y+curv) - closeness)//velright = abs(curh) + abs(curv)
        
        if instance_number(obj_ethrustright) = 0 {velnum ++}
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
    
    
    if image_angle > point_direction(x,y,obj_nav.x,obj_nav.y) + 30{// When clockwise
        key_cw = -1
    }else {key_cw = 0}
    }
    if image_angle < point_direction(x,y,obj_nav.x,obj_nav.y) - 30{// When counterclockwise
        key_ccw = 1
    }else{key_ccw = 0}
    
    
    
    
    
    
    
    
    


/* */
/*  */
