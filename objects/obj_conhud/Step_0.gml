/// @description Ship Cost

global.shipcost = 0

with (obj_metal){
var price = 10
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)//32 must be minimum number to prevent NaN issue(cannot divide too large number by too small of a number
}
with (obj_wall){
var price = 5
global.shipcost += price + floor(distance_to_object(obj_nav) / 64)
}
with (obj_glass){
var price = 5
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (obj_locker){
var price = 50
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (obj_reactor){
var price = 2500
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (obj_bed){
var price = 100
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (obj_plat){
var price = 5
global.shipcost += price + floor(distance_to_object(obj_nav) / 64)
}
with (obj_door){
var price = 200
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (par_turret){
var price = 4000
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}
with (par_thrust){
var price = 1000
global.shipcost += price + floor(distance_to_object(obj_nav) / 32)
}

