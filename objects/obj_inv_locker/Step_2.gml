if object_exists(obj_locker)/* && distance_to_object(obj_locker) = 0 */{
x = link.x
y = link.y
image_angle = link.image_angle
} else {
    instance_destroy()
}
if room != ShipBuilder {
if keyboard_check(vk_tab) && distance_to_object(obj_player) <= global.invrange{
    visible = true
} else {
    visible = false
}


script_execute(scr_invsprite,invnum)

if mouse_check_button_pressed(mb_left) && distance_to_point(mouse_x,mouse_y) = 0 && distance_to_object(obj_player) <= global.invrange && keyboard_check(vk_tab){
    if global.inv[invnum,0] != -1 && global.inv[0,0] = -1{
        global.inv[0,0] = global.inv[invnum,0]
        global.inv[invnum,1] -= 1
    } else if global.inv[invnum,0] = -1 && global.inv[0,0] != -1 {
        global.inv[invnum,0] = global.inv[0,0]
        global.inv[invnum,1] = 1
        global.inv[0,0] = -1
    } else if global.inv[invnum,0] = global.inv[0,0] && global.inv[invnum,1] < 5{
        global.inv[invnum,1] += 1
        global.inv[0,0] = -1
    }
}
}




/* */
///Manage Depth
if room != ShipBuilder{
if distance_to_object(obj_player) = 0 {
    depth = 2
}else {
    depth = -300
}

}

/* */
/*  */
