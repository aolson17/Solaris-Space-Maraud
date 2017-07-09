/// @description Movement
if global.inship = 0 {

if(device_mouse_x_to_gui(0)>view_get_wport(0)/2) {
    face = 1
} else {
    face = -1
}


//Variables
grav = .6
jumpspeed = 15
jumpstoprate = .8
wallJumpX = 3
wallJumpY = 12
acceleration = .2
fallspeed = 30
xfriction = .3
airResistance = .1
stepheight = 8
airMovePercent = .1
stepSpeedPercent = .3
slowSpeed = 1
walkspeed = 3
sprintspeed = 6
movespeed = walkspeed*!keyboard_check(vk_shift)*!keyboard_check(ord("V")) + sprintspeed*keyboard_check(vk_shift) + slowSpeed*!keyboard_check(vk_shift)*keyboard_check(ord("V"))

//Movement
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);

move = key_left + key_right;
hsp = move * movespeed*acceleration;

if (cury < fallspeed)cury += grav ;//Apply Gravity

if (place_meeting(x,y+1,par_wall)||place_meeting(x,y-1,par_wall)){
    if place_meeting(x,y-1,par_wall){// stop jump at ceiling
        jump = 0
    }
    if place_meeting(x,y+1,par_wall)&&cury >0{
        cury = 0
    }
    if place_meeting(x,y-1,par_wall)&&cury <0{
        cury = 0
    }
}

//Set Jump State
vsp = 0
if key_jump{
    if place_meeting(x,y+1,par_wall){
        jump = 1
        vsp = key_jump * -jumpspeed
    }
}

//Manage Jump
if jump = 1{
    if cury > 0{//if falling
        jump = 0
    }else if !key_jump{
        cury *= jumpstoprate
        jump = 0
    }
}


if cury < -jumpspeed {// Limit jump speed
    cury = -jumpspeed
}

if crouchJumpReady = 1{// if switching out of crouch
    cury += vsp*3// apply crouch jump
}else{
    cury += vsp// apply jump
}

if crouch=0&& cury>0&&move!=0{// wall slide
    if collision_point(x+1+sprite_width/2,y+sprite_height/2,par_wall,true,true)&&collision_point(x+1+sprite_width/2,y-sprite_height/2,par_wall,true,true){// wall slide right
        cury=clamp(cury,-100,2)
        scr_wallslide_right()
        
        // wall jump
        if keyboard_check_pressed(vk_space){
            curx -= wallJumpX
            cury -= wallJumpY
        }
    }
    if collision_point(x-1-sprite_width/2,y+sprite_height/2,par_wall,true,true)&&collision_point(x-1-sprite_width/2,y-sprite_height/2,par_wall,true,true){// wall slide left
        cury=clamp(cury,100,2)
        scr_wallslide_left()
        
        // wall jump
        if keyboard_check_pressed(vk_space){
            curx += wallJumpX
            cury -= wallJumpY
        }
    }
}

if hsp > 0{//limit speed right
    if curx+hsp <= movespeed{
        curx += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
    }
}else if hsp < 0{// limit speed left
    if curx+hsp >= -movespeed{
        curx += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
    }
}
if curx+hsp <= movespeed && curx+hsp >= -movespeed{// Limit run speed
    curx += (place_meeting(x,y+1,par_wall))*hsp +((1-place_meeting(x,y+1,par_wall))*airMovePercent*hsp)
}else if curx <= movespeed+(movespeed*acceleration) && curx >= -movespeed-(movespeed*acceleration){
    if curx > 0{
        curx+= abs(movespeed-abs(curx))
    }else if curx < 0{
        curx-= abs(movespeed-abs(curx))
    }
}
if (place_meeting(x,y+1,par_wall)){//apply friction
    
    if curx > 0 && move<=0{
        curx -= curx*xfriction
    }else if curx < 0 && move>=0{
        curx -= curx*xfriction
    }
    if curx <= 1 && curx >= -1 && curx != 0 && move = 0{curx = 0}
}else{// apply air resistance
    if curx > 0 && move<=0{
        curx -= airResistance
    }else if curx < 0 && move>=0{
        curx += airResistance
    }
    if curx <= .3 && curx >= -.3 && curx != 0 && move = 0{curx = 0}
}


// Horizontal Collision
if place_meeting(x+curx,y,par_wall){
    if move != 0 && place_meeting(x,y+1,par_wall){// Only step up if keys are pressed
        for (i = 0; i <= stepheight; i += 1){
            if place_meeting(x+curx,y-i,par_wall){
                //Pixel Perfect Collision
                if !place_meeting(x+sign(curx),y-i,par_wall){
                    if place_meeting(x+sign(curx),y-i,par_wall){
                        //move horizontally 1 pixel and up
                        x += sign(curx)
                        y -= i
                    }
                }
            }else{
                //move horizontally and up ramp
                //lower speed when walking up step
                curx = clamp(curx,-movespeed*stepSpeedPercent,movespeed*stepSpeedPercent)
                x += curx
                y -= i
                break
            }
        }
    }
    //No vertical movement
    //Pixel Perfect Collision
    for (i = abs(floor(curx)); i > 0; i -= 1){
        if place_meeting(x + sign(curx) * i,y,par_wall){
        }else{
            
            x += sign(curx) * i
            
            break
        }
    }    
    
    
}else{
    //move horizontally
    x += curx
}

if place_meeting(x+sign(curx),y,par_wall){// set curx to 0 if against wall
    curx = 0
}

//Vertical Collision
if place_meeting(x,y+cury,par_wall){
    //Pixel Perfect Collision
    for (i = abs(floor(cury)); i > 0; i -= 1){
        if place_meeting(x,y + sign(cury) * i,par_wall){
        }else{
            if (place_meeting(x,y + sign(cury) * i,par_wall)){
                if sign(cury) < 0{cury = 0}
            }
            
            y += sign(cury) * i
            break
        }
    }    
}else{
    //move vertically
    y+=cury
}

if keyboard_check_pressed(vk_control){// manage crouching
    if crouch = 1{// if switching out of crouch
        if !collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top-(sprite_get_height(spr_char_stand) - sprite_get_height(spr_char_crouch)),par_wall,true,true){
            if place_meeting(x,y+sprite_get_height(spr_char_stand) - sprite_get_height(spr_char_crouch),par_wall){
                collisionobj = instance_place(x,y+sprite_get_height(spr_char_stand) - sprite_get_height(spr_char_crouch),par_wall)
                if place_meeting(x,y+(sprite_get_height(spr_char_stand) - sprite_get_height(spr_char_crouch))/3,par_wall){
                    collisionobj = instance_place(x,y+(sprite_get_height(spr_char_stand) - sprite_get_height(spr_char_crouch))/3,par_wall)
                }
                y= collisionobj.bbox_top - sprite_get_height(spr_char_stand)/2
            }
            crouch = 1-crouch  
            crouchJumpReady = 1
            alarm[2]=5
        }
    }else{// if switching to crouch
        crouch = 1-crouch
    }
    
}

if (crouch = 1 &&(cury < 3 || cury > -3)){
	mask_index = spr_char_mask_crouch
    if face = 1 {sprite_index = spr_char_crouch} else{
    sprite_index = spr_char_crouch_left}
}else if (hsp > 0.1 || hsp < -.1){
	mask_index = spr_char_mask
    if face = 1 {sprite_index = spr_char_run} else{
    sprite_index = spr_char_run_left}
}else if cury > 3{
	mask_index = spr_char_mask_fall
    if face = 1 {sprite_index = spr_char_fall} else{
    sprite_index = spr_char_fall_left}
}else if cury < -3{
	mask_index = spr_char_mask_jump
    if face = 1 {sprite_index = spr_char_jump} else{
    sprite_index = spr_char_jump_left}
}else {
	mask_index = spr_char_mask
    if face = 1 {sprite_index = spr_char_stand} else{
    sprite_index = spr_char_stand_left}
}

scr_bad_collision()



image_speed = .2//hsp * .04


}else {//When Controlling Ship
    sprite_index = spr_playertyping
    image_speed = .1
	
	with(navLink){
		//other.rotated_navLink_x = scr_rotated(x)
		//other.rotated_navLink_y = scr_rotated(y)
	}
	
    //x = rotated_navLink_x
   // y = rotated_navLink_y
}

ang = point_direction(x,y,navLink.x,navLink.y)
dis = point_distance(x, y, navLink.x, navLink.y)

x = round(x)
y = round(y)


///Spawn Ship


if keyboard_check(vk_shift){// create a new ship
    if keyboard_check_pressed(ord("1")){
        scr_loadship_mult(ds_list_find_value(global.shipname,0),true)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
    if keyboard_check_pressed(ord("2")){
        scr_loadship_mult(ds_list_find_value(global.shipname,1),true)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
    if keyboard_check_pressed(ord("3")){
        scr_loadship_mult(ds_list_find_value(global.shipname,2),true)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
}else{
    if keyboard_check_pressed(ord("1")){
        scr_loadship_mult(ds_list_find_value(global.shipname,0),false)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
    if keyboard_check_pressed(ord("2")){
        scr_loadship_mult(ds_list_find_value(global.shipname,1),false)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
    if keyboard_check_pressed(ord("3")){
        scr_loadship_mult(ds_list_find_value(global.shipname,2),false)
        with(obj_inv_locker){instance_destroy()}
        obj_control.alarm[0] = 20
    }
}

///Parallax
__background_set( e__BG.X, 0, round(__view_get( e__VW.XView, 0 )/zoom * .5 ))
__background_set( e__BG.X, 1, round(__view_get( e__VW.XView, 0 )/zoom * .3 ))

__background_set( e__BG.Y, 0, __view_get( e__VW.YView, 0 )/zoom * .5 )
__background_set( e__BG.Y, 1, __view_get( e__VW.YView, 0 )/zoom * .3 )

///Rest

if global.sleeping = 1 {
    visible = false
    if position_meeting(x,y + 12,obj_bed){
        x = obj_bed.x + 6
        y = obj_bed.y - 6
    } else if position_meeting(x,y + 12,obj_beds){
        x = obj_beds.x + 6
        y = obj_beds.y - 6
    }
} else {
    visible = true
}

///Generation

if room = Land{

if x < 0{// Go left

global.tall[global.numb] = obj_fragleft.x

global.lr[global.numb] = "left"

global.numb ++


room_restart()
}

if x > room_width{// Go right

global.tall[global.numb] = obj_fragright.x
global.lr[global.numb] = "right"
global.numb ++

room_restart()
}
}

///View

// Allow view to leave room
if room = Land || room = Sector || room = Enemy || room = Enemy2 || room = Overview{



//Zoom

view = 0

minz = .5
maxz = 8

if mouse_wheel_up() {
    if zoom > minz{
        zoom -= .1
    }
}

if mouse_wheel_down() {
    if zoom < maxz{
        zoom += .1
    }
}

__view_set( e__VW.WView, view, vew * zoom )
__view_set( e__VW.HView, view, veh * zoom )


__view_set( e__VW.XView, 0, navLink.x+lengthdir_x(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10)-(vew * zoom/2) );
__view_set( e__VW.YView, 0, navLink.y+lengthdir_y(point_distance(x, y, navLink.x, navLink.y),point_direction(navLink.x,navLink.y,x,y) + round(navLink.orbit_angle*10)/10)-(veh * zoom/2) );


__view_set( e__VW.Angle, 0, -round(navLink.orbit_angle*10)/10 )



}


///Find Position on GUI
scr_find_gui()

