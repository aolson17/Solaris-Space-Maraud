/// @description Collision

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_flyable,true,true){
    collide = 1
}else{
    collide = 0
}


x=mouse_x
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

if face = "up"{image_angle = obj_nav.image_angle}
if face = "down"{image_angle = obj_nav.image_angle + 180}
if face = "left"{image_angle = obj_nav.image_angle + 90}
if face = "right"{image_angle = obj_nav.image_angle - 90}
/*if face = "up"{sprite_index = spr_turret}
if face = "down"{sprite_index = spr_turretdown}
if face = "left"{sprite_index = spr_turretleft}
if face = "right"{sprite_index = spr_turretright}

/* */
/*  */
