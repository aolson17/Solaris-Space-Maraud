if room = ShipBuilder && global.loading = 0{
    x=round(x/4)*4;//Align to grid 4 by 4
    y=round(y/4)*4;
}
global.togoxy = -1
out = 0
//first = instance_create(x,y,obj_oxygen)
//first.target = id

if room = ShipBuilder && global.loading = 0{
    if (distance_to_object(obj_wall) = 0) || (distance_to_object(obj_metal) = 0)   || (distance_to_object(par_thrust) = 0){
        instance_destroy()
    }
}

image_speed = .4

event_inherited()

