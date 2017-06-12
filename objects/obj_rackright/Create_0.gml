if room = ShipBuilder && global.loading = 0{
holding = 1
image_speed = 0
} else {
holding = 0
}
image_speed = 0
if room = ShipBuilder  && global.loading = 0{
    if (distance_to_object(par_flyablesolid) = 0 ) || (distance_to_object(par_flyable) = 0 ){
        instance_destroy()
    }
}

event_inherited()


