/// @description Get Name

if active = true{
    if mouse = false{
        image_index = 1
    }else{
        image_index = 3
    }
    
    name += keyboard_string
    keyboard_string = ""
    if keyboard_check_pressed(vk_backspace){
        name = string_copy(name,1,string_length(name)-1)    
    }
    if keyboard_check_pressed(vk_escape){
        active = false
    }
    if keyboard_check_pressed(vk_enter){
        active = false
        scr_saveship_mult(name)
    }
}else {
    if mouse = false{
        image_index = 0
    }else{
        image_index = 2
    }
}

