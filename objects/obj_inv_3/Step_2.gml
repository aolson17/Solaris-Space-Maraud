x= obj_player.x - 192
y = obj_player.y + 160
x= obj_player.x + lengthdir_x(252,obj_player.image_angle - 139)
y = obj_player.y + lengthdir_y(252,obj_player.image_angle - 139)
image_angle = obj_player.image_angle

if keyboard_check(vk_tab) {
    visible = true
} else {
    visible = false
}

script_execute(scr_invsprite,invnum)

if mouse_check_button_pressed(mb_left) && distance_to_point(mouse_x,mouse_y) = 0 && keyboard_check(vk_tab){
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


