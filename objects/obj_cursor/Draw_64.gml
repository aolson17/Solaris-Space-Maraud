/// @description Draw GUI

//draw_sprite(spr_cursor,0,mouse_x-view_xview[0], mouse_y-view_yview[0]) 

mx = device_mouse_x_to_gui(0)
my = device_mouse_y_to_gui(0)


//draw_sprite_ext(spr_cursor,0, mx, my,__view_get( e__VW.WPort, 0 )/__view_get( e__VW.WView, 0 ),__view_get( e__VW.WPort, 0 )/__view_get( e__VW.WView, 0 ),0,c_white,1)

draw_sprite_ext(spr_cursor,0,mx,my,1.5,1.5,0,c_white,1)


if keyboard_check(vk_rcontrol) && room != ShipBuilder{
draw_set_colour(c_white)
    draw_text(mx, my,string_hash_to_newline("X: " + string(device_mouse_x(0)) + " Y: " + string(device_mouse_y(0))))
    draw_text(mx,my + 10,string_hash_to_newline("curH: " + string(global.curh) + " curV: " + string(global.curv) + " curR: " + string(global.curr)))
    draw_text(mx,my + 20,string_hash_to_newline("hsp: " + string(global.hsp) + " vsp: " + string(global.vsp) + " rsp: " + string(global.rsp)))
    draw_text(mx,my + 40,string_hash_to_newline("ship angle: " + string(obj_nav.image_angle)))
    draw_text(mx,my + 50,string_hash_to_newline("Zoom: " + string(obj_player.zoom)))
    draw_text(mx,my + 100,string_hash_to_newline("thrust_cw: " + string(obj_player.navLink.thrust_cw)))
    draw_text(mx,my + 110,string_hash_to_newline("thrust_ccw: " + string(obj_player.navLink.thrust_ccw)))
}
/*if keyboard_check(ord("T")) && room != ShipBuilder{
draw_set_colour(c_white)
    draw_text(mx, my + 10,"X: " + string(device_mouse_x(0)) + " Y: " + string(device_mouse_y(0)))
    draw_text(mx,my + 20,"curH: " + string(global.curh) + " curV: " + string(global.curv) + " curR: " + string(global.curr))
}*/
if keyboard_check(vk_lalt) && room != ShipBuilder{
    draw_set_colour(c_white)
    draw_text(mx, my,string_hash_to_newline("xsp: " + string(obj_player.hsp) + " vsp: " + string(obj_player.vsp)))
    with (obj_player){
        draw_text(other.mx,other.my + 10,string_hash_to_newline("distance: " + string(point_distance(x, y, obj_nav.x, obj_nav.y))))
        //draw_text(other.mx,other.my + 20,"pdis: " + string(pdis))
        draw_text(other.mx,other.my + 30,string_hash_to_newline("idealx: " + string(idealx)))
        draw_text(other.mx,other.my + 40,string_hash_to_newline("idealy: " + string(idealy)))
        draw_text(other.mx,other.my + 50,string_hash_to_newline("idealr: " + string(idealr)))
        draw_text(other.mx,other.my + 60,string_hash_to_newline("x: " + string(x) + "  y: " + string(y)))
        
        mask_index = spr_jump_mask
        if (place_meeting(x,y,par_wall)){
            draw_text(other.mx,other.my + 70,string_hash_to_newline("Landed"))
        }
        mask_index = spr_player_mask
    }
    
}

if keyboard_check(vk_ralt) && room != ShipBuilder{
    draw_set_colour(c_white)
    draw_text(mx,my - 40,string_hash_to_newline("up curh: " + string((lengthdir_x(obj_nav.movespeed*(instance_number(obj_thrustup)),image_angle - 90)))))
    draw_text(mx,my - 30,string_hash_to_newline("up curv: " + string((lengthdir_y(obj_nav.movespeed*(instance_number(obj_thrustup)),image_angle - 90)))))
    draw_text(mx,my - 20,string_hash_to_newline("up velup: " + string(obj_nav.velup)))
    
    draw_text(mx,my - 80,string_hash_to_newline("down curh: " + string((lengthdir_x(obj_nav.movespeed*(instance_number(obj_thrustdown)),image_angle - 90)))))
    draw_text(mx,my - 70,string_hash_to_newline("down curv: " + string((lengthdir_y(obj_nav.movespeed*(instance_number(obj_thrustdown)),image_angle - 90)))))
    draw_text(mx,my - 60,string_hash_to_newline("veldown: " + string(obj_nav.veldown)))
    
    draw_text(mx,my - 120,string_hash_to_newline("left curh: " + string((lengthdir_x(obj_nav.movespeed*(instance_number(obj_thrustleft)),image_angle - 90)))))
    draw_text(mx,my - 110,string_hash_to_newline("left curv: " + string((lengthdir_y(obj_nav.movespeed*(instance_number(obj_thrustleft)),image_angle - 90)))))
    draw_text(mx,my - 100,string_hash_to_newline("velleft: " + string(obj_nav.velleft)))
    
    draw_text(mx,my - 160,string_hash_to_newline("right curh: " + string((lengthdir_x(obj_nav.movespeed*(instance_number(obj_thrustright)),image_angle - 90)))))
    draw_text(mx,my - 150,string_hash_to_newline("right curv: " + string((lengthdir_y(obj_nav.movespeed*(instance_number(obj_thrustright)),image_angle - 90)))))
    draw_text(mx,my - 140,string_hash_to_newline("velright: " + string(obj_nav.velright)))
    
    draw_text(mx,my - 180,string_hash_to_newline("abs(curh) + abs(curv): " + string(abs(obj_nav.curh) + abs(obj_nav.curv))))
}



/* */
/*  */
