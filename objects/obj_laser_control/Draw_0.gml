
draw_set_color(c_red)
length = 30

with obj_player{
	other.player_x = scr_rotated(x)
	other.player_y = scr_rotated(y)
}

for (i = 0;i < ds_list_size(laser_x); i++){
    
    if point_distance(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),player_x,player_y) < camera_get_view_width(view_camera)/2{
        draw_line_width(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),ds_list_find_value(laser_x,i)+lengthdir_x(length,ds_list_find_value(laser_angle,i)),ds_list_find_value(laser_y,i)+lengthdir_y(length,ds_list_find_value(laser_angle,i)),4)
    }
    
}

