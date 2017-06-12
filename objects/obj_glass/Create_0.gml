image_speed = 0

if room = ShipBuilder && global.loading = 0 && keyboard_check(vk_alt){
    x=round(x/32)*32;//Align to grid 32 by 32
    y=round(y/32)*32;
}else if room = ShipBuilder && global.loading = 0{
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}

if !keyboard_check(vk_alt) && room = ShipBuilder && global.loading = 0{
holding = 1
} else {
holding = 0
}
if room = ShipBuilder  && global.loading = 0{
    if (distance_to_object(par_flyablesolid) = 0 ) || (distance_to_object(par_obj) = 0 ) || (distance_to_object(obj_life) = 0){
        instance_destroy()
    }
}

event_inherited()

