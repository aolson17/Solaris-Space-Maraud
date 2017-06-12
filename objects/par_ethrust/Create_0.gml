
// find position compared to center of ship for rotaion
if x > obj_enav.x{
posx = "right"
}else {posx = "left"}

if y > obj_enav.y{
posy = "down"
}else {posy = "up"}

rotpos = "cw"

if room = ShipBuilder{
    mask_index = spr_thrustleft
}else{
    mask_index = spr_thrust_mask
}

event_inherited()

