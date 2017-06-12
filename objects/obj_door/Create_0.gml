quickness = 2
instance_create(x,y,obj_doorcol)
opened = 0
if room = ShipBuilder && global.loading = 0{
holding = 1
} else {
holding = 0
}

if room != ShipBuilder{
sprite_index = spr_opendoor2
image_speed = 0
}

event_inherited()

