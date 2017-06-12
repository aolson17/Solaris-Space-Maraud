
draw_set_color(c_red)
length = 30

for (i = 0;i < ds_list_size(laser_x); i++){
    
    //draw_sprite_ext(spr_laser,0,ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),1,1,ds_list_find_value(laser_angle,i),c_white,1)
    
    if ds_list_find_value(laser_x,i)>__view_get( e__VW.XView, 0 ) and ds_list_find_value(laser_y,i)>__view_get( e__VW.YView, 0 ) and ds_list_find_value(laser_x,i)<__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ) and ds_list_find_value(laser_y,i)<__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ){
        draw_line_width(ds_list_find_value(laser_x,i),ds_list_find_value(laser_y,i),ds_list_find_value(laser_x,i)+lengthdir_x(length,ds_list_find_value(laser_angle,i)),ds_list_find_value(laser_y,i)+lengthdir_y(length,ds_list_find_value(laser_angle,i)),4)
    }
    
}




