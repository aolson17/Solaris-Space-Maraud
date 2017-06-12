/// @description scr_detect_under()
/// @function scr_detect_under
if collision_point(mouse_x,mouse_y,par_flyable,true,true) != noone{
    pickupable = 0
}else if collision_point(mouse_x,mouse_y,par_wall,true,true) != noone{
    pickupable = 0
}else if collision_point(mouse_x,mouse_y,par_rep,true,true) != noone{
    pickupable = 0
}else{pickupable = 1}
