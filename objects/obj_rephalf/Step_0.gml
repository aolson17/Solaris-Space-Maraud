/// @description Placement
x=mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;


///Collision
if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_obj,true,true){
    collide = 1
}else{
    collide = 0
}

///Selected Placement
scr_selected_placement()
/*
if keyboard_check(vk_shift) && obj_save_mult.active = false{
    
    if global.selected = object_index && collide = 0{instance_create(x,y,my_obj)}
    
}

if keyboard_check_released(vk_shift){
    instance_destroy()
}

/* */
/*  */
