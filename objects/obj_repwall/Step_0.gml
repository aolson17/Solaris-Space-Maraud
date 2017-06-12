x =mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;

image_speed = 0

if keyboard_check_released(vk_control){
    instance_destroy()
}

///Collision

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_turret,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_life,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_thrust,true,true){


collide = 1


}else{
    collide = 0
}

