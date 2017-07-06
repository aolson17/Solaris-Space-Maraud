
draw_set_color(c_red)
length = 30

for (i = 0;i < ds_list_size(laser_x); i++){
    
    if point_distance(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),obj_player.x,obj_player.y) < camera_get_view_width(view_camera)/2{
        draw_line_width(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),ds_list_find_value(laser_x,i)+lengthdir_x(length,ds_list_find_value(laser_angle,i)),ds_list_find_value(laser_y,i)+lengthdir_y(length,ds_list_find_value(laser_angle,i)),4)
    }
    
}

