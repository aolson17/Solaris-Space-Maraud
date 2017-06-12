

if obj_save_mult.active = false{
    
    
    
    if keyboard_check_pressed(ord("V")){
        global.selected = instance_place(mouse_x,mouse_y,par_flyable).object_index
        global.selectedface = instance_place(mouse_x,mouse_y,par_flyable).face
    }
    
    
    
    if keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && mouse_x > x-20 && mouse_x < x+20 && mouse_y>y-20 && mouse_y<y+20){
        instance_create(mouse_x,mouse_y,obj_repselected)
    }
}



///Change Sprite
sprite_index = global.selected

