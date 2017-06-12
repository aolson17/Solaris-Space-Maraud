x =mouse_x
y=mouse_y
x=round(x/4)*4;//Align to grid 4 by 4
y=round(y/4)*4;

image_speed = 0



///Collision

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_wall,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,par_obj,true,true) || collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_life,true,true){


collide = 1



}else{
    collide = 0
}

