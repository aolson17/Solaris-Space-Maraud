/// @description Collision



if collision_rectangle(obj_viewcontrol.x + __view_get( e__VW.WView, 0 ) * .3,__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ) + obj_viewcontrol.x,__view_get( e__VW.HView, 0 ) + obj_viewcontrol.y,object_index,false,false){
    collide = 1
}else if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_obj,true,true  || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_flyable,true,true)){
    collide = 1
}else{
	collide = 1
}




x=mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;

//sprite_index = global.selected



image_speed = 0

if keyboard_check_released(vk_space){
    instance_destroy()
}
if mouse_check_button(mb_left) && collide = 0{
	placed = instance_create(round(mouse_x/sprite_width)*sprite_width,round(mouse_y/sprite_height)*sprite_height,my_obj)
	if instance_exists(placed){placed.face = global.selectedface}
}

if keyboard_check_released(ord("V")){
    instance_destroy()
}

