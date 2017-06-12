x =mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;

image_speed = 0

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("E"))) && face = "1"{
    face = "4"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("Q"))) && face = "1"{
    face = "2"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("E"))) && face = "4"{
    face = "3"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("Q"))) && face = "4"{
    face = "1"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("E"))) && face = "2"{
    face = "1"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("Q"))) && face = "2"{
    face = "3"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("E"))) && face = "3"{
    face = "2"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("Q"))) && face = "3"{
    face = "4"
}

if face = "1"{image_angle = obj_nav.image_angle;my_obj = obj_stairs}
if face = "3"{image_angle = obj_nav.image_angle + 180;my_obj = obj_stairs3}
if face = "2"{image_angle = obj_nav.image_angle + 90;my_obj = obj_stairs2}
if face = "4"{image_angle = obj_nav.image_angle - 90;my_obj = obj_stairs4}

///Collision

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_obj,true,true){


collide = 1










}else{
    collide = 0
}

