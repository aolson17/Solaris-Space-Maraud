pickupable = 1
if room = ShipBuilder && global.loading = 0 && keyboard_check(vk_control){
    x=round(x/32)*32;//Align to grid 6 by 6
    y=round(y/32)*32;
}else if room = ShipBuilder && global.loading = 0{
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}

moved = 1


if room = ShipBuilder && global.loading = 0 && keyboard_check(vk_control){
    if (distance_to_object(obj_wall) = 0) || (distance_to_object(obj_metal) = 0)   || (distance_to_object(par_turret) = 0){
        instance_destroy()
    }
}

image_speed = 0
event_inherited()

