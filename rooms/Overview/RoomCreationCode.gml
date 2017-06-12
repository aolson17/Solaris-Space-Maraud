{
randomize()
var suncount = (floor(random(500)) +2000)*room_width/10000
for (i=0; i < suncount; i++){
    instance_create(random(room_width),random(room_height), obj_sun)
}


}