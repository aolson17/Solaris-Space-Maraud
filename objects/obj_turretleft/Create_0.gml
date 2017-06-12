
if room = ShipBuilder && global.loading = 0{
image_speed = 0
} else {
randomize()
alarm[0] = floor(random(10))
image_speed=0
}

image_angle = obj_nav.image_angle + 90

event_inherited()

