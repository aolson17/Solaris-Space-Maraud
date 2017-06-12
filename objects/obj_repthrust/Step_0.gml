x =mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;

image_speed = 0

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("Q"))) && face = "up"{
    face = "right"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("E"))) && face = "up"{
    face = "left"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("Q"))) && face = "right"{
    face = "down"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("E"))) && face = "right"{
    face = "up"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("Q"))) && face = "left"{
    face = "up"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("E"))) && face = "left"{
    face = "down"
}else

if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("Q"))) && face = "down"{
    face = "left"
}else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("E"))) && face = "down"{
    face = "right"
}

if face = "up"{sprite_index = spr_thrustup}
if face = "down"{sprite_index = spr_thrustdown}
if face = "left"{sprite_index = spr_thrustleft}
if face = "right"{sprite_index = spr_thrustright}

///Collision

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_flyable,true,true){


collide = 1










}else{
    collide = 0
}

