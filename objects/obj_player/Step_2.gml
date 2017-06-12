/// @description Movement
if global.inship = 0 {



image_speed = .2//hsp * .04


if(device_mouse_x_to_gui(0) > __view_get( e__VW.WPort, 0 ) / 2) {
    face = 1
} else {
    face = -1
}


//Variables
grav = 1
jumpspeed = 19
movespeed = 5
acceleration = .2

//Movement
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);

move = key_left + key_right;
hsp = move * movespeed*acceleration;




//Jump
mask_index = spr_jump_mask
if (place_meeting(x+lengthdir_x(3,image_angle - 90),y+lengthdir_y(3,image_angle - 90),par_wall)){
    vsp = key_jump * -jumpspeed
} else{
    vsp = 0
}
mask_index = spr_player_mask

if vsp < -jumpspeed {
    vsp = -jumpspeed
}

cury += vsp
if (cury < 20)cury += grav ;//Apply Gravity

if curx+hsp < movespeed+(movespeed*acceleration) && curx+hsp > -movespeed-(movespeed*acceleration){
    curx += hsp
}
if hsp = 0 && (place_meeting(x+lengthdir_x(10,image_angle - 90),y+lengthdir_y(10,image_angle - 90),par_wall)){//apply friction
    if curx > 0{curx = curx - .5}
    if curx < 0{curx = curx + .5}
    if curx <= 1 && curx >= -1{curx = 0}
}


xpos = x
ypos = y
//move horizontally
x += lengthdir_x(curx,image_angle)
y += lengthdir_y(curx,image_angle)

// Horizontal Collision
if place_meeting(x,y,par_wall){
    
    x = xpos
    y = ypos


    //Check if sunken in block
    for (i = 0; i < 10; i += .1){// i < max step up
        x += lengthdir_x(curx,image_angle)
        y += lengthdir_y(curx,image_angle)
        x += lengthdir_x(i,image_angle + 90)
        y += lengthdir_y(i,image_angle + 90)
        if place_meeting(x,y,par_wall){
        
            x = xpos
            y = ypos
            
            //Pixel Perfect Collision
            x += lengthdir_x(sign(curx),image_angle)
            y += lengthdir_y(sign(curx),image_angle)
            if place_meeting(x,y,par_wall){
                
                var tempmask = mask_index
                mask_index = spr_hor_col_mask
                if place_meeting(x,y,par_wall){
                    curx = 0
                }
                mask_index = tempmask
                
                x = xpos
                y = ypos
            }
            
            
        }else{
            break
        }
    }
}

xpos = x
ypos = y
//move vertically
x += lengthdir_x(cury,image_angle - 90)
y += lengthdir_y(cury,image_angle - 90)

//Vertical Collision
if place_meeting(x,y,par_wall){
    x = xpos
    y = ypos
    
    //Pixel Perfect Collision
    for (i = abs(floor(cury)); i > 0; i -= 1){
        x += lengthdir_x(sign(cury) * i,image_angle - 90)
        y += lengthdir_y(sign(cury) * i,image_angle - 90)
        if place_meeting(x,y,par_wall){
            x = xpos
            y = ypos
        }else{
            mask_index = spr_fall_mask
            if (place_meeting(x,y,par_wall)){
                if sign(cury) < 0{cury = 0}
            }
            mask_index = spr_player_mask
            break
        }
    }
    mask_index = spr_fall_mask
            if (place_meeting(x,y,par_wall)){
                if sign(cury) < 0{cury = 0}
            }
    mask_index = spr_jump_mask
            if (place_meeting(x,y,par_wall)){
                if sign(cury) > 0{cury = 0}
            }
    mask_index = spr_player_mask
    
}






mask_index = spr_player_mask
if place_meeting(x,y,par_wall){

show_debug_message("Bad Collision")

xtemp = x
cxplus = 0
while place_meeting(x,y,par_wall){// +x check
    x += .1
    cxplus += .1
    if !place_meeting(x,y,par_wall){
    }
}
x = xtemp
cxminus = 0
while place_meeting(x,y,par_wall){// -x check
    x -= .1
    cxminus += .1
    if !place_meeting(x,y,par_wall){
    }
}
x = xtemp
ytemp = y
cyplus = 0
while place_meeting(x,y,par_wall){// +y check
    y += .1
    cyplus += .1
    if !place_meeting(x,y,par_wall){
    }
}
y = ytemp
cyminus = 0
while place_meeting(x,y,par_wall){// -y check
    y -= .1
    cyminus += .1
    if !place_meeting(x,y,par_wall){
    }
}
y = ytemp

if cxplus < cxminus && cxplus < cyplus && cxplus < cyminus{//cxplus is smallest
    x += cxplus
    show_debug_message("cxplus" + string(cxplus))
}else if cxminus < cxplus && cxminus < cyplus && cxminus < cyminus{//cxminus is smallest
    x -= cxminus
    show_debug_message("cxminus" + string(cxminus))
}else if cyplus < cyminus && cyplus < cxplus && cyplus < cxminus{//cyplus is smallest
    y += cyplus
    show_debug_message("cyplus" + string(cyplus))
}else if cyminus < cyplus && cyminus < cxplus && cyminus < cxminus{//cyminus is smallest
    y -= cyminus
    show_debug_message("cyminus" + string(cyminus))
}

}

if (hsp > 0.1 || hsp < -.1){
    if face = 1 {sprite_index = spr_player} else{
    sprite_index = spr_playerleft}
} else {
    if face = 1 {sprite_index = spr_playerstand} else{
    sprite_index = spr_playerstandleft}
}
if cury > 3 || cury < -3{
    if face = 1 {sprite_index = spr_playerjump} else{
    sprite_index = spr_playerjumpleft}
}



}else {//When Controlling Ship
    sprite_index = spr_playertyping
    image_speed = .1
    x = navLink.x
    y = navLink.y
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


__view_set( e__VW.XView, 0, x-(vew * zoom/2) );
__view_set( e__VW.YView, 0, y-(veh * zoom/2) );


__view_set( e__VW.Angle, 0, -image_angle )



}


///Find Position on GUI
scr_find_gui()

