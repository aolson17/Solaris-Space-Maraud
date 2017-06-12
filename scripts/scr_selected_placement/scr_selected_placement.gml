/// @description scr_selected_placement()
/// @function scr_selected_placement

if keyboard_check(vk_shift) && obj_save_mult.active = false{
    
    if global.selected = object_index && collide = 0{instance_create(x,y,my_obj)}
    
}

if keyboard_check_released(vk_shift){
    instance_destroy()
}
