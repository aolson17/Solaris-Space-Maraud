if room = ShipBuilder && global.loading = 0 && keyboard_check(vk_shift){
    x=round(x/sprite_width)*sprite_width;//Align to grid sprite_width by sprite_height
    y=round(y/sprite_height)*sprite_height;
}else if room = ShipBuilder && global.loading = 0{
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}


if room = ShipBuilder  && global.loading = 0{
    if (distance_to_object(par_flyablesolid) = 0 ) || (distance_to_object(par_obj) = 0 ) || (distance_to_object(obj_life) = 0 ){
        instance_destroy()
    }
}

image_speed = 0
event_inherited()

